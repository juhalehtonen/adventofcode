defmodule Day3 do
  @input Application.get_env(:day3, :input)
  @testinput Application.get_env(:day3, :testinput)

  def part1(input \\ @input) do
    Regex.split( ~r/\r|\n|\r\n/, String.trim(input))
    |> Enum.map(fn(phrase) -> String.split(phrase, " ") end)
    |> Enum.filter(fn(p) -> p == Enum.uniq(p) end)
    |> length()
  end

  @doc """
  1. Sort all words in a phrase alphabetically
  2. Remove non-unique words from the list of words
  3. Compare original sorted list to unique-removed sorted list
  4. If the two in part three do not match, you had an anagram there and thus the phrase is INVALID
  5. Filter the ones out that match condition in 4, get sum of non-anagrammy phrases
  """
  def part2(input \\ @input) do
    Regex.split( ~r/\r|\n|\r\n/, String.trim(input))
    |> Enum.map(fn(phrase) -> String.split(phrase, " ") end)
    |> Enum.map(fn(phrase) ->
      phrase
      |> Enum.uniq()
      |> Enum.map(fn(word) ->
        word
        |> sort_string()
      end)
    end)
  end

  def anagrams?(a, b) when is_binary(a) and is_binary(b) do
    sort_string(a) == sort_string(b)
  end

  def sort_string(string) do
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
