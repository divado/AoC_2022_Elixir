defmodule Solutions.Day02 do

  defmacro __using__(_opts) do
    quote do
      def solve(input, 22_02_01) do
        array = RockPaperScissor.to_array_abc_xyz(input)
        strategy = RockPaperScissor.to_strategy(array)
        score = RockPaperScissor.get_my_total(strategy)
        score
      end

       def solve(input, 22_02_02) do
        array = RockPaperScissor.to_array_abc_xyz(input)
        strategy = RockPaperScissor.to_strategy_based_on_opp(array)
        score = RockPaperScissor.get_my_total(strategy)
        score
      end
    end
  end
end

defmodule RockPaperScissor do

  def to_array_abc_xyz(input) do
    input
    |>String.split("\n", trim: true)
    |>Enum.map(fn x -> String.split(x, " ") end)
  end

  def to_strategy(array) do
    Enum.map(array, fn [p1, p2] -> [
      case p1 do
        "A" -> :rock
        "B" -> :paper
        "C" -> :scissor
      end,

      case p2 do
        "X" -> :rock
        "Y" -> :paper
        "Z" -> :scissor
      end
    ] end)
  end

  def to_strategy_based_on_opp(array) do
    Enum.map(array, fn [p1, p2] ->
      a =
        case p1 do
          "A" -> :rock
          "B" -> :paper
          "C" -> :scissor
        end

      b = select_shape(a, p2)
      [a, b]
    end)
  end

  defp get_score(:rock, :rock), do: [1+3, 1+3]
  defp get_score(:rock, :paper), do: [1+0, 2+6]
  defp get_score(:rock, :scissor), do: [1+6, 3+0]

  defp get_score(:paper, :rock), do: [2+6, 1+0]
  defp get_score(:paper, :paper), do: [2+3, 2+3]
  defp get_score(:paper, :scissor), do: [2+0, 3+6]

  defp get_score(:scissor, :rock), do: [3+0, 1+6]
  defp get_score(:scissor, :paper), do: [3+6, 2+0]
  defp get_score(:scissor, :scissor), do: [3+3, 3+3]

  defp select_shape(:rock, "X"), do: :scissor
  defp select_shape(:rock, "Y"), do: :rock
  defp select_shape(:rock, "Z"), do: :paper

  defp select_shape(:paper, "X"), do: :rock
  defp select_shape(:paper, "Y"), do: :paper
  defp select_shape(:paper, "Z"), do: :scissor

  defp select_shape(:scissor, "X"), do: :paper
  defp select_shape(:scissor, "Y"), do: :scissor
  defp select_shape(:scissor, "Z"), do: :rock

  def sum_both(results) do
    results
    |>Enum.reduce(
      [0, 0],
      fn [a, b], [x, y] ->
        [a+x, b+y]
      end
    )
  end

  def get_my_total(moves) do
    scores = Enum.map(moves, fn [x, y] -> get_score(x, y) end)
    total = sum_both(scores)
    my_score = Enum.at(total, -1)
    my_score
  end


end
