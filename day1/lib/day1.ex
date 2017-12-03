defmodule Day1 do
  @moduledoc """
  Solutions to Day 1 of the Advent of Code 2017, the "reverse captcha".
  """
  @input Application.get_env(:day1, :input)

  @doc """
  Task 1

  The captcha requires you to review a sequence of digits (your puzzle input)
  and find the sum of all digits that match the next digit in the list. The list
  is circular, so the digit after the last digit is the first digit in the list.
  """
  def solution1(input \\ @input) do
    input
    |> String.codepoints() # Convert huge string into list of strings
    |> Enum.map(fn(x) -> String.to_integer(x) end) # Convert each string to integer
    |> (fn(numbers) -> numbers ++ Enum.take(numbers, 1) end).() # Take the first item and append to the end (for circularity)
    |> Enum.chunk_every(2, 1, :discard) # Split the list to chunks of two with overlap of 1
    |> Enum.filter(fn([a, b]) -> a == b end) # Remove pairs that do not match
    |> Enum.map(fn([a, _]) -> a end) # Take the first item from each pair
    |> Enum.sum() # Get total sum of all matching numbers
  end


  @doc """
  Task 2

  Now, instead of considering the next digit, it wants you to consider the digit
  halfway around the circular list. That is, if your list contains 10 items, only
  include a digit in your sum if the digit 10/2 = 5 steps forward matches it.
  Fortunately, your list has an even number of elements.
  """


    def solution2(input) do
      input
      |> String.codepoints() # Convert huge string into list of strings
      |> Enum.map(fn(x) -> String.to_integer(x) end) # Convert each string to integer

      # Double the list
      |> (fn(list) ->
        list ++ list
      end).()

      # Split the list into overlapping subarrays of the length
      # of the list floor divided by 2 and add 1
      # The last item in the each resulting list will be the
      # number that is "halfway around"
      |> Enum.chunk_every(trunc(length(input) / 2) + 1, 1)

      # We now have twice as many sub lists as we want and the last half
      # are junk anyway, so just grab  the ones we want
      |> Enum.take(length(input))

      # Filter out pairs that are not the same
      |> Enum.filter(fn(item) ->
        # Compare first and last indexs of list
        hd(item) == Enum.at(item, -1)
      end)

      # Take the first item from each pair
      |> Enum.map(&hd/1)

      # Sum them
      |> Enum.sum
    end
end
