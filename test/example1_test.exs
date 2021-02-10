defmodule Example1Test do
  use ExUnit.Case

  alias Examples.Example1

  describe "Summing numeric inputs work as expected" do
    test "integers" do
      assert 3 = Example1.add(1, 2)
    end

    test "float and integer" do
      assert 100 = Example1.add(99.7, 1)
    end

    test "integer and float" do
      assert 55 = Example1.add(54, 1.5)
    end
  end

  describe "Summing non-numeric types fail" do
    test "strings" do
      assert {:error, :badarg} = Example1.add("1", "2")
    end

    test "string and list" do
      assert {:error, :badarg} = Example1.add("1", [1, 2, 3])
    end

    test "list and tuple" do
      assert {:error, :badarg} = Example1.add([1], {"hello", "there"})
    end
  end

  describe "lists with even length work as expected" do
    test "small list" do
      assert 2 = Example1.list_length([1, 2])
    end

    test "medium list" do
      assert 10 = Example1.list_length([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    end

    test "big list" do
      assert 50 = Example1.list_length(:lists.seq(1, 50, 1))
    end
  end

  describe "lists with odd length fail as expected" do
    test "empty list" do
      assert {:error, :must_be_even} = Example1.list_length([])
    end

    test "small list" do
      assert {:error, :must_be_even} = Example1.list_length([1])
    end

    test "medium list" do
      assert {:error, :must_be_even} = Example1.list_length([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    test "big list" do
      assert {:error, :must_be_even} = Example1.list_length(:lists.seq(1, 67, 1))
    end
  end

  describe "non lists raise error" do
    test "integer" do
      assert_raise(FunctionClauseError, fn -> Example1.list_length(1) end)
    end

    test "tuple" do
      assert_raise(FunctionClauseError, fn -> Example1.list_length({"foo", "bar"}) end)
    end
  end
end
