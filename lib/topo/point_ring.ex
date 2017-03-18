defmodule Topo.PointRing do
  @moduledoc false

  @type point :: {number, number}

  @spec relate(list, point) :: atom
  def relate(ring, {px, py}) do
    ring = for {x, y} <- ring, do: {x - px, y - py}

    {left_crosses, right_crosses} = count_crossing(ring)

    cond do
      right_crosses == :vertex -> :vertex
      rem(right_crosses, 2) != rem(left_crosses, 2) -> :edge
      rem(right_crosses, 2) == 1 -> :interior
      true -> :disjoint
    end
  end

  @spec relate_multi(list, point) :: atom
  def relate_multi([], _), do: :disjoint
  def relate_multi([a | rest], point) do
    case relate(a, point) do
      :disjoint -> relate_multi(rest, point)
      res -> res
    end
  end

  @spec any_point?(list, list, atom) :: boolean
  def any_point?(ring, points, rel) do
    Enum.any? points, fn p ->
      relate(ring, p) == rel
    end
  end

  defp count_crossing([_]), do: {0, 0}
  defp count_crossing([{0, 0} | _]), do: {:vertex, :vertex}
  defp count_crossing([{ax, ay}, {bx, by} | rest]) do
    {left_crosses, right_crosses} = count_crossing([{bx, by} | rest])

    cond do
      left_crosses == :vertex -> {:vertex, :vertex}
      ((ay > 0) != (by > 0)) && (ax * by - bx * ay) / (by - ay) > 0 -> {left_crosses, right_crosses + 1}
      ((ay < 0) != (by < 0)) && (ax * by - bx * ay) / (by - ay) < 0 -> {left_crosses + 1, right_crosses}
      true -> {left_crosses, right_crosses}
    end
  end
end
