defmodule Topo.PointLine do
  @moduledoc false

  @spec relate(list, {number, number}) :: atom
  def relate([_], _), do: :disjoint
  def relate([a, b | rest], p) do
    cond do
      a == p -> :vertex
      b == p -> :vertex
      Topo.Util.collinear?(a, b, p) && Topo.Util.between?(a, b, p) -> :edge
      true -> relate([b | rest], p)
    end
  end
end
