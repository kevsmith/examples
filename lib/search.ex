defmodule Examples.IndexEntry do
  defstruct [:line, :column]
end

defmodule Examples.Search do
  alias Examples.IndexEntry

  @spec build_index!(String.t()) :: Map
  def build_index!(file_path) do
    text = File.read!(file_path)

    lines =
      remove_punctuation(text)
      |> String.downcase()
      |> String.split("\n", trim: true)
      |> Enum.with_index()

    Enum.reduce(lines, %{}, &parse_line/2)
  end

  def search(index, word) do
    {:ok, Map.get(index, word, [])}
  end

  def parse_line({text, line}, index) do
    {_, _, index} =
      Enum.reduce(String.split(text, " ", trim: true), {line + 1, 1, index}, &insert_terms/2)

    index
  end

  def insert_terms(word, {line, column, index}) do
    entry = %IndexEntry{line: line, column: column}
    index = Map.update(index, word, [entry], &[entry | &1])
    {line, column + String.length(word) + 1, index}
  end

  defp remove_punctuation(text) do
    String.replace(text, ~r/[\.,;:]/, "")
  end
end
