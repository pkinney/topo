defmodule Intersect.Validation.LinePolygonATest do
  use ExUnit.Case

  @tag :validation
  test "05-001 - L/A-3-1: a line touching the closing point of a polygon" do
    a = "LINESTRING (150 150, 40 230)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-001 - L/A-3-1: a line touching the closing point of a polygon (float)" do
    a = "LINESTRING(150.0 150.0,40.0 230.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-002 - L/A-3-2: the start and end points of a LineString touching the boundary (at non-vertices) of a polygon" do
    a = "LINESTRING (40 40, 50 130, 130 130)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-002 - L/A-3-2: the start and end points of a LineString touching the boundary (at non-vertices) of a polygon (float)" do
    a = "LINESTRING(40.0 40.0,50.0 130.0,130.0 130.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-003 - L/A-3-3: the end point of a line touching the closing point of a polygon" do
    a = "LINESTRING (40 230, 150 150)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-003 - L/A-3-3: the end point of a line touching the closing point of a polygon (float)" do
    a = "LINESTRING(40.0 230.0,150.0 150.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-004 - L/A-3-4: an entire LineString touching the boundary (at non-vertices) of a polygon" do
    a = "LINESTRING (210 150, 330 150)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-004 - L/A-3-4: an entire LineString touching the boundary (at non-vertices) of a polygon (float)" do
    a = "LINESTRING(210.0 150.0,330.0 150.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-005 - L/A-3-5: the start portion of a LineString touching the boundary (at non-vertices) of a polygon" do
    a = "LINESTRING (200 150, 310 150, 360 220)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-005 - L/A-3-5: the start portion of a LineString touching the boundary (at non-vertices) of a polygon (float)" do
    a = "LINESTRING(200.0 150.0,310.0 150.0,360.0 220.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-006 - L/A-3-6: the start portion and the end point of a LineString touching the boundary of a polygon" do
    a = "LINESTRING (180 150, 250 150, 230 250, 370 250, 410 150)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-006 - L/A-3-6: the start portion and the end point of a LineString touching the boundary of a polygon (float)" do
    a =
      "LINESTRING(180.0 150.0,250.0 150.0,230.0 250.0,370.0 250.0,410.0 150.0)"
      |> Geo.WKT.decode!()

    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-007 - L/A-3-7: the middle portion of a LineString touching the boundary (at non-vertices) of a polygon" do
    a = "LINESTRING (210 210, 220 150, 320 150, 370 210)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-007 - L/A-3-7: the middle portion of a LineString touching the boundary (at non-vertices) of a polygon (float)" do
    a = "LINESTRING(210.0 210.0,220.0 150.0,320.0 150.0,370.0 210.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-008 - L/A-4-1: a line at non-vertex crossing non-vertex boundary of polygon" do
    a = "LINESTRING (20 60, 150 60)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-008 - L/A-4-1: a line at non-vertex crossing non-vertex boundary of polygon (float)" do
    a = "LINESTRING(20.0 60.0,150.0 60.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-009 - L/A-4-2: a line at non-vertex crossing non-vertex boundaries of polygon twice" do
    a = "LINESTRING (60 90, 310 180)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-009 - L/A-4-2: a line at non-vertex crossing non-vertex boundaries of polygon twice (float)" do
    a = "LINESTRING(60.0 90.0,310.0 180.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-010 - L/A-4-3: a line at non-vertex crossing vertex boundary of polygon" do
    a = "LINESTRING (90 210, 210 90)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-010 - L/A-4-3: a line at non-vertex crossing vertex boundary of polygon (float)" do
    a = "LINESTRING(90.0 210.0,210.0 90.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-011 - L/A-4-4: a line at non-vertex crossing vertex boundaries of polygon twice" do
    a = "LINESTRING (290 10, 130 170)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-011 - L/A-4-4: a line at non-vertex crossing vertex boundaries of polygon twice (float)" do
    a = "LINESTRING(290.0 10.0,130.0 170.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-012 - L/A-4-5: a line at vertex crossing non-vertex boundary of polygon" do
    a = "LINESTRING (30 100, 100 100, 180 100)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-012 - L/A-4-5: a line at vertex crossing non-vertex boundary of polygon (float)" do
    a = "LINESTRING(30.0 100.0,100.0 100.0,180.0 100.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-013 - L/A-4-6: a line at vertex crossing non-vertex boundaries of polygon twice" do
    a = "LINESTRING (20 100, 100 100, 360 100, 410 100)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-013 - L/A-4-6: a line at vertex crossing non-vertex boundaries of polygon twice (float)" do
    a = "LINESTRING(20.0 100.0,100.0 100.0,360.0 100.0,410.0 100.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-014 - L/A-4-7: a line at vertex crossing vertex boundary of polygon" do
    a = "LINESTRING (90 210, 150 150, 210 90)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

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
  test "05-014 - L/A-4-7: a line at vertex crossing vertex boundary of polygon (float)" do
    a = "LINESTRING(90.0 210.0,150.0 150.0,210.0 90.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

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
  test "05-015 - L/A-5-1: an entire line within a polygon" do
    a = "LINESTRING (180 90, 280 120)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-015 - L/A-5-1: an entire line within a polygon (float)" do
    a = "LINESTRING(180.0 90.0,280.0 120.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-016 - L/A-5-2: a line within a polygon but the line's both ends touching the boundary of the polygon" do
    a = "LINESTRING (70 70, 80 20)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-016 - L/A-5-2: a line within a polygon but the line's both ends touching the boundary of the polygon (float)" do
    a = "LINESTRING(70.0 70.0,80.0 20.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-017 - L/A-5-3: a line within a polygon but the line's start point touching the boundary of the polygon" do
    a = "LINESTRING (130 20, 150 60)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-017 - L/A-5-3: a line within a polygon but the line's start point touching the boundary of the polygon (float)" do
    a = "LINESTRING(130.0 20.0,150.0 60.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-018 - L/A-5-4: a line within a polygon but the line's start point and middle portion touching the boundary of the polygon" do
    a = "LINESTRING (70 70, 80 20, 140 20, 150 60)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-018 - L/A-5-4: a line within a polygon but the line's start point and middle portion touching the boundary of the polygon (float)" do
    a = "LINESTRING(70.0 70.0,80.0 20.0,140.0 20.0,150.0 60.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-019 - L/A-5-5: a line within a polygon but the line's middle portion touching the boundary of the polygon" do
    a = "LINESTRING (170 50, 170 20, 240 20, 260 60)" |> Geo.WKT.decode!()
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-019 - L/A-5-5: a line within a polygon but the line's middle portion touching the boundary of the polygon (float)" do
    a = "LINESTRING(170.0 50.0,170.0 20.0,240.0 20.0,260.0 60.0)" |> Geo.WKT.decode!()
    b = "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-020 - L/Ah-2-1: a line outside a polygon" do
    a = "LINESTRING (50 100, 140 190, 280 190)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == false
    assert Topo.intersects?(b, a) == false
    assert Topo.disjoint?(a, b) == true
    assert Topo.disjoint?(b, a) == true
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-020 - L/Ah-2-1: a line outside a polygon (float)" do
    a = "LINESTRING(50.0 100.0,140.0 190.0,280.0 190.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0),(170.0 120.0,330.0 120.0,260.0 50.0,100.0 50.0,170.0 120.0))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == false
    assert Topo.intersects?(b, a) == false
    assert Topo.disjoint?(a, b) == true
    assert Topo.disjoint?(b, a) == true
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-021 - L/Ah-2-2: a line inside a polygon's hole" do
    a = "LINESTRING (140 60, 180 100, 290 100)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == false
    assert Topo.intersects?(b, a) == false
    assert Topo.disjoint?(a, b) == true
    assert Topo.disjoint?(b, a) == true
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-021 - L/Ah-2-2: a line inside a polygon's hole (float)" do
    a = "LINESTRING(140.0 60.0,180.0 100.0,290.0 100.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0),(170.0 120.0,330.0 120.0,260.0 50.0,100.0 50.0,170.0 120.0))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == false
    assert Topo.intersects?(b, a) == false
    assert Topo.disjoint?(a, b) == true
    assert Topo.disjoint?(b, a) == true
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-022 - L/Ah-3-1: the start point of a line touching the inner boundary of a polygon" do
    a = "LINESTRING (170 120, 210 80, 270 80)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))"
      |> Geo.WKT.decode!()

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
  test "05-022 - L/Ah-3-1: the start point of a line touching the inner boundary of a polygon (float)" do
    a = "LINESTRING(170.0 120.0,210.0 80.0,270.0 80.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0),(170.0 120.0,330.0 120.0,260.0 50.0,100.0 50.0,170.0 120.0))"
      |> Geo.WKT.decode!()

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
  test "05-023 - L/Ah-3-2: both ends of a line touching the inner boundary of a polygon" do
    a = "LINESTRING (170 120, 260 50)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))"
      |> Geo.WKT.decode!()

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
  test "05-023 - L/Ah-3-2: both ends of a line touching the inner boundary of a polygon (float)" do
    a = "LINESTRING(170.0 120.0,260.0 50.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0),(170.0 120.0,330.0 120.0,260.0 50.0,100.0 50.0,170.0 120.0))"
      |> Geo.WKT.decode!()

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
  test "05-024 - L/Ah-3-1: both ends of a line touching the inner boundary of a polygon" do
    a = "LINESTRING (190 90, 190 270)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(190 190, 280 50, 100 50, 190 190))"
      |> Geo.WKT.decode!()

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
  test "05-024 - L/Ah-3-1: both ends of a line touching the inner boundary of a polygon (float)" do
    a = "LINESTRING(190.0 90.0,190.0 270.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(190.0 190.0,280.0 50.0,100.0 50.0,190.0 190.0))"
      |> Geo.WKT.decode!()

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
  test "05-025 - L/Ah-3-2: a line at a non-vertex crossing the boundary of a polygon where the closing point of the hole touches the shell at a non-vertex" do
    a = "LINESTRING (60 160, 150 70)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(110 110, 250 100, 140 30, 110 110))"
      |> Geo.WKT.decode!()

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
  test "05-025 - L/Ah-3-2: a line at a non-vertex crossing the boundary of a polygon where the closing point of the hole touches the shell at a non-vertex (float)" do
    a = "LINESTRING(60.0 160.0,150.0 70.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(110.0 110.0,250.0 100.0,140.0 30.0,110.0 110.0))"
      |> Geo.WKT.decode!()

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
  test "05-026 - L/Ah-3-3: a line at a non-vertex crossing the boundary of a polygon where the hole at a vertex touches the shell at a non-vertex" do
    a = "LINESTRING (60 160, 150 70)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 20 20, 360 20, 190 190),(250 100, 110 110, 140 30, 250 100))"
      |> Geo.WKT.decode!()

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
  test "05-026 - L/Ah-3-3: a line at a non-vertex crossing the boundary of a polygon where the hole at a vertex touches the shell at a non-vertex (float)" do
    a = "LINESTRING(60.0 160.0,150.0 70.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,20.0 20.0,360.0 20.0,190.0 190.0),(250.0 100.0,110.0 110.0,140.0 30.0,250.0 100.0))"
      |> Geo.WKT.decode!()

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
  test "05-027 - L/Ah-3-4: a line at a non-vertex crossing the boundary of a polygon where the hole at a vertex touches the shell at a vertex" do
    a = "LINESTRING (60 160, 150 70)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 20 20, 360 20, 190 190),(250 100, 110 110, 140 30, 250 100))"
      |> Geo.WKT.decode!()

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
  test "05-027 - L/Ah-3-4: a line at a non-vertex crossing the boundary of a polygon where the hole at a vertex touches the shell at a vertex (float)" do
    a = "LINESTRING(60.0 160.0,150.0 70.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,20.0 20.0,360.0 20.0,190.0 190.0),(250.0 100.0,110.0 110.0,140.0 30.0,250.0 100.0))"
      |> Geo.WKT.decode!()

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
  test "05-028 - L/Ah-3-5: a line crossing polygon boundary where the closing point of the hole touches the shell at a vertex" do
    a = "LINESTRING (190 90, 190 190, 190 270)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(190 190, 280 50, 100 50, 190 190))"
      |> Geo.WKT.decode!()

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
  test "05-028 - L/Ah-3-5: a line crossing polygon boundary where the closing point of the hole touches the shell at a vertex (float)" do
    a = "LINESTRING(190.0 90.0,190.0 190.0,190.0 270.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(190.0 190.0,280.0 50.0,100.0 50.0,190.0 190.0))"
      |> Geo.WKT.decode!()

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
  test "05-029 - L/Ah-3-6: a line at a vertex crossing the boundary of a polygon where closing point of the hole touches the shell at a non-vertex" do
    a = "LINESTRING (60 160, 110 110, 150 70)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(110 110, 250 100, 140 30, 110 110))"
      |> Geo.WKT.decode!()

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
  test "05-029 - L/Ah-3-6: a line at a vertex crossing the boundary of a polygon where closing point of the hole touches the shell at a non-vertex (float)" do
    a = "LINESTRING(60.0 160.0,110.0 110.0,150.0 70.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(110.0 110.0,250.0 100.0,140.0 30.0,110.0 110.0))"
      |> Geo.WKT.decode!()

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
  test "05-030 - L/Ah-3-7: a line at a vertex crossing the boundary of a polygon where the hole at a vertex touches the shell at a non-vertex" do
    a = "LINESTRING (60 160, 110 110, 150 70)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 20 20, 360 20, 190 190),(250 100, 110 110, 140 30, 250 100))"
      |> Geo.WKT.decode!()

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
  test "05-030 - L/Ah-3-7: a line at a vertex crossing the boundary of a polygon where the hole at a vertex touches the shell at a non-vertex (float)" do
    a = "LINESTRING(60.0 160.0,110.0 110.0,150.0 70.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,20.0 20.0,360.0 20.0,190.0 190.0),(250.0 100.0,110.0 110.0,140.0 30.0,250.0 100.0))"
      |> Geo.WKT.decode!()

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
  test "05-031 - L/Ah-3-8: a line at a non-vertex crossing the boundary of a polygon where the hole at a vertex touches the shell at a vertex" do
    a = "LINESTRING (60 160, 110 110, 150 70)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 110 110, 20 20, 360 20, 190 190),(250 100, 110 110, 140 30, 250 100))"
      |> Geo.WKT.decode!()

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
  test "05-031 - L/Ah-3-8: a line at a non-vertex crossing the boundary of a polygon where the hole at a vertex touches the shell at a vertex (float)" do
    a = "LINESTRING(60.0 160.0,110.0 110.0,150.0 70.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,110.0 110.0,20.0 20.0,360.0 20.0,190.0 190.0),(250.0 100.0,110.0 110.0,140.0 30.0,250.0 100.0))"
      |> Geo.WKT.decode!()

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
  test "05-032 - L/A2h-3-1: the start point a line touching the closing points of two connected holes in a polygon" do
    a = "LINESTRING (130 110, 180 110, 190 60)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 200, 240 200, 240 20, 20 20, 20 200),(130 110, 60 180, 60 40, 130 110),(130 110, 200 40, 200 180, 130 110))"
      |> Geo.WKT.decode!()

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
  test "05-032 - L/A2h-3-1: the start point a line touching the closing points of two connected holes in a polygon (float)" do
    a = "LINESTRING(130.0 110.0,180.0 110.0,190.0 60.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 200.0,240.0 200.0,240.0 20.0,20.0 20.0,20.0 200.0),(130.0 110.0,60.0 180.0,60.0 40.0,130.0 110.0),(130.0 110.0,200.0 40.0,200.0 180.0,130.0 110.0))"
      |> Geo.WKT.decode!()

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
  @tag :skip
  test "05-033 - L/A2h-3-2: the interior (at a non-vertex) of a line touching the closing points of two connected holes in a polygon" do
    a = "LINESTRING (80 110, 180 110)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 200, 240 200, 240 20, 20 20, 20 200),(130 110, 60 180, 60 40, 130 110),(130 110, 200 40, 200 180, 130 110))"
      |> Geo.WKT.decode!()

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
  @tag :skip
  test "05-033 - L/A2h-3-2: the interior (at a non-vertex) of a line touching the closing points of two connected holes in a polygon (float)" do
    a = "LINESTRING(80.0 110.0,180.0 110.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 200.0,240.0 200.0,240.0 20.0,20.0 20.0,20.0 200.0),(130.0 110.0,60.0 180.0,60.0 40.0,130.0 110.0),(130.0 110.0,200.0 40.0,200.0 180.0,130.0 110.0))"
      |> Geo.WKT.decode!()

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
  @tag :skip
  test "05-034 - L/A2h-3-3: the interior (at a non-vertex) of a line touching the closing point and at a vertex of two connected holes in a polygon" do
    a = "LINESTRING (80 110, 180 110)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 200, 20 20, 240 20, 240 200, 20 200),(60 180, 130 110, 60 40, 60 180),(130 110, 200 40, 200 180, 130 110))"
      |> Geo.WKT.decode!()

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
  @tag :skip
  test "05-034 - L/A2h-3-3: the interior (at a non-vertex) of a line touching the closing point and at a vertex of two connected holes in a polygon (float)" do
    a = "LINESTRING(80.0 110.0,180.0 110.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 200.0,20.0 20.0,240.0 20.0,240.0 200.0,20.0 200.0),(60.0 180.0,130.0 110.0,60.0 40.0,60.0 180.0),(130.0 110.0,200.0 40.0,200.0 180.0,130.0 110.0))"
      |> Geo.WKT.decode!()

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
  test "05-035 - L/A2h-3-4: the interior (at a non-vertex) of a line touching the closing point and at a non-vertex of two connected holes in a polygon" do
    a = "LINESTRING (80 110, 170 110)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 200, 20 20, 240 20, 240 200, 20 200),(130 110, 60 40, 60 180, 130 110),(130 180, 130 40, 200 110, 130 180))"
      |> Geo.WKT.decode!()

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
  test "05-035 - L/A2h-3-4: the interior (at a non-vertex) of a line touching the closing point and at a non-vertex of two connected holes in a polygon (float)" do
    a = "LINESTRING(80.0 110.0,170.0 110.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 200.0,20.0 20.0,240.0 20.0,240.0 200.0,20.0 200.0),(130.0 110.0,60.0 40.0,60.0 180.0,130.0 110.0),(130.0 180.0,130.0 40.0,200.0 110.0,130.0 180.0))"
      |> Geo.WKT.decode!()

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
  test "05-036 - L/A2h-3-5: the start point a line touching the closing point and a non-vertex of two connected holes in a polygon" do
    a = "LINESTRING (80 110, 130 110, 170 110)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 200, 20 20, 240 20, 240 200, 20 200),(130 110, 60 40, 60 180, 130 110),(130 180, 130 40, 200 110, 130 180))"
      |> Geo.WKT.decode!()

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
  test "05-036 - L/A2h-3-5: the start point a line touching the closing point and a non-vertex of two connected holes in a polygon (float)" do
    a = "LINESTRING(80.0 110.0,130.0 110.0,170.0 110.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 200.0,20.0 20.0,240.0 20.0,240.0 200.0,20.0 200.0),(130.0 110.0,60.0 40.0,60.0 180.0,130.0 110.0),(130.0 180.0,130.0 40.0,200.0 110.0,130.0 180.0))"
      |> Geo.WKT.decode!()

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
  @tag :skip
  test "05-037 - L/A2h-3-6: the interior (at a vertex) of a line touching the closing points of two connected holes in a polygon" do
    a = "LINESTRING (80 110, 130 110, 180 110)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 200, 240 200, 240 20, 20 20, 20 200),(130 110, 60 180, 60 40, 130 110),(130 110, 200 40, 200 180, 130 110))"
      |> Geo.WKT.decode!()

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
  @tag :skip
  test "05-037 - L/A2h-3-6: the interior (at a vertex) of a line touching the closing points of two connected holes in a polygon (float)" do
    a = "LINESTRING(80.0 110.0,130.0 110.0,180.0 110.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 200.0,240.0 200.0,240.0 20.0,20.0 20.0,20.0 200.0),(130.0 110.0,60.0 180.0,60.0 40.0,130.0 110.0),(130.0 110.0,200.0 40.0,200.0 180.0,130.0 110.0))"
      |> Geo.WKT.decode!()

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
  @tag :skip
  test "05-038 - L/A2h-3-7: the interior (at a vertex) of a line touching the closing point and at a vertex of two connected holes in a polygon" do
    a = "LINESTRING (80 110, 130 110, 180 110)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 200, 20 20, 240 20, 240 200, 20 200),(60 180, 130 110, 60 40, 60 180),(130 110, 200 40, 200 180, 130 110))"
      |> Geo.WKT.decode!()

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
  @tag :skip
  test "05-038 - L/A2h-3-7: the interior (at a vertex) of a line touching the closing point and at a vertex of two connected holes in a polygon (float)" do
    a = "LINESTRING(80.0 110.0,130.0 110.0,180.0 110.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 200.0,20.0 20.0,240.0 20.0,240.0 200.0,20.0 200.0),(60.0 180.0,130.0 110.0,60.0 40.0,60.0 180.0),(130.0 110.0,200.0 40.0,200.0 180.0,130.0 110.0))"
      |> Geo.WKT.decode!()

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
  test "05-039 - L/A2h-3-8: the interior (at a vertex) of a line touching the closing point and at a non-vertex of two connected holes in a polygon" do
    a = "LINESTRING (80 110, 130 110, 170 110)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 200, 20 20, 240 20, 240 200, 20 200),(130 110, 60 40, 60 180, 130 110),(130 180, 130 40, 200 110, 130 180))"
      |> Geo.WKT.decode!()

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
  test "05-039 - L/A2h-3-8: the interior (at a vertex) of a line touching the closing point and at a non-vertex of two connected holes in a polygon (float)" do
    a = "LINESTRING(80.0 110.0,130.0 110.0,170.0 110.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 200.0,20.0 20.0,240.0 20.0,240.0 200.0,20.0 200.0),(130.0 110.0,60.0 40.0,60.0 180.0,130.0 110.0),(130.0 180.0,130.0 40.0,200.0 110.0,130.0 180.0))"
      |> Geo.WKT.decode!()

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
  test "05-040 - L/mA-4-1: a line intersecting the interior and exterior of MultiPolygon" do
    a = "LINESTRING (160 70, 320 230)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((140 110, 260 110, 170 20, 50 20, 140 110)),((300 270, 420 270, 340 190, 220 190, 300 270)))"
      |> Geo.WKT.decode!()

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
  test "05-040 - L/mA-4-1: a line intersecting the interior and exterior of MultiPolygon (float)" do
    a = "LINESTRING(160.0 70.0,320.0 230.0)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON(((140.0 110.0,260.0 110.0,170.0 20.0,50.0 20.0,140.0 110.0)),((300.0 270.0,420.0 270.0,340.0 190.0,220.0 190.0,300.0 270.0)))"
      |> Geo.WKT.decode!()

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
  test "05-041 - L/mA-4-2: a line intersecting the interior and exterior of MultiPolygon" do
    a = "LINESTRING (160 70, 200 110, 280 190, 320 230)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((140 110, 260 110, 170 20, 50 20, 140 110)),((300 270, 420 270, 340 190, 220 190, 300 270)))"
      |> Geo.WKT.decode!()

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
  test "05-041 - L/mA-4-2: a line intersecting the interior and exterior of MultiPolygon (float)" do
    a = "LINESTRING(160.0 70.0,200.0 110.0,280.0 190.0,320.0 230.0)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON(((140.0 110.0,260.0 110.0,170.0 20.0,50.0 20.0,140.0 110.0)),((300.0 270.0,420.0 270.0,340.0 190.0,220.0 190.0,300.0 270.0)))"
      |> Geo.WKT.decode!()

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
  @tag :skip
  test "05-042 - L/mA-5-1: a line within two connected polygons" do
    a = "LINESTRING (70 50, 70 150)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((0 0, 0 100, 140 100, 140 0, 0 0)),((20 170, 70 100, 130 170, 20 170)))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  @tag :skip
  test "05-042 - L/mA-5-1: a line within two connected polygons (float)" do
    a = "LINESTRING(70.0 50.0,70.0 150.0)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON(((0.0 0.0,0.0 100.0,140.0 100.0,140.0 0.0,0.0 0.0)),((20.0 170.0,70.0 100.0,130.0 170.0,20.0 170.0)))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-043 - RL/A-3-1: a LinearRing touching a polygon's closing point" do
    a = "LINESTRING (110 110, 20 200, 200 200, 110 110)" |> Geo.WKT.decode!()
    b = "POLYGON ((20 20, 200 20, 110 110, 20 20))" |> Geo.WKT.decode!()

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
  test "05-043 - RL/A-3-1: a LinearRing touching a polygon's closing point (float)" do
    a = "LINESTRING(110.0 110.0,20.0 200.0,200.0 200.0,110.0 110.0)" |> Geo.WKT.decode!()
    b = "POLYGON((20.0 20.0,200.0 20.0,110.0 110.0,20.0 20.0))" |> Geo.WKT.decode!()

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
  test "05-044 - RL/A-3-2: a LinearRing touching a polygon's boundary at a non-vertex" do
    a = "LINESTRING (150 70, 160 110, 200 60, 150 70)" |> Geo.WKT.decode!()
    b = "POLYGON ((20 20, 200 20, 110 110, 20 20))" |> Geo.WKT.decode!()

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
  test "05-044 - RL/A-3-2: a LinearRing touching a polygon's boundary at a non-vertex (float)" do
    a = "LINESTRING(150.0 70.0,160.0 110.0,200.0 60.0,150.0 70.0)" |> Geo.WKT.decode!()
    b = "POLYGON((20.0 20.0,200.0 20.0,110.0 110.0,20.0 20.0))" |> Geo.WKT.decode!()

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
  test "05-045 - RL/A-3-3: a LinearRing touching a polygon's boundary at a non-vertex" do
    a = "LINESTRING (80 60, 120 40, 120 70, 80 60)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((110 110, 200 20, 20 20, 110 110),(110 90, 50 30, 170 30, 110 90))"
      |> Geo.WKT.decode!()

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
  test "05-045 - RL/A-3-3: a LinearRing touching a polygon's boundary at a non-vertex (float)" do
    a = "LINESTRING(80.0 60.0,120.0 40.0,120.0 70.0,80.0 60.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0),(110.0 90.0,50.0 30.0,170.0 30.0,110.0 90.0))"
      |> Geo.WKT.decode!()

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
  test "05-046 - RL/A-3-4: a LinearRing on the boundary of a polygon" do
    a = "LINESTRING (20 20, 200 20, 110 110, 20 20)" |> Geo.WKT.decode!()
    b = "POLYGON ((20 20, 200 20, 110 110, 20 20))" |> Geo.WKT.decode!()

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
  test "05-046 - RL/A-3-4: a LinearRing on the boundary of a polygon (float)" do
    a = "LINESTRING(20.0 20.0,200.0 20.0,110.0 110.0,20.0 20.0)" |> Geo.WKT.decode!()
    b = "POLYGON((20.0 20.0,200.0 20.0,110.0 110.0,20.0 20.0))" |> Geo.WKT.decode!()

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
  test "05-047 - RL/A-3-5: a LinearRing on the inner boundary of a polygon" do
    a = "LINESTRING (110 90, 170 30, 50 30, 110 90)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((110 110, 200 20, 20 20, 110 110),(110 90, 50 30, 170 30, 110 90))"
      |> Geo.WKT.decode!()

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
  test "05-047 - RL/A-3-5: a LinearRing on the inner boundary of a polygon (float)" do
    a = "LINESTRING(110.0 90.0,170.0 30.0,50.0 30.0,110.0 90.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0),(110.0 90.0,50.0 30.0,170.0 30.0,110.0 90.0))"
      |> Geo.WKT.decode!()

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
  test "05-048 - RL/A-3-6: a LinearRing on the inner boundary of a polygon" do
    a = "LINESTRING (110 110, 170 50, 170 110, 110 110)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((110 110, 200 20, 20 20, 110 110),(110 90, 50 30, 170 30, 110 90))"
      |> Geo.WKT.decode!()

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
  test "05-048 - RL/A-3-6: a LinearRing on the inner boundary of a polygon (float)" do
    a = "LINESTRING(110.0 110.0,170.0 50.0,170.0 110.0,110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0),(110.0 90.0,50.0 30.0,170.0 30.0,110.0 90.0))"
      |> Geo.WKT.decode!()

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
  test "05-049 - RL/A-3-7: a LinearRing on the inner boundary of a polygon" do
    a = "LINESTRING (110 90, 70 50, 130 50, 110 90)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((110 110, 200 20, 20 20, 110 110),(110 90, 50 30, 170 30, 110 90))"
      |> Geo.WKT.decode!()

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
  test "05-049 - RL/A-3-7: a LinearRing on the inner boundary of a polygon (float)" do
    a = "LINESTRING(110.0 90.0,70.0 50.0,130.0 50.0,110.0 90.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0),(110.0 90.0,50.0 30.0,170.0 30.0,110.0 90.0))"
      |> Geo.WKT.decode!()

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
  test "05-050 - RL/A-4-1: a LinearRing crossing a polygon" do
    a = "LINESTRING (110 60, 20 150, 200 150, 110 60)" |> Geo.WKT.decode!()
    b = "POLYGON ((20 20, 200 20, 110 110, 20 20))" |> Geo.WKT.decode!()

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
  test "05-050 - RL/A-4-1: a LinearRing crossing a polygon (float)" do
    a = "LINESTRING(110.0 60.0,20.0 150.0,200.0 150.0,110.0 60.0)" |> Geo.WKT.decode!()
    b = "POLYGON((20.0 20.0,200.0 20.0,110.0 110.0,20.0 20.0))" |> Geo.WKT.decode!()

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
  test "05-051 - RL/A-4-2: a LinearRing crossing a polygon with a hole" do
    a = "LINESTRING (110 130, 110 70, 200 100, 110 130)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((110 110, 200 20, 20 20, 110 110),(110 90, 50 30, 170 30, 110 90))"
      |> Geo.WKT.decode!()

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
  test "05-051 - RL/A-4-2: a LinearRing crossing a polygon with a hole (float)" do
    a = "LINESTRING(110.0 130.0,110.0 70.0,200.0 100.0,110.0 130.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0),(110.0 90.0,50.0 30.0,170.0 30.0,110.0 90.0))"
      |> Geo.WKT.decode!()

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
  test "05-052 - RL/A-5-1: a LinearRing within a polygon" do
    a = "LINESTRING (110 90, 160 40, 60 40, 110 90)" |> Geo.WKT.decode!()
    b = "POLYGON ((20 20, 200 20, 110 110, 20 20))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-052 - RL/A-5-1: a LinearRing within a polygon (float)" do
    a = "LINESTRING(110.0 90.0,160.0 40.0,60.0 40.0,110.0 90.0)" |> Geo.WKT.decode!()
    b = "POLYGON((20.0 20.0,200.0 20.0,110.0 110.0,20.0 20.0))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-053 - RL/A-5-2: a LinearRing within a polygon with a hole" do
    a = "LINESTRING (110 100, 40 30, 180 30, 110 100)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((110 110, 200 20, 20 20, 110 110),(110 90, 60 40, 160 40, 110 90))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-053 - RL/A-5-2: a LinearRing within a polygon with a hole (float)" do
    a = "LINESTRING(110.0 100.0,40.0 30.0,180.0 30.0,110.0 100.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0),(110.0 90.0,60.0 40.0,160.0 40.0,110.0 90.0))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-054 - RL/A-5-3: a LinearRing within a polygon with a hole" do
    a = "LINESTRING (110 110, 180 30, 40 30, 110 110)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((110 110, 200 20, 20 20, 110 110),(110 90, 60 40, 160 40, 110 90))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-054 - RL/A-5-3: a LinearRing within a polygon with a hole (float)" do
    a = "LINESTRING(110.0 110.0,180.0 30.0,40.0 30.0,110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0),(110.0 90.0,60.0 40.0,160.0 40.0,110.0 90.0))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-055 - RL/A-5-4: a LinearRing within a polygon with a hole" do
    a = "LINESTRING (110 90, 180 30, 40 30, 110 90)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((110 110, 200 20, 20 20, 110 110),(110 90, 60 40, 160 40, 110 90))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-055 - RL/A-5-4: a LinearRing within a polygon with a hole (float)" do
    a = "LINESTRING(110.0 90.0,180.0 30.0,40.0 30.0,110.0 90.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0),(110.0 90.0,60.0 40.0,160.0 40.0,110.0 90.0))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-056 - RL/A-5-5: a LinearRing within a polygon with a hole" do
    a = "LINESTRING (110 90, 50 30, 180 30, 110 90)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((110 110, 200 20, 20 20, 110 110),(110 90, 60 40, 160 40, 110 90))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-056 - RL/A-5-5: a LinearRing within a polygon with a hole (float)" do
    a = "LINESTRING(110.0 90.0,50.0 30.0,180.0 30.0,110.0 90.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0),(110.0 90.0,60.0 40.0,160.0 40.0,110.0 90.0))"
      |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-057 - nsL/A-3-1: a non-simple LineString touching a polygon" do
    a = "LINESTRING (110 110, 200 200, 200 110, 110 200)" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-057 - nsL/A-3-1: a non-simple LineString touching a polygon (float)" do
    a = "LINESTRING(110.0 110.0,200.0 200.0,200.0 110.0,110.0 200.0)" |> Geo.WKT.decode!()
    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-058 - nsL/A-3-2: a non-simple LineString touching a polygon" do
    a = "LINESTRING (110 110, 200 200, 110 110, 20 200, 20 110, 200 110)" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-058 - nsL/A-3-2: a non-simple LineString touching a polygon (float)" do
    a =
      "LINESTRING(110.0 110.0,200.0 200.0,110.0 110.0,20.0 200.0,20.0 110.0,200.0 110.0)"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-059 - nsL/A-3-3: a non-simple LineString touching a polygon" do
    a = "LINESTRING (110 110, 20 110, 200 110, 50 110, 110 170)" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-059 - nsL/A-3-3: a non-simple LineString touching a polygon (float)" do
    a =
      "LINESTRING(110.0 110.0,20.0 110.0,200.0 110.0,50.0 110.0,110.0 170.0)" |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-060 - nsL/A-3-4: a non-simple LineString touching a polygon" do
    a = "LINESTRING (110 110, 20 200, 110 200, 110 110, 200 200)" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-060 - nsL/A-3-4: a non-simple LineString touching a polygon (float)" do
    a =
      "LINESTRING(110.0 110.0,20.0 200.0,110.0 200.0,110.0 110.0,200.0 200.0)"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-061 - nsL/A-3-5: a non-simple LineString touching a polygon" do
    a = "LINESTRING (110 110, 170 50, 20 200, 20 110, 200 110)" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-061 - nsL/A-3-5: a non-simple LineString touching a polygon (float)" do
    a =
      "LINESTRING(110.0 110.0,170.0 50.0,20.0 200.0,20.0 110.0,200.0 110.0)" |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-062 - nsL/A-4-1: a non-simple LineString crossing a polygon" do
    a = "LINESTRING (110 110, 180 40, 110 40, 110 180)" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-062 - nsL/A-4-1: a non-simple LineString crossing a polygon (float)" do
    a = "LINESTRING(110.0 110.0,180.0 40.0,110.0 40.0,110.0 180.0)" |> Geo.WKT.decode!()
    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-063 - nsL/A-5-1: a non-simple LineString within a polygon" do
    a = "LINESTRING (110 60, 50 30, 170 30, 90 70)" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-063 - nsL/A-5-1: a non-simple LineString within a polygon (float)" do
    a = "LINESTRING(110.0 60.0,50.0 30.0,170.0 30.0,90.0 70.0)" |> Geo.WKT.decode!()
    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-064 - nsL/A-5-2: a non-simple LineString within a polygon" do
    a = "LINESTRING (110 110, 180 40, 110 40, 110 110, 70 40)" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-064 - nsL/A-5-2: a non-simple LineString within a polygon (float)" do
    a = "LINESTRING(110.0 110.0,180.0 40.0,110.0 40.0,110.0 110.0,70.0 40.0)" |> Geo.WKT.decode!()
    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-065 - nsL/Ah: the self-crossing point of a non-simple LineString touching the closing point of the inner boundary of a polygon" do
    a = "LINESTRING (230 70, 170 120, 190 60, 140 60, 170 120, 270 90)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))"
      |> Geo.WKT.decode!()

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
  test "05-065 - nsL/Ah: the self-crossing point of a non-simple LineString touching the closing point of the inner boundary of a polygon (float)" do
    a =
      "LINESTRING(230.0 70.0,170.0 120.0,190.0 60.0,140.0 60.0,170.0 120.0,270.0 90.0)"
      |> Geo.WKT.decode!()

    b =
      "POLYGON((150.0 150.0,410.0 150.0,280.0 20.0,20.0 20.0,150.0 150.0),(170.0 120.0,330.0 120.0,260.0 50.0,100.0 50.0,170.0 120.0))"
      |> Geo.WKT.decode!()

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
  test "05-066 - mL/A-3-1: MultiLineString touching a polygon's closing point" do
    a =
      "MULTILINESTRING ((20 110, 200 110),(200 200, 110 110, 20 210, 110 110))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-066 - mL/A-3-1: MultiLineString touching a polygon's closing point (float)" do
    a =
      "MULTILINESTRING((20.0 110.0,200.0 110.0),(200.0 200.0,110.0 110.0,20.0 210.0,110.0 110.0))"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-067 - mL/A-3-2: MultiLineString touching a polygon's closing point" do
    a =
      "MULTILINESTRING ((20 110, 200 110),(60 180, 60 110, 160 110, 110 110))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-067 - mL/A-3-2: MultiLineString touching a polygon's closing point (float)" do
    a =
      "MULTILINESTRING((20.0 110.0,200.0 110.0),(60.0 180.0,60.0 110.0,160.0 110.0,110.0 110.0))"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-068 - mL/A-3-3: MultiLineString touching a polygon's closing point" do
    a =
      "MULTILINESTRING ((20 110, 200 110),(200 200, 110 110, 20 200, 110 200, 110 110))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-068 - mL/A-3-3: MultiLineString touching a polygon's closing point (float)" do
    a =
      "MULTILINESTRING((20.0 110.0,200.0 110.0),(200.0 200.0,110.0 110.0,20.0 200.0,110.0 200.0,110.0 110.0))"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-069 - mL/A-4-1: MultiLineString crossing a polygon" do
    a =
      "MULTILINESTRING ((20 110, 200 110),(110 50, 110 170, 110 70, 110 150, 200 150))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-069 - mL/A-4-1: MultiLineString crossing a polygon (float)" do
    a =
      "MULTILINESTRING((20.0 110.0,200.0 110.0),(110.0 50.0,110.0 170.0,110.0 70.0,110.0 150.0,200.0 150.0))"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-070 - mL/A-4-2: MultiLineString crossing a polygon" do
    a =
      "MULTILINESTRING ((20 110, 200 110),(50 110, 170 110, 110 170, 110 50, 110 170, 110 50))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-070 - mL/A-4-2: MultiLineString crossing a polygon (float)" do
    a =
      "MULTILINESTRING((20.0 110.0,200.0 110.0),(50.0 110.0,170.0 110.0,110.0 170.0,110.0 50.0,110.0 170.0,110.0 50.0))"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-071 - mL/A-4-3: MultiLineString crossing a polygon" do
    a = "MULTILINESTRING ((20 110, 200 110),(110 60, 110 160, 200 160))" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-071 - mL/A-4-3: MultiLineString crossing a polygon (float)" do
    a =
      "MULTILINESTRING((20.0 110.0,200.0 110.0),(110.0 60.0,110.0 160.0,200.0 160.0))"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-072 - mL/A-4-4: MultiLineString crossing a polygon" do
    a = "MULTILINESTRING ((20 110, 200 110),(110 60, 110 160, 200 160))" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

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
  test "05-072 - mL/A-4-4: MultiLineString crossing a polygon (float)" do
    a =
      "MULTILINESTRING((20.0 110.0,200.0 110.0),(110.0 60.0,110.0 160.0,200.0 160.0))"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

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
  test "05-073 - mL/A-5-1: MultiLineString within a polygon" do
    a = "MULTILINESTRING ((110 100, 40 30, 180 30),(170 30, 110 90, 50 30))" |> Geo.WKT.decode!()
    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-073 - mL/A-5-1: MultiLineString within a polygon (float)" do
    a =
      "MULTILINESTRING((110.0 100.0,40.0 30.0,180.0 30.0),(170.0 30.0,110.0 90.0,50.0 30.0))"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-074 - mL/A-5-2: MultiLineString within a polygon" do
    a =
      "MULTILINESTRING ((110 110, 60 40, 70 20, 150 20, 170 40),(180 30, 40 30, 110 80))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((110 110, 200 20, 20 20, 110 110))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-074 - mL/A-5-2: MultiLineString within a polygon (float)" do
    a =
      "MULTILINESTRING((110.0 110.0,60.0 40.0,70.0 20.0,150.0 20.0,170.0 40.0),(180.0 30.0,40.0 30.0,110.0 80.0))"
      |> Geo.WKT.decode!()

    b = "POLYGON((110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "05-075 - mL/mA-3-1: MultiLineString within a MultiPolygon" do
    a =
      "MULTILINESTRING ((20 110, 200 110, 200 160),(110 110, 200 110, 200 70, 20 150))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((110 110, 20 20, 200 20, 110 110)),((110 110, 20 200, 200 200, 110 110)))"
      |> Geo.WKT.decode!()

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
  test "05-075 - mL/mA-3-1: MultiLineString within a MultiPolygon (float)" do
    a =
      "MULTILINESTRING((20.0 110.0,200.0 110.0,200.0 160.0),(110.0 110.0,200.0 110.0,200.0 70.0,20.0 150.0))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON(((110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0)),((110.0 110.0,20.0 200.0,200.0 200.0,110.0 110.0)))"
      |> Geo.WKT.decode!()

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
  test "05-076 - mL/mA-3-2: MultiLineString within a MultiPolygon" do
    a =
      "MULTILINESTRING ((20 160, 70 110, 150 110, 200 160),(110 110, 20 110, 50 80, 70 110, 200 110))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((110 110, 20 20, 200 20, 110 110)),((110 110, 20 200, 200 200, 110 110)))"
      |> Geo.WKT.decode!()

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
  test "05-076 - mL/mA-3-2: MultiLineString within a MultiPolygon (float)" do
    a =
      "MULTILINESTRING((20.0 160.0,70.0 110.0,150.0 110.0,200.0 160.0),(110.0 110.0,20.0 110.0,50.0 80.0,70.0 110.0,200.0 110.0))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON(((110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0)),((110.0 110.0,20.0 200.0,200.0 200.0,110.0 110.0)))"
      |> Geo.WKT.decode!()

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
  test "05-077 - mL/mA-3-3: MultiLineString within a MultiPolygon" do
    a =
      "MULTILINESTRING ((20 110, 200 110),(110 110, 20 170, 20 130, 200 90))" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((110 110, 20 20, 200 20, 110 110)),((110 110, 20 200, 200 200, 110 110)))"
      |> Geo.WKT.decode!()

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
  test "05-077 - mL/mA-3-3: MultiLineString within a MultiPolygon (float)" do
    a =
      "MULTILINESTRING((20.0 110.0,200.0 110.0),(110.0 110.0,20.0 170.0,20.0 130.0,200.0 90.0))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON(((110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0)),((110.0 110.0,20.0 200.0,200.0 200.0,110.0 110.0)))"
      |> Geo.WKT.decode!()

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
