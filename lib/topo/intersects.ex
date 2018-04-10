defmodule Topo.Intersects do
  @moduledoc false

  alias Topo.PointLine
  alias Topo.PointRing
  alias Topo.LineLine
  alias Topo.LineRing
  alias Topo.RingRing

  @type geo_struct ::
          %Geo.Point{}
          | %Geo.MultiPoint{}
          | %Geo.LineString{}
          | %Geo.MultiLineString{}
          | %Geo.Polygon{}
          | %Geo.MultiPolygon{}

  @spec intersects?(geo_struct, geo_struct) :: boolean
  def intersects?(%Geo.Point{} = a, %Geo.Point{} = b), do: a == b
  def intersects?(%Geo.Point{} = a, %Geo.MultiPoint{} = b), do: intersects_any?(a, b, Geo.Point)

  def intersects?(%Geo.Point{coordinates: a}, %Geo.LineString{coordinates: b}),
    do: PointLine.relate(b, a) != :disjoint

  def intersects?(%Geo.Point{} = a, %Geo.MultiLineString{} = b),
    do: intersects_any?(a, b, Geo.LineString)

  def intersects?(%Geo.Point{} = a, %Geo.Polygon{coordinates: [exterior | holes]}) do
    case PointRing.relate(exterior, a.coordinates) do
      :interior -> PointRing.relate_multi(holes, a.coordinates) !== :interior
      :disjoint -> false
      _ -> true
    end
  end

  def intersects?(%Geo.Point{} = a, %Geo.MultiPolygon{} = b),
    do: intersects_any?(a, b, Geo.Polygon)

  def intersects?(%Geo.MultiPoint{} = a, %Geo.Point{} = b), do: intersects?(b, a)

  def intersects?(%Geo.MultiPoint{} = a, %Geo.MultiPoint{} = b),
    do: intersects_any?(a, b, Geo.Point)

  def intersects?(%Geo.MultiPoint{} = a, %Geo.LineString{} = b),
    do: intersects_any?(b, a, Geo.Point)

  def intersects?(%Geo.MultiPoint{} = a, %Geo.MultiLineString{} = b),
    do: intersects_any?(a, b, Geo.LineString)

  def intersects?(%Geo.MultiPoint{} = a, %Geo.Polygon{} = b), do: intersects_any?(b, a, Geo.Point)

  def intersects?(%Geo.MultiPoint{} = a, %Geo.MultiPolygon{} = b),
    do: intersects_any?(a, b, Geo.Polygon)

  def intersects?(%Geo.LineString{} = a, %Geo.Point{} = b), do: intersects?(b, a)
  def intersects?(%Geo.LineString{} = a, %Geo.MultiPoint{} = b), do: intersects?(b, a)

  def intersects?(%Geo.LineString{coordinates: a}, %Geo.LineString{coordinates: b}),
    do: LineLine.relate(a, b) != :disjoint

  def intersects?(%Geo.LineString{} = a, %Geo.MultiLineString{} = b),
    do: intersects_any?(a, b, Geo.LineString)

  def intersects?(%Geo.LineString{} = a, %Geo.Polygon{coordinates: [b_exterior | b_holes]}) do
    LineRing.intersects?(b_exterior, a.coordinates) &&
      LineRing.none_contain_line?(b_holes, a.coordinates)
  end

  def intersects?(%Geo.LineString{} = a, %Geo.MultiPolygon{} = b),
    do: intersects_any?(a, b, Geo.Polygon)

  def intersects?(%Geo.MultiLineString{} = a, %Geo.Point{} = b), do: intersects?(b, a)
  def intersects?(%Geo.MultiLineString{} = a, %Geo.MultiPoint{} = b), do: intersects?(b, a)
  def intersects?(%Geo.MultiLineString{} = a, %Geo.LineString{} = b), do: intersects?(b, a)

  def intersects?(%Geo.MultiLineString{} = a, %Geo.MultiLineString{} = b),
    do: intersects_any?(a, b, Geo.LineString)

  def intersects?(%Geo.MultiLineString{} = a, %Geo.Polygon{} = b),
    do: intersects_any?(b, a, Geo.LineString)

  def intersects?(%Geo.MultiLineString{} = a, %Geo.MultiPolygon{} = b),
    do: intersects_any?(a, b, Geo.Polygon)

  def intersects?(%Geo.Polygon{} = a, %Geo.Point{} = b), do: intersects?(b, a)
  def intersects?(%Geo.Polygon{} = a, %Geo.MultiPoint{} = b), do: intersects?(b, a)
  def intersects?(%Geo.Polygon{} = a, %Geo.LineString{} = b), do: intersects?(b, a)
  def intersects?(%Geo.Polygon{} = a, %Geo.MultiLineString{} = b), do: intersects?(b, a)

  def intersects?(%Geo.Polygon{coordinates: [a_exterior | a_holes]}, %Geo.Polygon{
        coordinates: [b_exterior | b_holes]
      }) do
    RingRing.intersects?(a_exterior, b_exterior) &&
      RingRing.none_contain_ring?(a_holes, b_exterior) &&
      RingRing.none_contain_ring?(b_holes, a_exterior)
  end

  def intersects?(%Geo.Polygon{} = a, %Geo.MultiPolygon{} = b),
    do: intersects_any?(a, b, Geo.Polygon)

  def intersects?(%Geo.MultiPolygon{} = a, %Geo.Point{} = b), do: intersects?(b, a)
  def intersects?(%Geo.MultiPolygon{} = a, %Geo.MultiPoint{} = b), do: intersects?(b, a)
  def intersects?(%Geo.MultiPolygon{} = a, %Geo.LineString{} = b), do: intersects?(b, a)
  def intersects?(%Geo.MultiPolygon{} = a, %Geo.MultiLineString{} = b), do: intersects?(b, a)
  def intersects?(%Geo.MultiPolygon{} = a, %Geo.Polygon{} = b), do: intersects?(b, a)

  def intersects?(%Geo.MultiPolygon{} = a, %Geo.MultiPolygon{} = b),
    do: intersects_any?(a, b, Geo.Polygon)

  defp intersects_any?(a, b, component_struct) do
    Enum.any?(b.coordinates, fn b_comp ->
      intersects?(a, struct(component_struct, %{coordinates: b_comp}))
    end)
  end
end
