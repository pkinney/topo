defmodule Topo.RingRing do
  alias Topo.Util
  alias Topo.PointRing

  def intersects?(a, b) do
    Util.any_edge_pair_not?(a, b, :disjoint)
      || !PointRing.any_point?(a, b, :disjoint)
      || !PointRing.any_point?(b, a, :disjoint)
  end

  def overlaps?(a, b) do
    Util.any_edge_pair?(a, b, :interior)
      || (PointRing.any_point?(a, b, :interior) || PointRing.any_point?(b, a, :interior))
  end

  def contains?(a, b) do
    !Util.any_edge_pair?(a, b, :interior)
      && !PointRing.any_point?(a, b, :disjoint)
  end

  def none_contain_ring?(rings, b) do
    Enum.all? rings, fn ring ->
      Util.any_edge_pair_not?(ring, b, :disjoint) || PointRing.any_point?(ring, b, :disjoint)
    end
  end
end
