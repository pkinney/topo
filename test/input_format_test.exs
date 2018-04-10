defmodule InputFormatTest do
  use ExUnit.Case

  test "should accept a Point as a single tuple" do
    assert Topo.equals?(%Geo.Point{coordinates: {2, -1}}, {2, -1})
  end

  test "should accept a Point as a GeoJSON-like geometry" do
    assert Topo.equals?(%{type: "Point", coordinates: {2, -1}}, {2, -1})
  end

  test "should accept a MultiPoint in GeoJSON-like format" do
    a = %{type: "MultiPoint", coordinates: [{2, 2}, {20, 2}, {11, 11}]}
    b = %Geo.MultiPoint{coordinates: [{2, 2}, {20, 2}, {11, 11}]}

    assert Topo.equals?(a, b)
  end

  test "should accept a LineString in GeoJSON-like format" do
    a = %{type: "LineString", coordinates: [{2, 2}, {20, 2}, {11, 11}, {2, 2}]}
    b = %Geo.LineString{coordinates: [{2, 2}, {20, 2}, {11, 11}, {2, 2}]}

    assert Topo.equals?(a, b)
  end

  test "should accept a MultiLineString in GeoJSON-like format" do
    a = %{
      type: "MultiLineString",
      coordinates: [
        [{2, 2}, {20, 2}, {11, 11}],
        [{1, -2}, {3, 1}]
      ]
    }

    b = %Geo.MultiLineString{
      coordinates: [
        [{2, 2}, {20, 2}, {11, 11}],
        [{1, -2}, {3, 1}]
      ]
    }

    assert Topo.equals?(a, b)
  end

  test "should accept a Polygon in GeoJSON-like format" do
    a = %{type: "Polygon", coordinates: [[{2, 2}, {20, 2}, {11, 11}, {2, 2}]]}
    b = %Geo.Polygon{coordinates: [[{2, 2}, {20, 2}, {11, 11}, {2, 2}]]}

    assert Topo.equals?(a, b)
  end

  test "should accept a MultiPolygon in GeoJSON-like format" do
    a = %{
      type: "MultiPolygon",
      coordinates: [
        [[{2, 2}, {20, 2}, {11, 11}, {2, 2}]],
        [[{1, -2}, {3, 1}, {0, 0}]]
      ]
    }

    b = %Geo.MultiPolygon{
      coordinates: [
        [[{2, 2}, {20, 2}, {11, 11}]],
        [[{1, -2}, {3, 1}, {0, 0}, {1, -2}]]
      ]
    }

    assert Topo.equals?(a, b)
  end
end
