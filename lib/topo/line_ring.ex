defmodule Topo.LineRing do
  @moduledoc false

  alias Topo.Util
  alias Topo.PointRing

  @spec intersects?(list, list) :: boolean
  def intersects?(ring, line) do
    Util.any_edge_pair_not?(ring, line, :disjoint) || contains?(ring, line)
  end

  @spec contains?(list, list) :: boolean
  def contains?(ring, line) do
    (PointRing.any_point?(ring, line, :interior) || any_midpoint_interior?(ring, line)) &&
      !PointRing.any_point?(ring, line, :disjoint)
  end

  defp any_midpoint_interior?(_, [_]), do: false

  defp any_midpoint_interior?(a, [b1, b2 | rest]) do
    PointRing.relate(a, Util.midpoint(b1, b2)) == :interior ||
      any_midpoint_interior?(a, [b2 | rest])
  end

  @spec none_contain_line?(list, list) :: boolean
  def none_contain_line?(rings, line) do
    !Enum.any?(rings, fn ring ->
      !Util.any_edge_pair_not?(ring, line, :disjoint) && contains?(ring, line)
    end)
  end

  @spec line_exterior_to_all?(list, list) :: boolean
  def line_exterior_to_all?(rings, line) do
    Enum.all?(rings, fn ring ->
      !Util.any_edge_pair?(ring, line, :interior) && PointRing.any_point?(ring, line, :disjoint)
    end)
  end
end
