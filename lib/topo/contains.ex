defmodule Topo.Contains do
  @moduledoc false

  import Topo.Intersects

  alias Topo.PointRing
  alias Topo.LineLine
  alias Topo.LineRing
  alias Topo.RingRing

  @type geo_struct :: %Geo.Point{}
                    | %Geo.MultiPoint{}
                    | %Geo.LineString{}
                    | %Geo.MultiLineString{}
                    | %Geo.Polygon{}
                    | %Geo.MultiPolygon{}

  @spec contains?(geo_struct, geo_struct) :: boolean
  def contains?(%Geo.Point{} = a, %Geo.Point{} = b), do: a == b
  def contains?(%Geo.Point{} = a, %Geo.MultiPoint{} = b), do: contains_all?(a, b, Geo.Point)
  def contains?(%Geo.Point{}, %Geo.LineString{}), do: false
  def contains?(%Geo.Point{}, %Geo.MultiLineString{}), do: false
  def contains?(%Geo.Point{}, %Geo.Polygon{}), do: false
  def contains?(%Geo.Point{}, %Geo.MultiPolygon{}), do: false

  def contains?(%Geo.MultiPoint{} = a, %Geo.Point{} = b), do: any_contain?(a, b, Geo.Point)
  def contains?(%Geo.MultiPoint{} = a, %Geo.MultiPoint{} = b), do: contains_all?(a, b, Geo.Point)
  def contains?(%Geo.MultiPoint{}, %Geo.LineString{}), do: false
  def contains?(%Geo.MultiPoint{}, %Geo.MultiLineString{}), do: false
  def contains?(%Geo.MultiPoint{}, %Geo.Polygon{}), do: false
  def contains?(%Geo.MultiPoint{}, %Geo.MultiPolygon{}), do: false

  def contains?(%Geo.LineString{} = a, %Geo.Point{} = b) do
    cond do
       List.first(a.coordinates) == List.last(a.coordinates) -> intersects?(a, b)
       intersects?(a, b) -> b.coordinates != List.first(a.coordinates) && b.coordinates != List.last(a.coordinates)
       true -> false
    end
  end
  def contains?(%Geo.LineString{} = a, %Geo.MultiPoint{} = b), do: intersects_all?(a, b, Geo.Point) && contains_any?(a, b, Geo.Point)
  def contains?(%Geo.LineString{coordinates: a}, %Geo.LineString{coordinates: b}) do
    LineLine.contains?(a, b)
  end

  def contains?(%Geo.LineString{} = a, %Geo.MultiLineString{} = b), do: contains_all?(a, b, Geo.LineString)
  def contains?(%Geo.LineString{}, %Geo.Polygon{}), do: false
  def contains?(%Geo.LineString{}, %Geo.MultiPolygon{}), do: false

  def contains?(%Geo.MultiLineString{} = a, %Geo.Point{} = b), do: any_contain?(a, b, Geo.LineString)
  def contains?(%Geo.MultiLineString{} = a, %Geo.MultiPoint{} = b), do: intersects_all?(a, b, Geo.Point) && contains_any?(a, b, Geo.Point)
  def contains?(%Geo.MultiLineString{} = a, %Geo.LineString{} = b), do: any_contain?(a, b, Geo.LineString)
  def contains?(%Geo.MultiLineString{} = a, %Geo.MultiLineString{} = b), do: contains_all?(a, b, Geo.LineString)
  def contains?(%Geo.MultiLineString{}, %Geo.Polygon{}), do: false
  def contains?(%Geo.MultiLineString{}, %Geo.MultiPolygon{}), do: false

  def contains?(%Geo.Polygon{coordinates: [exterior | holes]}, %Geo.Point{coordinates: point}) do
    PointRing.relate(exterior, point) === :interior
      && PointRing.relate_multi(holes, point) === :disjoint
  end

  def contains?(%Geo.Polygon{} = a, %Geo.MultiPoint{} = b) do
    contains_any?(a, b, Geo.Point) && intersects_all?(a, b, Geo.Point)
  end

  def contains?(%Geo.Polygon{coordinates: [a_exterior | a_holes]}, %Geo.LineString{} = b) do
    LineRing.contains?(a_exterior, b.coordinates)
      && LineRing.line_exterior_to_all?(a_holes, b.coordinates)
  end
  def contains?(%Geo.Polygon{} = a, %Geo.MultiLineString{} = b), do: contains_all?(a, b, Geo.LineString)
  def contains?(%Geo.Polygon{coordinates: [a_exterior | a_holes]}, %Geo.Polygon{coordinates: [b_exterior | b_holes]}) do
    RingRing.contains?(a_exterior, b_exterior)
    && holes_contained?(a_holes, b_exterior, b_holes)
  end
  def contains?(%Geo.Polygon{} = a, %Geo.MultiPolygon{} = b), do: contains_all?(a, b, Geo.Polygon)

  def contains?(%Geo.MultiPolygon{} = a, %Geo.Point{} = b), do: any_contain?(a, b, Geo.Polygon)
  def contains?(%Geo.MultiPolygon{} = a, %Geo.MultiPoint{} = b), do: intersects_all?(a, b, Geo.Point) && contains_any?(a, b, Geo.Point)
  def contains?(%Geo.MultiPolygon{} = a, %Geo.LineString{} = b), do: any_contain?(a, b, Geo.Polygon)
  def contains?(%Geo.MultiPolygon{} = a, %Geo.MultiLineString{} = b), do: contains_all?(a, b, Geo.LineString)
  def contains?(%Geo.MultiPolygon{} = a, %Geo.Polygon{} = b), do: any_contain?(a, b, Geo.Polygon)
  def contains?(%Geo.MultiPolygon{} = a, %Geo.MultiPolygon{} = b), do: contains_all?(a, b, Geo.Polygon)

  defp contains_all?(a, b, component_struct) do
    Enum.all? b.coordinates, fn b_comp ->
      contains?(a, struct(component_struct, %{coordinates: b_comp}))
    end
  end

  defp contains_any?(a, b, component_struct) do
    Enum.any? b.coordinates, fn b_comp ->
      contains?(a, struct(component_struct, %{coordinates: b_comp}))
    end
  end

  defp any_contain?(a, b, component_struct) do
    Enum.any? a.coordinates, fn a_comp ->
      contains?(struct(component_struct, %{coordinates: a_comp}), b)
    end
  end

  defp intersects_all?(a, b, component_struct) do
    Enum.all? b.coordinates, fn b_comp ->
      intersects?(a, struct(component_struct, %{coordinates: b_comp}))
    end
  end

  defp holes_contained?(a_holes, b_exterior, []) do
    !Enum.any? a_holes, fn hole ->
      RingRing.overlaps?(hole, b_exterior) || RingRing.contains?(hole, b_exterior)
    end
  end

  defp holes_contained?(a_holes, b_exterior, b_holes) do
    holes_intersecting_b = Enum.filter(a_holes, &(RingRing.overlaps?(&1, b_exterior)))

    Enum.all? holes_intersecting_b, fn a_hole ->
      RingRing.contains?(b_exterior, a_hole)
      && Enum.any?(b_holes, &(RingRing.contains?(&1, a_hole)))
    end
  end
end
