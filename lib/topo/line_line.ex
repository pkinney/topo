defmodule Topo.LineLine do
  @moduledoc false

  alias Topo.Util

  @spec relate(list, list) :: atom
  def relate(a, b) do
    do_linestring_intersects_linestring(a, b)
  end

  @spec contains?(list, list) :: boolean
  def contains?([], _), do: false
  def contains?([_], _), do: false

  def contains?([a1, a2 | rest], [b1, b2]) do
    (Util.collinear?(a1, a2, b1) && Util.between?(a1, a2, b1) && Util.collinear?(a1, a2, b2) &&
       Util.between?(a1, a2, b2)) || contains?([a2 | rest], [b1, b2])
  end

  def contains?(a, b) do
    do_contains?(a, b) || do_contains?(Enum.reverse(a), b)
  end

  defp do_contains?(a, b) do
    cond do
      List.first(a) == List.last(a) && List.first(b) === List.last(b) ->
        ring_contains_ring?(Enum.drop(a, 1), Enum.drop(b, 1))

      List.first(a) == List.last(a) ->
        ring_contains_line?(Enum.drop(a, 1), b)

      !contiguous_subset?(a, b |> Enum.drop(1) |> Enum.drop(-1)) ->
        false

      first_and_last_on_line?(a, b) ->
        true

      true ->
        false
    end
  end

  defp ring_contains_ring?(a, b, offset \\ 0) do
    cond do
      offset >= length(b) -> false
      Enum.drop(b, offset) ++ Enum.take(b, offset) == a -> true
      true -> ring_contains_ring?(a, b, offset + 1)
    end
  end

  defp ring_contains_line?(_, _, offset \\ 0)
  defp ring_contains_line?(a, _, offset) when offset >= length(a), do: false

  defp ring_contains_line?(a, b, offset) do
    spin = Enum.drop(a, offset) ++ Enum.take(a, offset)

    cond do
      !contiguous_subset?(spin, b |> Enum.drop(1) |> Enum.drop(-1)) ->
        ring_contains_line?(a, b, offset + 1)

      first_and_last_on_line?(spin, b) ->
        true

      true ->
        ring_contains_line?(a, b, offset + 1)
    end
  end

  defp contiguous_subset?(a, b) do
    Enum.take(line_up_head(a, b), length(b)) == b ||
      Enum.take(line_up_head(Enum.reverse(a), b), length(b)) == b
  end

  defp line_up_head([], _), do: []
  defp line_up_head([a | rest], [b | _]) when a == b, do: [a | rest]
  defp line_up_head([_ | rest], b), do: line_up_head(rest, b)

  defp first_and_last_on_line?(a, b) do
    i1 = Enum.find_index(a, &(&1 == Enum.at(b, 1)))
    in1 = length(a) - Enum.find_index(Enum.reverse(a), &(&1 == Enum.at(b, -2))) - 1

    cond do
      i1 < in1 ->
        on_line_before?(a, List.first(b), i1) && on_line_after?(a, List.last(b), in1)

      i1 > in1 ->
        on_line_after?(a, List.first(b), i1) && on_line_before?(a, List.last(b), in1)

      i1 == in1 ->
        (on_line_after?(a, List.first(b), i1) && on_line_before?(a, List.last(b), in1)) ||
          (on_line_before?(a, List.first(b), i1) && on_line_after?(a, List.last(b), in1))
    end
  end

  defp on_line_before?(_, _, i) when i < 1, do: false

  defp on_line_before?(e, p, i) do
    a = Enum.at(e, i - 1)
    b = Enum.at(e, i)

    Util.collinear?(a, b, p) && Util.between?(a, b, p)
  end

  defp on_line_after?(e, _, i) when i + 1 >= length(e), do: false

  defp on_line_after?(e, p, i) do
    a = Enum.at(e, i + 1)
    b = Enum.at(e, i)

    Util.collinear?(a, b, p) && Util.between?(a, b, p)
  end

  defp do_linestring_intersects_linestring([], _), do: :disjoint
  defp do_linestring_intersects_linestring([_], _), do: :disjoint

  defp do_linestring_intersects_linestring([a, b | rest], ls) do
    case do_linestring_intersects_segment(ls, {a, b}) do
      :disjoint ->
        do_linestring_intersects_linestring([b | rest], ls)

      :edge ->
        :edge

      _ ->
        case do_linestring_intersects_linestring([b | rest], ls) do
          :edge -> :edge
          _ -> :interior
        end
    end
  end

  defp do_linestring_intersects_segment([], _), do: :disjoint
  defp do_linestring_intersects_segment([_], _), do: :disjoint

  defp do_linestring_intersects_segment([a, b | rest], {p1, p2}) do
    case SegSeg.intersection(a, b, p1, p2, epsilon: Util.epsilon()) do
      {_, :disjoint, _} ->
        do_linestring_intersects_segment([b | rest], {p1, p2})

      {_, :edge, _} ->
        :edge

      _ ->
        case do_linestring_intersects_segment([b | rest], {p1, p2}) do
          :edge -> :edge
          _ -> :interior
        end
    end
  end
end
