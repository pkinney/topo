defmodule Topo.RingRing do
  @moduledoc false

  alias Topo.Util
  alias Topo.PointRing

  @spec intersects?(list, list) :: boolean
  def intersects?(a, b) do
    Util.any_edge_pair_not?(a, b, :disjoint)
      || !PointRing.any_point?(a, b, :disjoint)
      || !PointRing.any_point?(b, a, :disjoint)
  end

  @spec overlaps?(list, list) :: boolean
  def overlaps?(a, b) do
    Util.any_edge_pair?(a, b, :interior)
      || (PointRing.any_point?(a, b, :interior) || PointRing.any_point?(b, a, :interior))
  end

  @spec contains?(list, list) :: boolean
  def contains?(a, b) do
    !Util.any_edge_pair?(a, b, :interior)
      && !PointRing.any_point?(a, b, :disjoint)
  end

  @spec none_contain_ring?(list, list) :: boolean
  def none_contain_ring?(rings, b) do
    Enum.all? rings, fn ring ->
      Util.any_edge_pair_not?(ring, b, :disjoint) || PointRing.any_point?(ring, b, :disjoint)
    end
  end
end
