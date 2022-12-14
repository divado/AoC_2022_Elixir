defmodule AoC2022 do
  @moduledoc """
  Documentation for `AoC2022`.
  """
  import Helpers

  use Solutions.Day01
  use Solutions.Day02
  use Solutions.Day03
  use Solutions.Day04
  use Solutions.Day05
  use Solutions.Day06

  def start(_type, _args) do
    # For debugging in VS Code, when launcher.json is used to call "mix run" with debugging enabled
    # Then uncomment the section below and call the function you would like to debug
    {:ok, self()}
  end

  def get(year_day_level) do
    [year, day, level] = parse(year_day_level)
    input = get_input(year, day)
    answer = solve(input, year_day_level)
    %{year: year, day: day, level: level, answer: answer}
  end

  def submit(%{year: year, day: day, level: level, answer: answer}) do
    post_answer(year, day, level, answer)
  end
end
