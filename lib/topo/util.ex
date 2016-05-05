defmodule Topo.Util do
  def cross({ax, ay}, {bx, by}, {cx, cy}) do
    Vector.cross({ax - cx, ay - cy}, {bx - cx, by - cy})
    |> Vector.component(:z)
  end

  def collinear(a, b, c) do
    cross(a, b, c) == 0
  end

  def between({ax, ay}, {bx, by}, {px, py}) when ax == bx and ay == by and (px != ax and py != ay), do: false
  def between({ax, ay}, {bx, by}, {_, py}) when ax == bx and ay != by, do: ((ay <= py) && (py <= by)) || ((ay >= py) && (py >= by))
  def between({ax, _}, {bx, _}, {px, _}), do: ((ax <= px) && (px <= bx)) || ((ax >= px) && (px >= bx))

  def assert_no_collinear([a, b, c | rest]) do
    cond do
      collinear(a, c, b) && between(a, c, b) -> assert_no_collinear([a, c | rest])
      true -> [a] ++ assert_no_collinear([b, c | rest])
    end
  end
  def assert_no_collinear(ring), do: ring

  def midpoint(a, b) do
    Vector.divide(Vector.add(a, b), 2)
  end

  def any_edge_pair_not?(a, b, rel) do
    do_any_edge_pair? a, b, fn a1, a2, b1, b2 ->
      elem(SegSeg.intersection(a1, a2, b1, b2), 1) !== rel
    end
  end

  def any_edge_pair?(a, b, rel) do
    do_any_edge_pair? a, b, fn a1, a2, b1, b2 ->
      elem(SegSeg.intersection(a1, a2, b1, b2), 1) === rel
    end
  end

  defp do_any_edge_pair?(_, [_], _), do: false
  defp do_any_edge_pair?(a, [b1, b2 | rest], fun) do
    any_edge?(a, [b1, b2], fun) || do_any_edge_pair?(a, [b2 | rest], fun)
  end

  defp any_edge?([_], _, _), do: false
  defp any_edge?([a1, a2 | rest], [b1, b2], fun) do
    fun.(a1, a2, b1, b2) || any_edge?([a2 | rest], [b1, b2], fun)
  end
end
