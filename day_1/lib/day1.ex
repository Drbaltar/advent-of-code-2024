defmodule Day1 do
  def main do
    read_input()
    |> split_text_into_pairs
    |> Enum.map(&split_pair_into_list/1)
    |> filter_illegal_pairs
    |> Enum.map(&convert_to_int/1)
    |> Enum.zip_with(&Function.identity/1)
    |> Enum.map(&Enum.sort/1)
    |> Enum.zip_with(&Function.identity/1)
    |> Enum.map(&calculate_difference/1)
    |> Enum.sum
  end

  def read_input() do
    {_status, binary} = File.read("input.txt")
    binary
  end

  def split_text_into_pairs(raw_input) do
    String.split(raw_input, "\n")
  end

  def split_pair_into_list(raw_pair) do
    String.split(raw_pair, "   ")
  end

  def filter_illegal_pairs(pairs) do
    Enum.filter(pairs, fn entry -> length(entry) == 2 end)
  end

  def convert_to_int(string_pair) do
    Enum.map(string_pair, &String.to_integer/1)
  end

  def calculate_difference(pair) do
    [first, second] = pair
    abs(first - second)
  end
end
