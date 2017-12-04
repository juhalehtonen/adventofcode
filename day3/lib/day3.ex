defmodule Day3 do
  @input Application.get_env(:day3, :input)
  @testinput Application.get_env(:day3, :testinput)

  def part1(input \\ @input) do
    Regex.split( ~r/\r|\n|\r\n/, String.trim(input))
    |> Enum.map(fn(phrase) -> String.split(phrase, " ") end)
    |> Enum.filter(fn(p) -> p == Enum.uniq(p) end)
    |> length()
  end
end
