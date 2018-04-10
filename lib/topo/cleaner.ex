defmodule Topo.Cleaner do
  @moduledoc false

  import Topo.Util

  @type geometry ::
          {number, number}
          | %{type: String.t(), coordinates: list}
          | %Geo.Point{}
          | %Geo.MultiPoint{}
          | %Geo.LineString{}
          | %Geo.MultiLineString{}
          | %Geo.Polygon{}
          | %Geo.MultiPolygon{}

  @spec clean(geometry) :: geometry
  def clean({x, y}), do: %Geo.Point{coordinates: {x, y}}

  def clean(%Geo.LineString{coordinates: a}) do
    %Geo.LineString{coordinates: do_clean_line(a)}
  end

  def clean(%Geo.Polygon{} = a) do
    %Geo.Polygon{coordinates: Enum.map(a.coordinates, &do_clean_ring/1)}
  end

  def clean(%Geo.MultiLineString{} = a) do
    %Geo.MultiLineString{coordinates: Enum.map(a.coordinates, &do_clean_line/1)}
  end

  def clean(%Geo.MultiPolygon{} = a) do
    %Geo.MultiPolygon{
      coordinates:
        Enum.map(a.coordinates, fn poly ->
          Enum.map(poly, &do_clean_ring/1)
        end)
    }
  end

  def clean(%{type: "Point", coordinates: coords}), do: clean(%Geo.Point{coordinates: coords})

  def clean(%{type: "MultiPoint", coordinates: coords}),
    do: clean(%Geo.MultiPoint{coordinates: coords})

  def clean(%{type: "LineString", coordinates: coords}),
    do: clean(%Geo.LineString{coordinates: coords})

  def clean(%{type: "MultiLineString", coordinates: coords}),
    do: clean(%Geo.MultiLineString{coordinates: coords})

  def clean(%{type: "Polygon", coordinates: coords}), do: clean(%Geo.Polygon{coordinates: coords})

  def clean(%{type: "MultiPolygon", coordinates: coords}),
    do: clean(%Geo.MultiPolygon{coordinates: coords})

  def clean(a), do: a

  defp do_clean_line(line) do
    if List.first(line) == List.last(line) do
      do_clean_ring(line)
    else
      line |> Enum.dedup() |> assert_no_collinear
    end
  end

  defp do_clean_ring(ring) do
    ring
    |> Enum.dedup()
    |> assert_closed
    |> assert_direction
    |> assert_no_collinear
    |> assert_no_collinear_over_closure
  end

  defp area([a, b, c, d | rest]) do
    cross(a, b, c) + area([a, c, d | rest])
  end

  defp area(_), do: 0

  defp assert_closed([a | rest]) do
    case List.last(rest) do
      ^a -> [a | rest]
      _ -> [a | rest] ++ [a]
    end
  end

  defp assert_direction(ring) do
    ring
    |> area
    |> reverse_if_negative_area(ring)
  end

  defp reverse_if_negative_area(area, ring) when area >= 0, do: ring
  defp reverse_if_negative_area(_, ring), do: Enum.reverse(ring)

  defp assert_no_collinear_over_closure(ring) when length(ring) < 4, do: ring

  defp assert_no_collinear_over_closure([b, c | rest]) do
    a = Enum.at(rest, -2)

    if collinear?(a, c, b) && between?(a, c, b) do
      [c | Enum.drop(rest, -1)] ++ [c]
    else
      [b, c | rest]
    end
  end
end
