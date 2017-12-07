defmodule Day7 do
  @input Application.get_env(:day7, :input)

  @doc """
  What is the name of the BOTTOM PROGRAM?

  1. Split input to individual rows, each row representing a tower.
  2. Filter out the topmost towers, as they are not relevant to us.
  3. Map out the upper towers of each tower.
  4. Construct two of towers: those that hold something that those that are on top of something
  """
  def part1(input \\ @input) do
    Regex.split( ~r/\r|\n|\r\n/, String.trim(input)) # 1
    |> Enum.filter(fn(tower) -> String.contains?(tower, "->") end) # 2
    |> Enum.map(fn(tower) -> get_upper_towers(tower) end) # 3
    |> construct_tower_lists() # 4
  end

  @doc """
  Get upper towers of a given tower.
  """
  def get_upper_towers(tower) do
    [lower, uppers] = tower |> String.split("->", trim: true)
    lower = String.trim(lower)
    uppers = String.trim(uppers) |> String.split(", ")

    %{lower: lower, uppers: uppers}

    # Se joka on alimmaisena ei ole minkään näiden päällä. Poistettiin myös jo
    # ne aiemmat huipputornit, joten ei ole niitä.
    #
    # 1. Tee lista kaikista torneista jotka on jonkun päällä.
    # 2. Tee lista kaikista torneista jotka kannattelee jotakin.
    # 3. Vertaa näitä. Kannatteleva torni on VAIN listasssa 2, ei listassa 1.
  end

  def construct_tower_lists(towers) do
    # TODO: Construct two lists to compare those
  end
end
