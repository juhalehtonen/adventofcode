defmodule Day9 do
  @input Application.get_env(:day9, :input)

  def part1(input \\ @input) do
    input
    |> String.trim()
    |> String.split("")
    |> parse_input()
  end

  @doc """
  1. Trim and split input, and pass to parse/2 (the outermost group gets a score of 1)
  2. For each new group_depth of nesting, increment group_depth and move onwards
  3. Move up one level of group_depth as we reach the end of a group
  4. Pass start of garbage to the parse_garbage function...
  5. ...which passes us back to parse_input when garbage is done
  """
  def parse_input(string), do: parse_input(string, 1) # 1
  def parse_input(["{" | rest], group_depth), do: group_depth + parse_input(rest, group_depth + 1) # 2

  def parse_input(["," | rest], group_depth), do: parse_input(rest, group_depth)
  def parse_input([""  | rest], group_depth), do: parse_input(rest, group_depth)
  def parse_input(["}" | rest], group_depth), do: parse_input(rest, group_depth - 1) # 3
  def parse_input(["<" | rest], group_depth), do: parse_garbage(rest, group_depth) # 4
  def parse_input([], _group_depth), do: 0 # We ran out of characters to parse

  def parse_garbage(["!", _ | rest], group_depth), do: parse_garbage(rest, group_depth)
  def parse_garbage([">" | rest], group_depth), do: parse_input(rest, group_depth) # 5
  def parse_garbage([_ | rest], group_depth), do: parse_garbage(rest, group_depth)
end
