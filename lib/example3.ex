defmodule Examples.Example3 do
  def count_em(data), do: count_em(data, %{})

  def count_em([], counts) do
    counts
  end

  def count_em([item | t], counts) do
    count_em(t, Map.update(counts, item, 1, &(&1 + 1)))
  end

  def reduce_em(data) do
    Enum.reduce(data, %{}, &Map.update(&2, &1, 1, fn x -> x + 1 end))
  end
end
