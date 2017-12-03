defmodule Day2 do
  @input Application.get_env(:day2, :input)
  @testinput1 Application.get_env(:day2, :testinput1)
  @testinput2 Application.get_env(:day2, :testinput2)

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


  @doc """
  Find the only two numbers in each row where one evenly divides the other -
  that is, where the result of the division operation is a whole number. They
  would like you to find those numbers on each line, divide them, and add up
  each line's result.
  """
  def part2(input \\ @testinput2) do
    # Separate to rows by splitting per newlines
    Regex.split( ~r/\r|\n|\r\n/, String.trim(input))
    # Split by tabs to create list of lists, where each sublist is a row.
    |> Enum.map(fn(row) ->
      String.split(row, "\t")
      # Convert all strings to integers
      |> Enum.map(fn(item) -> String.to_integer(item) end)
    end)
  end
end
