defmodule Examples.Example1 do
  # Both args are integers
  def add(a, b) when is_integer(a) and is_integer(b), do: a + b

  # At least one arg is a non-integer
  def add(a, b) when is_number(a) and is_number(b), do: trunc(a) + trunc(b)

  # One or both args are non-numeric
  def add(_, _), do: {:error, :badarg}

  # Empty list case
  def list_length([]), do: {:error, :must_be_even}

  # List w/at least 1 item
  def list_length(n) when is_list(n) do
    check_size(length(n))
  end

  defp check_size(size) when rem(size, 2) == 0, do: size
  defp check_size(_size), do: {:error, :must_be_even}
end
