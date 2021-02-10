defmodule Example2Test do
  use ExUnit.Case

  alias Examples.Example2

  test "empty list" do
    assert [] = Example2.flatten([])
  end

  test "simple list" do
    assert [1, 2, 3] = Example2.flatten([1, 2, 3])
  end

  test "nested lists" do
    assert [1, 1, 2, 3, 4, 5, 6] = Example2.flatten([1, [1, 2, [3, [4], [5, 6]]]])
    assert [1, 2, 3, 4, 5, 6] = Example2.flatten([1, [2, [3, 4], 5, [6]]])
  end
end
