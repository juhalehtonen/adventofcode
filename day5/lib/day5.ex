defmodule Day5 do
  @input Application.get_env(:day5, :input)
  #@testinput Application.get_env(:day5, :testinput)

  @doc """
  1. Split input to by rows
  2. Convert list of strings to list of integers
  3. Find the min and max of the list, to understand when we are out of the list
  4. Go through each item, keeping count of how many steps we have taken
  """
  def part1(input \\ @input) do
    instructions = Regex.split( ~r/\r|\n|\r\n/, String.trim(input)) # 1
    |> Enum.map(fn(x) -> String.to_integer(x) end) # 2

    # 3
    max = Enum.max(instructions)
    min = Enum.min(instructions)
    start = hd(instructions)

    # 4
    Enum.reduce(instructions), start, fn(x, acc) -> x + acc end)
  end

  @doc """
  Perform a 'jump' based on the starting offset.

  Jumps are relative to the list based on where you are.

  Whenever you follow an instruction, you increment that instruction by 1.
  """
  def jump(offset, stepcount) do
    offset
    # %{steps: 0, current_index: 0}
    # Update at position
    # List.update_at(instructions, current_index, &(&1 + 1))
  end
end
