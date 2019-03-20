defmodule Intersect.Validation.PolygonPolygonBTest do
  use ExUnit.Case

  @tag :validation
  test "14-001 - AA - simple polygons" do
    a = "POLYGON ((10 10, 100 10, 100 100, 10 100, 10 10))" |> Geo.WKT.decode!
    b = "POLYGON ((50 50, 200 50, 200 200, 50 200, 50 50))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-002 - AA - A with hole intersecting B" do
    a = "POLYGON ((20 20, 20 160, 160 160, 160 20, 20 20),(140 140, 40 140, 40 40, 140 40, 140 140))" |> Geo.WKT.decode!
    b = "POLYGON ((80 100, 220 100, 220 240, 80 240, 80 100))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-003 - AA - simple polygons #2" do
    a = "POLYGON ((20 340, 330 380, 50 40, 20 340))" |> Geo.WKT.decode!
    b = "POLYGON ((210 320, 140 270, 0 270, 140 220, 210 320))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-004 - AA - simple polygons intersecting in P, L and A" do
    a = "POLYGON ((0 0, 110 0, 110 60, 40 60, 180 140, 40 220, 110 260, 0 260, 0 0))" |> Geo.WKT.decode!
    b = "POLYGON ((220 0, 110 0, 110 60, 180 60, 40 140, 180 220, 110 260, 220 260, 220 0))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-005 - AA - simple polygons with two touching holes in their symDifference" do
    a = "POLYGON ((0 0, 120 0, 120 50, 50 50, 120 100, 50 150, 120 150, 120 190, 0 190, 0 0))" |> Geo.WKT.decode!
    b = "POLYGON ((230 0, 120 0, 120 50, 190 50, 120 100, 190 150, 120 150, 120 190, 230 190, 230 0))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-006 - AmA - A simple, symDiff contains inversion" do
    a = "POLYGON ((0 0, 210 0, 210 230, 0 230, 0 0))" |> Geo.WKT.decode!
    b = "MULTIPOLYGON (((40 20, 0 0, 20 40, 60 60, 40 20)),((60 90, 60 60, 90 60, 90 90, 60 90)),((70 120, 90 90, 100 120, 70 120)),((120 70, 90 90, 120 100, 120 70)))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-007 - AmA - A simple, B connected multiPolygon touching A at vertex" do
    a = "POLYGON ((0 0, 340 0, 340 300, 0 300, 0 0))" |> Geo.WKT.decode!
    b = "MULTIPOLYGON (((40 20, 0 0, 20 40, 60 60, 40 20)),((60 100, 60 60, 100 60, 100 100, 60 100)))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-008 - AmA - A simple, B connected multiPolygon touching A at interior of edge" do
    a = "POLYGON ((0 0, 120 0, 120 120, 0 120, 0 0))" |> Geo.WKT.decode!
    b = "MULTIPOLYGON (((60 20, 0 20, 60 60, 60 20)),((60 100, 60 60, 100 60, 100 100, 60 100)))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-009 - AA - simple polygons with holes" do
    a = "POLYGON ((160 330, 60 260, 20 150, 60 40, 190 20, 270 130, 260 250, 160 330),(140 240, 80 190, 90 100, 160 70, 210 130, 210 210, 140 240))" |> Geo.WKT.decode!
    b = "POLYGON ((300 330, 190 270, 150 170, 150 110, 250 30, 380 50, 380 250, 300 330),(290 240, 240 200, 240 110, 290 80, 330 170, 290 240))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-010 - mAmA - complex polygons touching and overlapping" do
    a = "MULTIPOLYGON (((120 340, 120 200, 140 200, 140 280, 160 280, 160 200, 180 200, 180 280, 200 280, 200 200, 220 200, 220 340, 120 340)),((360 200, 220 200, 220 180, 300 180, 300 160, 220 160, 220 140, 300 140, 300 120, 220 120, 220 100, 360 100, 360 200)))" |> Geo.WKT.decode!
    b = "MULTIPOLYGON (((100 220, 100 200, 300 200, 300 220, 100 220)),((280 180, 280 160, 300 160, 300 180, 280 180)),((220 140, 220 120, 240 120, 240 140, 220 140)),((180 220, 160 240, 200 240, 180 220)))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-011 - mAmA - complex polygons touching" do
    a = "MULTIPOLYGON (((100 200, 100 180, 120 180, 120 200, 100 200)),((60 240, 60 140, 220 140, 220 160, 160 160, 160 180, 200 180, 200 200, 160 200, 160 220, 220 220, 220 240, 60 240),(80 220, 80 160, 140 160, 140 220, 80 220)),((280 220, 240 180, 260 160, 300 200, 280 220)))" |> Geo.WKT.decode!
    b = "MULTIPOLYGON (((80 220, 80 160, 140 160, 140 220, 80 220),(100 200, 100 180, 120 180, 120 200, 100 200)),((220 240, 220 220, 160 220, 160 200, 220 200, 220 180, 160 180, 160 160, 220 160, 220 140, 320 140, 320 240, 220 240),(240 220, 240 160, 300 160, 300 220, 240 220)))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "14-012 - AA - hole intersecting boundary to produce line" do
    a = "POLYGON ((60 160, 140 160, 140 60, 60 60, 60 160))" |> Geo.WKT.decode!
    b = "POLYGON ((160 160, 100 160, 100 100, 160 100, 160 160),(140 140, 120 140, 120 120, 140 120, 140 140))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end
end
