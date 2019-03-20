defmodule LineStringPolygonTest do
  use ExUnit.Case

  @exterior [{2, 2}, {20, 2}, {11, 11}, {2, 2}]
  @hole [{11, 9}, {5, 3}, {17, 3}, {11, 9}]
  @linestring %Geo.LineString{coordinates: @exterior}
  @hole_linestring %Geo.LineString{coordinates: @hole}
  @polygon %Geo.Polygon{coordinates: [@exterior]}
  @polygon_with_hole %Geo.Polygon{coordinates: [@exterior, @hole]}

  test "polygon should intersect its own exterior linear ring" do
    assert Topo.intersects?(@polygon, @linestring)
    assert Topo.intersects?(@linestring, @polygon)
  end

  test "polygon should not contain its own exterior linear ring" do
    refute Topo.contains?(@polygon, @linestring)
  end

  test "polygon should intersect its own hole's linear ring" do
    assert Topo.intersects?(@polygon_with_hole, @hole_linestring)
    assert Topo.intersects?(@hole_linestring, @polygon_with_hole)
  end

  test "polygon should not contain its own hole's linear ring" do
    refute Topo.contains?(@polygon_with_hole, @hole_linestring)
  end

  test "polygon should intersect and contain linestring that shares a vertex and is within the polygon" do
    b = %Geo.LineString{coordinates: Enum.take(@exterior, 1) ++ Enum.take(@hole, 1)}
    assert Topo.intersects?(@polygon, b)
    assert Topo.contains?(@polygon, b)
  end

  test "polygon should intersect but not contain linestring that shares a vertex and is outside the polygon" do
    b = %Geo.LineString{coordinates: Enum.take(@exterior, 1) ++ [{0, 0}]}
    assert Topo.intersects?(@polygon, b)
    refute Topo.contains?(@polygon, b)
  end

  test "line that crosses hole inside of polygon" do
    b = %Geo.LineString{coordinates: [{11, 10}, {4, 2.5}, {16, 2.5}, {11, 10}]}

    assert Topo.intersects?(@polygon_with_hole, b)
    assert Topo.contains?(@polygon, b)
    refute Topo.contains?(@polygon_with_hole, b)
  end

  test "line that crosses hole inside of polygon but the midpoint is still outside the hole" do
    a = %Geo.Polygon{coordinates: [@exterior, [{11, 4}, {5, 3}, {17, 3}, {11, 4}]]}
    b = %Geo.LineString{coordinates: [{11, 10}, {4, 2.5}, {16, 2.5}, {11, 10}]}

    assert Topo.intersects?(@polygon_with_hole, b)
    assert Topo.contains?(@polygon, b)
    refute Topo.contains?(a, b)
  end

  test "line within a polygon only touching the boundary" do
    a = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (70 70, 80 20)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b)
    assert Topo.intersects?(b, a)
    assert Topo.contains?(a, b)
  end

  test "line outside a polygon only touching the boundary" do
    a = "POLYGON ((150 150, 0 0, 280 20, 20 20, 150 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (70 70, 80 20)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b)
    assert Topo.intersects?(b, a)
    refute Topo.contains?(a, b)
  end

  test "line within a polygon with hole only touching the boundary but crosses a hole" do
    a =
      "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 250 120, 180 50, 100 50, 170 120))"
      |> Geo.WKT.decode!()

    b = "LINESTRING (100 100, 140 20)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b)
    assert Topo.intersects?(b, a)
    refute Topo.contains?(a, b)
  end

  test "line within hole that touches two edges" do
    a =
      "POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(3 3, 6 3, 8 5, 6 7, 3 7, 3 3))" |> Geo.WKT.decode!()

    b = "LINESTRING(7 6, 7 4)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b)
    assert Topo.intersects?(b, a)
    refute Topo.contains?(a, b)
  end

  test "line outside of hole that touches two edges" do
    a =
      "POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(3 3, 8 3, 6 5, 8 7, 3 7, 3 3))" |> Geo.WKT.decode!()

    b = "LINESTRING(7 6, 7 4)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b)
    assert Topo.intersects?(b, a)
    refute Topo.contains?(a, b)
  end
end
