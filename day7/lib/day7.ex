defmodule Day7 do
  @input Application.get_env(:day7, :input)

  @doc """
  What is the name of the BOTTOM PROGRAM?

  1. Split input to individual rows, each row representing a tower.
  2. Filter out the topmost towers, as they are not relevant to us.
  3. Map out the upper towers of each tower.
  4. Construct two of towers: those that hold something that those that are on top of something
  5. Compare the two lists of towers and find the one that is a LOWER but is NOT UPPER
  """
  def part1(input \\ @input) do
    Regex.split( ~r/\r|\n|\r\n/, String.trim(input)) # 1
    |> Enum.filter(fn(tower) -> String.contains?(tower, "->") end) # 2
    |> Enum.map(fn(tower) -> get_upper_towers(tower) end) # 3
    |> construct_tower_lists() # 4
    |> compare_tower_lists() # 5
  end

  @doc """
  Get upper towers of a given tower.
  Returns a map of given lower tower and all upper towers above it.
  """
  def get_upper_towers(tower) do
    # Split to lower and uppers by the `->`
    [lower, uppers] = tower |> String.split("->", trim: true)
    # Clean lower by removing everything but the name
    lower = String.replace(lower, ~r/\([^)]*\)/, "") |> String.trim()
    # Clean uppers by trimming and splitting to list
    uppers = String.trim(uppers) |> String.split(", ")
    # Return map of lower and uppers for each tower
    %{lower: lower, uppers: uppers}
  end

  def construct_tower_lists(towers) do
    # Get the list of lower towers
    lowers_list = Enum.map(towers, fn(tower) -> tower.lower end) |> Enum.to_list()
    # Get the list of upper towers and flatten the result
    uppers_list = Enum.map(towers, fn(tower) ->
      Enum.map(tower.uppers, fn(tower) -> tower end)
    end) |> Enum.to_list() |> List.flatten()

    # Return tuple of lowers and uppers
    {lowers_list, uppers_list}
  end

  @doc """
  Compare two given lists and return the difference.
  The `--` operator returns the difference between two lists
  """
  def compare_tower_lists(tower_lists) do
    {lowers, uppers} = tower_lists
    lowers -- uppers
  end
end
