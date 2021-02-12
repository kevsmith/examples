defmodule Example3Test do
  use ExUnit.Case

  alias Examples.Example3

  test "count_em with data" do
    assert %{"a" => 2, "b" => 1, "c" => 5} =
             Example3.count_em(["a", "b", "c", "a", "c", "c", "c", "c"])
  end

  test "count_em without data" do
    assert %{} = Example3.count_em([])
  end

  test "reduce_em with data" do
    assert %{"x" => 3, "y" => 2, "z" => 3} =
             Example3.reduce_em(["x", "y", "z", "x", "y", "z", "x", "z"])
  end

  test "reduce_em with no data" do
    assert %{} = Example3.reduce_em([])
  end

  test "reduce_em and count_em are equivalent" do
    data = String.split("g a t t a c c g a")
    assert Example3.count_em(data) == Example3.reduce_em(data)
    assert %{"g" => 2, "a" => 3, "t" => 2, "c" => 2} = Example3.count_em(data)
  end
end
