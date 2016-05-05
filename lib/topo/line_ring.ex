defmodule Topo.LineRing do
  alias Topo.Util
  alias Topo.PointRing

  def intersects?(ring, line) do
    Util.any_edge_pair_not?(ring, line, :disjoint)
      || contains?(ring, line)
  end

  def contains?(ring, line) do
    (PointRing.any_point?(ring, line, :interior)
      || any_midpoint_interior?(ring, line))
      && !PointRing.any_point?(ring, line, :disjoint)
  end

  defp any_midpoint_interior?(_, [_]), do: false
  defp any_midpoint_interior?(a, [b1, b2 | rest]) do
    PointRing.relate(a, Util.midpoint(b1, b2)) === :interior
      || any_midpoint_interior?(a, [b2 | rest])
  end

  def none_contain_line?(rings, line) do
    !Enum.any? rings, fn ring ->
      !Util.any_edge_pair_not?(ring, line, :disjoint)
        && contains?(ring, line)
    end
  end

  def line_exterior_to_all?(rings, line) do
    Enum.all? rings, fn ring ->
      !Util.any_edge_pair?(ring, line, :interior)
        && PointRing.any_point?(ring, line, :disjoint)
    end
  end
end
