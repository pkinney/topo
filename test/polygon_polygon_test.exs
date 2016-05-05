defmodule PolygonPolygonTest do
  use ExUnit.Case

  @polygon Path.join([ "test", "fixtures", "poly.geo.json" ])
    |> File.read!
    |> Poison.decode!
    |> Geo.JSON.decode

  @polygon_with_hole "POLYGON ((15 15, 41 15, 28 2, 2 2, 15 15),(17 12, 33 12, 26 5, 10 5, 17 12))" |> Geo.WKT.decode

  test "Polygon should intersect itself" do
    assert Topo.intersects? @polygon, @polygon
  end

  test "Polygon should contain itself" do
    assert Topo.contains? @polygon, @polygon
  end

  test "Polygon with holes should intersect itself" do
    assert Topo.intersects? @polygon_with_hole, @polygon_with_hole
  end

  test "Polygon with holes should contain itself" do
    assert Topo.contains? @polygon_with_hole, @polygon_with_hole
  end

  test "Polygon with holes should intersect its exterior" do
    b = %Geo.Polygon{coordinates: [List.first(@polygon_with_hole.coordinates)]}
    assert Topo.intersects? @polygon_with_hole, b
    assert Topo.intersects? b, @polygon_with_hole
  end

  test "Polygon with holes should not contain its exterior" do
    b = %Geo.Polygon{coordinates: [List.first(@polygon_with_hole.coordinates)]}
    refute Topo.contains? @polygon_with_hole, b
    assert Topo.contains? b, @polygon_with_hole
  end

  test "Polygon should intersect an overlapping polygon" do
    a = %Geo.Polygon{coordinates: [[{-1, -1}, {7, -2}, {3, 8}, {-1, -1}]]}
    assert Topo.intersects? @polygon, a
  end

  test "Different polygons that don't touch or overlap should not intersect" do
    a = %Geo.Polygon{coordinates: [[{-1, -1}, {-7, -2}, {-3, -8}, {-1, -1}]]}
    refute Topo.intersects? @polygon, a
    refute Topo.contains? @polygon, a
    refute Topo.contains? a, @polygon
  end

  test "polygons touching on closing point" do
    a = %Geo.Polygon{coordinates: [[{0, 0}, {-7, -2}, {-3, -8}, {0, 0}]]}
    assert Topo.intersects? @polygon, a
    refute Topo.contains? @polygon, a
    refute Topo.contains? a, @polygon
  end

  test "polygon fully inside the hole of another polygon" do
    a = "POLYGON ((15 15, 41 15, 28 2, 2 2, 15 15),(17 12, 33 12, 26 5, 10 5, 17 12))" |> Geo.WKT.decode
    b = "POLYGON ((19 10, 29 10, 26 7, 16 7, 19 10))" |> Geo.WKT.decode

    refute Topo.intersects? a, b
    refute Topo.intersects? b, a
    refute Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon inside the hole of another polygon but touching one edge of the hole" do
    a = "POLYGON ((15 15, 41 15, 28 2, 2 2, 15 15),(17 12, 33 12, 26 5, 10 5, 17 12))" |> Geo.WKT.decode
    b = "POLYGON ((19 10, 23 12, 29 10, 26 7, 16 7, 19 10))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    refute Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon exactly inside the hole of another polygon" do
    a = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode
    b = "POLYGON ((170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    refute Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon inside the hole of another polygon touching the closing point" do
    a = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode
    b = "POLYGON ((170 120, 230 120, 290 100, 260 70, 160 70, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    refute Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon inside the hole of another polygon touching the closing point of the hole and exterior" do
    a = "POLYGON ((170 120, 410 150, 280 20, 20 20, 170 120),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode
    b = "POLYGON ((170 120, 230 120, 290 100, 260 70, 160 70, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    refute Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon inside another polygon that has a hole" do
    a = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 250 120, 180 50, 100 50, 170 120))" |> Geo.WKT.decode
    b = "POLYGON ((280 130, 360 130, 270 40, 190 40, 280 130))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    assert Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon overlapping hole with midpoint in hole" do
    a = "POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(2 3,6 3, 6 7, 2 7, 2 3))" |> Geo.WKT.decode
    b = "POLYGON((5 1, 5 9, 8 9, 8 1, 5 1))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    refute Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon overlapping hole with midpoint outside the hole" do
    a = "POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(2 3,6 3, 6 4, 2 4, 2 3))" |> Geo.WKT.decode
    b = "POLYGON((5 1, 5 9, 8 9, 8 1, 5 1))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    refute Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon with overlapping hole that only touches on the endpoints of the hole" do
    a = "POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(7 2, 7 7, 2 7, 2 2, 7 2))" |> Geo.WKT.decode
    b = "POLYGON((8 1, 1 8, 8 8, 8 1))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    refute Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon with overlapping hole that only touches on the endpoints of the hole with the midpoint outside of the hole" do
    a = "POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(7 2, 7 3, 6 3, 6 2, 7 2))" |> Geo.WKT.decode
    b = "POLYGON((8 1, 1 8, 8 8, 8 1))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    refute Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon contained in polygon with touching hole that only touches on the endpoints of the hole" do
    a = "POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(7 2, 3 3, 2 7, 2 2, 7 2))" |> Geo.WKT.decode
    b = "POLYGON((8 1, 1 8, 8 8, 8 1))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    assert Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon with touching hole that only touches on the endpoints of the hole but one touch is at the midpoint" do
    a = "POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(7 3, 4 3, 5 5, 2 2, 7 2))" |> Geo.WKT.decode
    b = "POLYGON((8 2, 2 8, 8 8, 8 2))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    assert Topo.contains? a, b
    refute Topo.contains? b, a
  end

  test "polygon with hole inside polygon with touching hole that only touches on the endpoints of the hole but one touch is at the midpoint" do
    a = "POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(7 3, 4 3, 5 5, 2 2, 7 2))" |> Geo.WKT.decode
    b = "POLYGON((8 2, 2 8, 8 8, 8 2),(6 5, 6 7, 5 7, 6 5))" |> Geo.WKT.decode

    assert Topo.intersects? a, b
    assert Topo.intersects? b, a
    assert Topo.contains? a, b
    refute Topo.contains? b, a
  end
end
