defmodule Examples.Example2 do
  def flatten(data) when is_list(data) do
    Enum.reverse(flatten(data, []))
  end

  def flatten([], accum), do: accum

  def flatten([h | t], accum) when is_list(h) do
    flatten(t, flatten(h, accum))
  end

  def flatten([h | t], accum) do
    flatten(t, [h | accum])
  end
end
