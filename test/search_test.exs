defmodule SearchTest do
  use ExUnit.Case

  alias Examples.Search

  setup do
    index = Search.build_index!("./test/text.txt")
    {:ok, %{index: index}}
  end

  test "index size is correct", %{index: index} do
    assert 135 = Enum.count(index)
  end

  test "search hits are correct", %{index: index} do
    {:ok, r} = Search.search(index, "birds")
    assert 8 = Enum.count(r)
    {:ok, r} = Search.search(index, "nests")
    assert 1 = Enum.count(r)
  end

  test "index was properly constructed", %{index: index} do
    unfiltered_size = Enum.count(index)
    filtered_size = Map.keys(index) |> Enum.reject(&(String.length(&1) == 0)) |> Enum.count()
    assert unfiltered_size == filtered_size
  end
end
