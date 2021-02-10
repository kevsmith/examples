defmodule Example1DataTest do
  use ExUnit.Case

  alias Examples.Example1

  # Ensure we recompile whenever test data changes
  @external_resource "test/test_data.json"

  setup do
    [data] = Jason.decode!(File.read!("test/test_data.json"))
    %{data: data}
  end

  test "integers", %{data: data} do
    %{"values" => [a, b], "expected" => expected} = Map.get(data, "integers")
    assert ^expected = Example1.add(a, b)
  end
end
