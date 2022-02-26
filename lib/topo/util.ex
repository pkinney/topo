defmodule Topo.Util do
  @moduledoc false

  @type point :: {number, number}

  @spec cross(point, point, point) :: number
  def cross({ax, ay}, {bx, by}, {cx, cy}) do
    {ax - cx, ay - cy}
    |> Vector.cross({bx - cx, by - cy})
    |> Vector.component(:z)
  end

  @spec collinear?(point, point, point) :: boolean
  def collinear?(a, b, c) do
    cross(a, b, c) == 0
  end

  @spec between?(point, point, point) :: boolean
  def between?({ax, ay}, {bx, by}, {px, py})
      when ax == bx and ay == by and (px != ax and py != ay),
      do: false

  def between?({ax, ay}, {bx, by}, {_, py}) when ax == bx and ay != by,
    do: (ay <= py && py <= by) || (ay >= py && py >= by)

  def between?({ax, _}, {bx, _}, {px, _}), do: (ax <= px && px <= bx) || (ax >= px && px >= bx)

  @spec assert_no_collinear(list) :: list
  def assert_no_collinear([a, b, c | rest]) do
    if collinear?(a, c, b) && between?(a, c, b) do
      assert_no_collinear([a, c | rest])
    else
      [a] ++ assert_no_collinear([b, c | rest])
    end
  end

  def assert_no_collinear(ring), do: ring

  @spec midpoint(point, point) :: point
  def midpoint(a, b) do
    Vector.divide(Vector.add(a, b), 2)
  end

  @spec any_edge_pair_not?(list, list, atom) :: boolean
  def any_edge_pair_not?(a, b, rel) do
    do_any_edge_pair?(a, b, fn a1, a2, b1, b2 ->
      elem(SegSeg.intersection(a1, a2, b1, b2, strict: false), 1) != rel
    end)
  end

  @spec any_edge_pair?(list, list, atom) :: boolean
  def any_edge_pair?(a, b, rel) do
    do_any_edge_pair?(a, b, fn a1, a2, b1, b2 ->
      elem(SegSeg.intersection(a1, a2, b1, b2, strict: false), 1) == rel
    end)
  end

  @spec do_any_edge_pair?(list, list, function) :: boolean
  defp do_any_edge_pair?(_, [_], _), do: false

  defp do_any_edge_pair?(a, [b1, b2 | rest], fun) do
    any_edge?(a, [b1, b2], fun) || do_any_edge_pair?(a, [b2 | rest], fun)
  end

  @spec any_edge?(list, list, function) :: boolean
  defp any_edge?([_], _, _), do: false

  defp any_edge?([a1, a2 | rest], [b1, b2], fun) do
    fun.(a1, a2, b1, b2) || any_edge?([a2 | rest], [b1, b2], fun)
  end
end
