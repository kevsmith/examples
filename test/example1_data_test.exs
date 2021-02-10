defmodule Example1DataTest do
  use ExUnit.Case

  alias Examples.Example1

  # Ensure we recompile whenever test data changes
  @external_resource "test/test_data.json"

  [data] = Jason.decode!(File.read!("test/test_data.json"))

  for {name, %{"expected" => expected, "values" => [a, b]}} <- data do
    test "#{name}" do
      assert unquote(expected) = Example1.add(unquote(a), unquote(b))
    end
  end
end
