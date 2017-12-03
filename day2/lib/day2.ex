defmodule Day2 do
  @input Application.get_env(:day2, :input)
  #@testinput Application.get_env(:day2, :testinput)

  @doc """
  Calculate the spreadsheet's checksum. For each row, determine the difference
  between the largest value and the smallest value; the checksum is the sum of
  all of these differences.
  """
  def part1(input \\ @input) do
    # Separate to rows by splitting per newlines
    Regex.split( ~r/\r|\n|\r\n/, String.trim(input))
    # Split by tabs to create list of lists, where each sublist is a row.
    |> Enum.map(fn(row) ->
      String.split(row, "\t")
      # Convert all strings to integers
      |> Enum.map(fn(item) -> String.to_integer(item) end)
      # Sort each from smallest to biggest
      |> Enum.sort()
      # Drop all duplicates, as we dont care about those per row
      |> Enum.uniq()
    end)
    # Find the smallest and biggest of each (conveniently first and last)
    |> Enum.map(fn(row) ->
      smallest = List.first(row)
      biggest  = List.last(row)
      # Deduce the smallest from the biggest, getting the differnece
      biggest - smallest
    end)
    # Get the sum
    |> Enum.sum()
  end
end
