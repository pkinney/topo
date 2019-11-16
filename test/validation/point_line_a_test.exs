defmodule Intersect.Validation.PointLineATest do
  use ExUnit.Case

  @tag :validation
  test "02-001 - P/L-2: a point and a line disjoint" do
    a = "POINT (110 200)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-001 - P/L-2: a point and a line disjoint (float)" do
    a = "POINT(110.0 200.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-002 - P/L-3-1: a point touching the start point of a line" do
    a = "POINT (90 80)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-002 - P/L-3-1: a point touching the start point of a line (float)" do
    a = "POINT(90.0 80.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-003 - P/L-3-2: a point touching the end point of a line" do
    a = "POINT (340 240)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-003 - P/L-3-2: a point touching the end point of a line (float)" do
    a = "POINT(340.0 240.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-004 - P/L-5-1: a point on the line at a non-vertex" do
    a = "POINT (230 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-004 - P/L-5-1: a point on the line at a non-vertex (float)" do
    a = "POINT(230.0 150.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-005 - P/L-5-2: a point on the line at a vertex" do
    a = "POINT (160 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-005 - P/L-5-2: a point on the line at a vertex (float)" do
    a = "POINT(160.0 150.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-006 - P/LR-2-1: a point outside a LinearRing" do
    a = "POINT (90 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (150 150, 20 20, 280 20, 150 150)" |> Geo.WKT.decode!()

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
  test "02-006 - P/LR-2-1: a point outside a LinearRing (float)" do
    a = "POINT(90.0 150.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(150.0 150.0,20.0 20.0,280.0 20.0,150.0 150.0)" |> Geo.WKT.decode!()

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
  test "02-007 - P/LR-2-2: a point inside a LinearRing" do
    a = "POINT (150 80)" |> Geo.WKT.decode!()
    b = "LINESTRING (150 150, 20 20, 280 20, 150 150)" |> Geo.WKT.decode!()

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
  test "02-007 - P/LR-2-2: a point inside a LinearRing (float)" do
    a = "POINT(150.0 80.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(150.0 150.0,20.0 20.0,280.0 20.0,150.0 150.0)" |> Geo.WKT.decode!()

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
  test "02-008 - P/LR-5-1: a point on the closing point of a LinearRing" do
    a = "POINT (150 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (150 150, 20 20, 280 20, 150 150)" |> Geo.WKT.decode!()

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
  test "02-008 - P/LR-5-1: a point on the closing point of a LinearRing (float)" do
    a = "POINT(150.0 150.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(150.0 150.0,20.0 20.0,280.0 20.0,150.0 150.0)" |> Geo.WKT.decode!()

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
  test "02-009 - P/LR-5-2: a point on a LinearRing at a non-vertex" do
    a = "POINT (100 20)" |> Geo.WKT.decode!()
    b = "LINESTRING (150 150, 20 20, 280 20, 150 150)" |> Geo.WKT.decode!()

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
  test "02-009 - P/LR-5-2: a point on a LinearRing at a non-vertex (float)" do
    a = "POINT(100.0 20.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(150.0 150.0,20.0 20.0,280.0 20.0,150.0 150.0)" |> Geo.WKT.decode!()

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
  test "02-010 - P/LR-5-3: a point on a LinearRing at a vertex" do
    a = "POINT (20 20)" |> Geo.WKT.decode!()
    b = "LINESTRING (150 150, 20 20, 280 20, 150 150)" |> Geo.WKT.decode!()

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
  test "02-010 - P/LR-5-3: a point on a LinearRing at a vertex (float)" do
    a = "POINT(20.0 20.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(150.0 150.0,20.0 20.0,280.0 20.0,150.0 150.0)" |> Geo.WKT.decode!()

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
  test "02-011 - P/nsL.1-3-1: a point on a non-simple LineString's end point" do
    a = "POINT (220 220)" |> Geo.WKT.decode!()
    b = "LINESTRING (110 110, 220 20, 20 20, 110 110, 220 220)" |> Geo.WKT.decode!()

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
  test "02-011 - P/nsL.1-3-1: a point on a non-simple LineString's end point (float)" do
    a = "POINT(220.0 220.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,220.0 20.0,20.0 20.0,110.0 110.0,220.0 220.0)" |> Geo.WKT.decode!()

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
  test "02-012 - P/nsL.1-5-1: a point on a non-simple LineString's start point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (110 110, 220 20, 20 20, 110 110, 220 220)" |> Geo.WKT.decode!()

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
  test "02-012 - P/nsL.1-5-1: a point on a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,220.0 20.0,20.0 20.0,110.0 110.0,220.0 220.0)" |> Geo.WKT.decode!()

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
  test "02-013 - P/nsL.1-5-2: a point a non-simple LineString's start point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (110 110, 220 20, 20 20, 220 220)" |> Geo.WKT.decode!()

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
  test "02-013 - P/nsL.1-5-2: a point a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(110.0 110.0,220.0 20.0,20.0 20.0,220.0 220.0)" |> Geo.WKT.decode!()

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
  test "02-014 - P/nsL.1-5-3: a point on a non-simple LineString's interior at a non-vertex" do
    a = "POINT (110 20)" |> Geo.WKT.decode!()
    b = "LINESTRING (110 110, 220 20, 20 20, 220 220)" |> Geo.WKT.decode!()

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
  test "02-014 - P/nsL.1-5-3: a point on a non-simple LineString's interior at a non-vertex (float)" do
    a = "POINT(110.0 20.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(110.0 110.0,220.0 20.0,20.0 20.0,220.0 220.0)" |> Geo.WKT.decode!()

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
  test "02-015 - P/nsL.1-5-4: a point on a non-simple LineString's interior at a vertex" do
    a = "POINT (220 20)" |> Geo.WKT.decode!()
    b = "LINESTRING (110 110, 220 20, 20 20, 220 220)" |> Geo.WKT.decode!()

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
  test "02-015 - P/nsL.1-5-4: a point on a non-simple LineString's interior at a vertex (float)" do
    a = "POINT(220.0 20.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(110.0 110.0,220.0 20.0,20.0 20.0,220.0 220.0)" |> Geo.WKT.decode!()

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
  test "02-016 - P/nsL.2-5-2: a point on a non-simple LineString's interior at a vertex" do
    a = "POINT (110 20)" |> Geo.WKT.decode!()
    b = "LINESTRING (220 220, 20 20, 220 20, 110 110)" |> Geo.WKT.decode!()

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
  test "02-016 - P/nsL.2-5-2: a point on a non-simple LineString's interior at a vertex (float)" do
    a = "POINT(110.0 20.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(220.0 220.0,20.0 20.0,220.0 20.0,110.0 110.0)" |> Geo.WKT.decode!()

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
  test "02-017 - P/nsL.2-5-3: a point on a non-simple LineString's interior at a vertex" do
    a = "POINT (20 20)" |> Geo.WKT.decode!()
    b = "LINESTRING (220 220, 20 20, 220 20, 110 110)" |> Geo.WKT.decode!()

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
  test "02-017 - P/nsL.2-5-3: a point on a non-simple LineString's interior at a vertex (float)" do
    a = "POINT(20.0 20.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(220.0 220.0,20.0 20.0,220.0 20.0,110.0 110.0)" |> Geo.WKT.decode!()

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
  test "02-018 - P/nsL.2-5-4: a point on a non-simple LineString's interior at a vertex with crossing line segments" do
    a = "POINT (20 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (20 200, 20 20, 110 20, 20 110, 110 200)" |> Geo.WKT.decode!()

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
  test "02-018 - P/nsL.2-5-4: a point on a non-simple LineString's interior at a vertex with crossing line segments (float)" do
    a = "POINT(20.0 110.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(20.0 200.0,20.0 20.0,110.0 20.0,20.0 110.0,110.0 200.0)" |> Geo.WKT.decode!()

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
  test "02-019 - P/nsL.3-3-1: a point on a non-simple LineString's start point" do
    a = "POINT (20 200)" |> Geo.WKT.decode!()
    b = "LINESTRING (20 200, 200 20, 20 20, 200 200)" |> Geo.WKT.decode!()

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
  test "02-019 - P/nsL.3-3-1: a point on a non-simple LineString's start point (float)" do
    a = "POINT(20.0 200.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(20.0 200.0,200.0 20.0,20.0 20.0,200.0 200.0)" |> Geo.WKT.decode!()

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
  test "02-020 - P/nsL.3-5-1: a point on a non-simple LineString's interior at a non-vertex with overlapping line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (20 200, 200 20, 140 20, 140 80, 80 140, 20 140)" |> Geo.WKT.decode!()

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
  test "02-020 - P/nsL.3-5-1: a point on a non-simple LineString's interior at a non-vertex with overlapping line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(20.0 200.0,200.0 20.0,140.0 20.0,140.0 80.0,80.0 140.0,20.0 140.0)"
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
  test "02-021 - P/nsL.3-5-2: a point on a non-simple LineString's interior at a non-vertex with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (20 200, 200 20, 20 20, 200 200)" |> Geo.WKT.decode!()

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
  test "02-021 - P/nsL.3-5-2: a point on a non-simple LineString's interior at a non-vertex with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(20.0 200.0,200.0 20.0,20.0 20.0,200.0 200.0)" |> Geo.WKT.decode!()

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
  test "02-022 - P/nsL.3-5-3: a point on a non-simple LineString's interior at a vertex with both crossing and overlapping line segments" do
    a = "POINT (80 140)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (20 200, 110 110, 200 20, 140 20, 140 80, 110 110, 80 140, 20 140)"
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
  test "02-022 - P/nsL.3-5-3: a point on a non-simple LineString's interior at a vertex with both crossing and overlapping line segments (float)" do
    a = "POINT(80.0 140.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(20.0 200.0,110.0 110.0,200.0 20.0,140.0 20.0,140.0 80.0,110.0 110.0,80.0 140.0,20.0 140.0)"
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
  test "02-023 - P/nsL.3-5-4: a point on a non-simple LineString's interior at a two-vertex point with overlapping line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (20 200, 110 110, 200 20, 140 20, 140 80, 110 110, 80 140, 20 140)"
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
  test "02-023 - P/nsL.3-5-4: a point on a non-simple LineString's interior at a two-vertex point with overlapping line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(20.0 200.0,110.0 110.0,200.0 20.0,140.0 20.0,140.0 80.0,110.0 110.0,80.0 140.0,20.0 140.0)"
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
  test "02-024 - P/nsL.3-5-5: a point on a non-simple LineString's interior at a vertex with overlapping line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (20 200, 200 20, 140 20, 140 80, 110 110, 80 140, 20 140)" |> Geo.WKT.decode!()

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
  test "02-024 - P/nsL.3-5-5: a point on a non-simple LineString's interior at a vertex with overlapping line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(20.0 200.0,200.0 20.0,140.0 20.0,140.0 80.0,110.0 110.0,80.0 140.0,20.0 140.0)"
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
  test "02-025 - P/nsL.3-5-6: a point on a non-simple LineString's interior at a two-vertex point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (20 200, 110 110, 200 20, 20 20, 110 110, 200 200)" |> Geo.WKT.decode!()

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
  test "02-025 - P/nsL.3-5-6: a point on a non-simple LineString's interior at a two-vertex point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(20.0 200.0,110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0,200.0 200.0)"
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
  test "02-026 - P/nsL.3-5-7: a point on a non-simple LineString's interior at a vertex with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (20 200, 200 20, 20 20, 110 110, 200 200)" |> Geo.WKT.decode!()

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
  test "02-026 - P/nsL.3-5-7: a point on a non-simple LineString's interior at a vertex with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(20.0 200.0,200.0 20.0,20.0 20.0,110.0 110.0,200.0 200.0)" |> Geo.WKT.decode!()

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
  test "02-027 - P/nsL.3-5-8: a point on a non-simple LineString's interior at a two-vertex point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (20 200, 110 110, 20 20, 200 20, 110 110, 200 200)" |> Geo.WKT.decode!()

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
  test "02-027 - P/nsL.3-5-8: a point on a non-simple LineString's interior at a two-vertex point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(20.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,200.0 200.0)"
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
  test "02-028 - P/nsL.4-3-1: a point on a non-simple LineString's start point with crossing and overlapping line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 110 200, 20 200, 110 110, 200 20, 140 20, 140 80, 110 110, 80 140, 20 140)"
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
  test "02-028 - P/nsL.4-3-1: a point on a non-simple LineString's start point with crossing and overlapping line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,110.0 200.0,20.0 200.0,110.0 110.0,200.0 20.0,140.0 20.0,140.0 80.0,110.0 110.0,80.0 140.0,20.0 140.0)"
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
  test "02-029 - P/nsL.4-3-2: a point on a non-simple LineString's start point with crossing and overlapping line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 110 200, 20 200, 200 20, 140 20, 140 80, 110 110, 80 140, 20 140)"
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
  test "02-029 - P/nsL.4-3-2: a point on a non-simple LineString's start point with crossing and overlapping line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,110.0 200.0,20.0 200.0,200.0 20.0,140.0 20.0,140.0 80.0,110.0 110.0,80.0 140.0,20.0 140.0)"
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
  test "02-030 - P/nsL.4-3-3:a point on a non-simple LineString's start point with crossing and overlapping line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 110 200, 20 200, 200 20, 140 20, 140 80, 80 140, 20 140)"
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
  test "02-030 - P/nsL.4-3-3:a point on a non-simple LineString's start point with crossing and overlapping line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,110.0 200.0,20.0 200.0,200.0 20.0,140.0 20.0,140.0 80.0,80.0 140.0,20.0 140.0)"
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
  test "02-031 - P/nsL.4-3-4: a point on a non-simple LineString's start point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 110 200, 20 200, 110 110, 200 20, 20 20, 110 110, 200 200)"
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
  test "02-031 - P/nsL.4-3-4: a point on a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,110.0 200.0,20.0 200.0,110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0,200.0 200.0)"
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
  test "02-032 - P/nsL.4-3-5: a point on a non-simple LineString's start point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 110 200, 20 200, 200 20, 20 20, 110 110, 200 200)"
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
  test "02-032 - P/nsL.4-3-5: a point on a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,110.0 200.0,20.0 200.0,200.0 20.0,20.0 20.0,110.0 110.0,200.0 200.0)"
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
  test "02-033 - P/nsL.4-3-6: a point on a non-simple LineString's start point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (110 110, 110 200, 20 200, 200 20, 20 20, 200 200)" |> Geo.WKT.decode!()

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
  test "02-033 - P/nsL.4-3-6: a point on a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,110.0 200.0,20.0 200.0,200.0 20.0,20.0 20.0,200.0 200.0)"
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
  test "02-034 - P/nsL.4-3-7: a point on a non-simple LineString's start point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 110 200, 20 200, 110 110, 20 20, 200 20, 110 110, 200 200)"
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
  test "02-034 - P/nsL.4-3-7: a point on a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,110.0 200.0,20.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,200.0 200.0)"
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
  test "02-035 - P/nsL.4-3-8: a point on a non-simple LineString's start point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 110 200, 20 200, 200 20, 200 110, 110 110, 200 200)"
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
  test "02-035 - P/nsL.4-3-8: a point on a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,110.0 200.0,20.0 200.0,200.0 20.0,200.0 110.0,110.0 110.0,200.0 200.0)"
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
  test "02-036 - P/nsL.5-3-1: a point on a non-simple LineString's end point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (200 200, 110 110, 20 20, 200 20, 110 110, 20 200, 110 200, 110 110)"
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
  test "02-036 - P/nsL.5-3-1: a point on a non-simple LineString's end point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,20.0 200.0,110.0 200.0,110.0 110.0)"
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
  test "02-037 - P/nsL.5-3-2: a point on a non-simple LineString's end point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (200 200, 20 20, 200 20, 110 110, 20 200, 110 200, 110 110)"
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
  test "02-037 - P/nsL.5-3-2: a point on a non-simple LineString's end point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,20.0 20.0,200.0 20.0,110.0 110.0,20.0 200.0,110.0 200.0,110.0 110.0)"
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
  test "02-038 - P/nsL.5-3-3: a point on a non-simple LineString's end point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (200 200, 20 20, 200 20, 20 200, 110 200, 110 110)" |> Geo.WKT.decode!()

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
  test "02-038 - P/nsL.5-3-3: a point on a non-simple LineString's end point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,20.0 20.0,200.0 20.0,20.0 200.0,110.0 200.0,110.0 110.0)"
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
  test "02-039 - P/nsL.5-3-4: a point on a non-simple LineString's end point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (200 200, 110 110, 200 20, 20 20, 110 110, 20 200, 110 200, 110 110)"
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
  test "02-039 - P/nsL.5-3-4: a point on a non-simple LineString's end point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0,20.0 200.0,110.0 200.0,110.0 110.0)"
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
  test "02-040 - P/nsL.5-3-5: a point on a non-simple LineString's end point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (200 200, 20 20, 20 110, 110 110, 20 200, 110 200, 110 110)"
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
  test "02-040 - P/nsL.5-3-5: a point on a non-simple LineString's end point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,20.0 20.0,20.0 110.0,110.0 110.0,20.0 200.0,110.0 200.0,110.0 110.0)"
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
  test "02-041 - P/nsL.6-3-1: a point on a non-simple LineString's start point with crossing line segments" do
    a = "POINT (110 160)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 160, 200 250, 110 250, 110 160, 110 110, 110 20, 20 20, 110 110)"
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
  test "02-041 - P/nsL.6-3-1: a point on a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(110.0 160.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 160.0,200.0 250.0,110.0 250.0,110.0 160.0,110.0 110.0,110.0 20.0,20.0 20.0,110.0 110.0)"
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
  test "02-042 - P/nsL.6-3-2: a point on a non-simple LineString's start point with crossing line segments" do
    a = "POINT (110 160)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 160, 200 250, 110 250, 110 110, 110 20, 20 20, 110 110)"
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
  test "02-042 - P/nsL.6-3-2: a point on a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(110.0 160.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 160.0,200.0 250.0,110.0 250.0,110.0 110.0,110.0 20.0,20.0 20.0,110.0 110.0)"
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
  test "02-043 - P/nsL.6-3-3: a point on a non-simple LineString's end point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 160, 200 250, 110 250, 110 160, 110 110, 110 20, 20 20, 110 110)"
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
  test "02-043 - P/nsL.6-3-3: a point on a non-simple LineString's end point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 160.0,200.0 250.0,110.0 250.0,110.0 160.0,110.0 110.0,110.0 20.0,20.0 20.0,110.0 110.0)"
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
  test "02-044 - P/nsL.6-3-4: a point on a non-simple LineString's end point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 160, 200 250, 110 250, 110 160, 110 20, 20 20, 110 110)"
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
  test "02-044 - P/nsL.6-3-4: a point on a non-simple LineString's end point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 160.0,200.0 250.0,110.0 250.0,110.0 160.0,110.0 20.0,20.0 20.0,110.0 110.0)"
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
  test "02-045 - P/nsL.7-5-1: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 200 200, 110 200, 110 110, 110 20, 20 20, 110 110)"
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
  test "02-045 - P/nsL.7-5-1: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,200.0 200.0,110.0 200.0,110.0 110.0,110.0 20.0,20.0 20.0,110.0 110.0)"
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
  test "02-046 - P/nsL.7-5-2: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (110 110, 200 200, 110 200, 110 20, 20 20, 110 110)" |> Geo.WKT.decode!()

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
  test "02-046 - P/nsL.7-5-2: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,200.0 200.0,110.0 200.0,110.0 20.0,20.0 20.0,110.0 110.0)"
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
  test "02-047 - P/nsL.7-5-3: a point on a closed non-simple LineString's interior at a non-vertex" do
    a = "POINT (140 200)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 200 200, 110 200, 110 110, 110 20, 20 20, 110 110)"
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
  test "02-047 - P/nsL.7-5-3: a point on a closed non-simple LineString's interior at a non-vertex (float)" do
    a = "POINT(140.0 200.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,200.0 200.0,110.0 200.0,110.0 110.0,110.0 20.0,20.0 20.0,110.0 110.0)"
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
  test "02-048 - P/nsL.7-5-4: a point on a closed non-simple LineString's interior at a vertex" do
    a = "POINT (110 200)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 200 200, 110 200, 110 110, 110 20, 20 20, 110 110)"
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
  test "02-048 - P/nsL.7-5-4: a point on a closed non-simple LineString's interior at a vertex (float)" do
    a = "POINT(110.0 200.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,200.0 200.0,110.0 200.0,110.0 110.0,110.0 20.0,20.0 20.0,110.0 110.0)"
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
  test "02-049 - P/nsL.8-5-1: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 200 200, 110 200, 110 110, 110 20, 200 20, 110 110)"
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
  test "02-049 - P/nsL.8-5-1: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,200.0 200.0,110.0 200.0,110.0 110.0,110.0 20.0,200.0 20.0,110.0 110.0)"
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
  test "02-050 - P/nsL.8-5-2: a point on the interior (at a non-vertex) of a closed non-simple LineString" do
    a = "POINT (140 200)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 200 200, 110 200, 110 110, 110 20, 200 20, 110 110)"
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
  test "02-050 - P/nsL.8-5-2: a point on the interior (at a non-vertex) of a closed non-simple LineString (float)" do
    a = "POINT(140.0 200.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,200.0 200.0,110.0 200.0,110.0 110.0,110.0 20.0,200.0 20.0,110.0 110.0)"
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
  test "02-051 - P/nsL.8-5-3: a point on a closed non-simple LineString's interior at a vertex" do
    a = "POINT (110 200)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 200 200, 110 200, 110 110, 110 20, 200 20, 110 110)"
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
  test "02-051 - P/nsL.8-5-3: a point on a closed non-simple LineString's interior at a vertex (float)" do
    a = "POINT(110.0 200.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,200.0 200.0,110.0 200.0,110.0 110.0,110.0 20.0,200.0 20.0,110.0 110.0)"
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
  test "02-052 - P/nsL.9-3-1: a point on a non-simple LineString's start point with crossing line segments" do
    a = "POINT (90 130)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 130, 20 130, 20 200, 90 130, 200 20, 20 20, 200 200)" |> Geo.WKT.decode!()

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
  test "02-052 - P/nsL.9-3-1: a point on a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(90.0 130.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,20.0 130.0,20.0 200.0,90.0 130.0,200.0 20.0,20.0 20.0,200.0 200.0)"
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
  test "02-053 - P/nsL.9-5-1: a point on a non-simple LineString's interior at a non-vertex with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 130, 20 130, 20 200, 90 130, 200 20, 20 20, 200 200)" |> Geo.WKT.decode!()

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
  test "02-053 - P/nsL.9-5-1: a point on a non-simple LineString's interior at a non-vertex with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,20.0 130.0,20.0 200.0,90.0 130.0,200.0 20.0,20.0 20.0,200.0 200.0)"
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
  test "02-054 - P/nsL.10-3-1: a point on a non-simple LineString's start point with crossing line segments" do
    a = "POINT (90 130)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 130, 20 130, 20 200, 200 20, 20 20, 200 200)" |> Geo.WKT.decode!()

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
  test "02-054 - P/nsL.10-3-1: a point on a non-simple LineString's start point with crossing line segments (float)" do
    a = "POINT(90.0 130.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,20.0 130.0,20.0 200.0,200.0 20.0,20.0 20.0,200.0 200.0)"
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
  test "02-055 - P/nsL.10-5-1: a point on a non-simple LineString's interior at a non-vertex with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 130, 20 130, 20 200, 200 20, 20 20, 200 200)" |> Geo.WKT.decode!()

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
  test "02-055 - P/nsL.10-5-1: a point on a non-simple LineString's interior at a non-vertex with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,20.0 130.0,20.0 200.0,200.0 20.0,20.0 20.0,200.0 200.0)"
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
  test "02-056 - P/nsL.11-3-1: a point on a closed non-simple LineString's end point with crossing line segments" do
    a = "POINT (90 130)" |> Geo.WKT.decode!()
    b = "LINESTRING (200 200, 20 20, 200 20, 90 130, 20 200, 20 130, 90 130)" |> Geo.WKT.decode!()

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
  test "02-056 - P/nsL.11-3-1: a point on a closed non-simple LineString's end point with crossing line segments (float)" do
    a = "POINT(90.0 130.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,20.0 20.0,200.0 20.0,90.0 130.0,20.0 200.0,20.0 130.0,90.0 130.0)"
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
  test "02-057 - P/nsL.11-5-1: a point on a closed non-simple LineString's interior at a non-vertex with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (200 200, 20 20, 200 20, 90 130, 20 200, 20 130, 90 130)" |> Geo.WKT.decode!()

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
  test "02-057 - P/nsL.11-5-1: a point on a closed non-simple LineString's interior at a non-vertex with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,20.0 20.0,200.0 20.0,90.0 130.0,20.0 200.0,20.0 130.0,90.0 130.0)"
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
  test "02-058 - P/nsL.12-3-1: a point on a closed non-simple LineString's end point with crossing line segments" do
    a = "POINT (90 130)" |> Geo.WKT.decode!()
    b = "LINESTRING (200 200, 20 20, 200 20, 20 200, 20 130, 90 130)" |> Geo.WKT.decode!()

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
  test "02-058 - P/nsL.12-3-1: a point on a closed non-simple LineString's end point with crossing line segments (float)" do
    a = "POINT(90.0 130.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,20.0 20.0,200.0 20.0,20.0 200.0,20.0 130.0,90.0 130.0)"
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
  test "02-059 - P/nsL.12-5-1: a point on a closed non-simple LineString's interior at a non-vertex with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (200 200, 20 20, 200 20, 20 200, 20 130, 90 130)" |> Geo.WKT.decode!()

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
  test "02-059 - P/nsL.12-5-1: a point on a closed non-simple LineString's interior at a non-vertex with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,20.0 20.0,200.0 20.0,20.0 200.0,20.0 130.0,90.0 130.0)"
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
  test "02-060 - P/nsL.13-5-1: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 20 130, 20 200, 110 110, 200 20, 20 20, 110 110, 200 200, 200 130, 110 110)"
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
  test "02-060 - P/nsL.13-5-1: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,20.0 130.0,20.0 200.0,110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0,200.0 200.0,200.0 130.0,110.0 110.0)"
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
  test "02-061 - P/nsL.13-5-2: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 20 130, 20 200, 200 20, 20 20, 200 200, 200 130, 110 110)"
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
  test "02-061 - P/nsL.13-5-2: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,20.0 130.0,20.0 200.0,200.0 20.0,20.0 20.0,200.0 200.0,200.0 130.0,110.0 110.0)"
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
  test "02-062 - P/nsL.14-5-1: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 80 200, 20 200, 110 110, 200 20, 20 20, 110 110, 200 200, 140 200, 110 110)"
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
  test "02-062 - P/nsL.14-5-1: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,80.0 200.0,20.0 200.0,110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0,200.0 200.0,140.0 200.0,110.0 110.0)"
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
  test "02-063 - P/nsL.14-5-2: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 110, 80 200, 20 200, 200 20, 20 20, 200 200, 140 200, 110 110)"
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
  test "02-063 - P/nsL.14-5-2: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 110.0,80.0 200.0,20.0 200.0,200.0 20.0,20.0 20.0,200.0 200.0,140.0 200.0,110.0 110.0)"
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
  test "02-064 - P/nsL.15-5-1: a point on a closed non-simple LineString's interior at a non-vertex with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (200 200, 20 20, 200 20, 20 200, 200 200)" |> Geo.WKT.decode!()

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
  test "02-064 - P/nsL.15-5-1: a point on a closed non-simple LineString's interior at a non-vertex with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(200.0 200.0,20.0 20.0,200.0 20.0,20.0 200.0,200.0 200.0)" |> Geo.WKT.decode!()

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
  test "02-065 - P/nsL.15-5-2: a point on a closed non-simple LineString's interior at a vertex with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (200 200, 110 110, 20 20, 200 20, 110 110, 20 200, 200 200)"
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
  test "02-065 - P/nsL.15-5-2: a point on a closed non-simple LineString's interior at a vertex with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,20.0 200.0,200.0 200.0)"
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
  test "02-066 - P/nsL.15-5-3: a point on a closed non-simple LineString's interior at a vertex with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (200 200, 110 110, 200 20, 20 20, 110 110, 20 200, 200 200)"
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
  test "02-066 - P/nsL.15-5-3: a point on a closed non-simple LineString's interior at a vertex with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(200.0 200.0,110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0,20.0 200.0,200.0 200.0)"
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
  test "02-067 - P/nsL.16-5-1: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (90 130)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (90 130, 20 130, 20 200, 90 130, 110 110, 200 20, 20 20, 110 110, 200 200, 90 130)"
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
  test "02-067 - P/nsL.16-5-1: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(90.0 130.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,20.0 130.0,20.0 200.0,90.0 130.0,110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0,200.0 200.0,90.0 130.0)"
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
  test "02-068 - P/nsL.16-5-2: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (90 130)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (90 130, 20 130, 20 200, 110 110, 200 20, 20 20, 110 110, 200 200, 90 130)"
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
  test "02-068 - P/nsL.16-5-2: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(90.0 130.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,20.0 130.0,20.0 200.0,110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0,200.0 200.0,90.0 130.0)"
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
  test "02-069 - P/nsL.17-5-1: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (90 130)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (90 130, 90 200, 20 200, 90 130, 110 110, 200 20, 20 20, 110 110, 200 200, 90 130)"
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
  test "02-069 - P/nsL.17-5-1: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(90.0 130.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,90.0 200.0,20.0 200.0,90.0 130.0,110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0,200.0 200.0,90.0 130.0)"
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
  test "02-070 - P/nsL.17-5-2: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (90 130)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 130, 90 200, 20 200, 200 20, 20 20, 200 200, 90 130)" |> Geo.WKT.decode!()

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
  test "02-070 - P/nsL.17-5-2: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(90.0 130.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,90.0 200.0,20.0 200.0,200.0 20.0,20.0 20.0,200.0 200.0,90.0 130.0)"
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
  test "02-071 - P/nsL.17-5-3: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (90 130)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (90 130, 90 200, 20 200, 110 110, 200 20, 20 20, 110 110, 200 200, 90 130)"
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
  test "02-071 - P/nsL.17-5-3: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(90.0 130.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,90.0 200.0,20.0 200.0,110.0 110.0,200.0 20.0,20.0 20.0,110.0 110.0,200.0 200.0,90.0 130.0)"
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
  test "02-072 - P/nsL.17-5-4: a point on a closed non-simple LineString's closing point with crossing line segments" do
    a = "POINT (90 130)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 130, 90 200, 20 200, 200 20, 20 20, 200 200, 90 130)" |> Geo.WKT.decode!()

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
  test "02-072 - P/nsL.17-5-4: a point on a closed non-simple LineString's closing point with crossing line segments (float)" do
    a = "POINT(90.0 130.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,90.0 200.0,20.0 200.0,200.0 20.0,20.0 20.0,200.0 200.0,90.0 130.0)"
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
  test "02-073 - P/nsL.17-5-5: a point on a closed non-simple LineString's interior at a non-vertex with crossing line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 130, 90 200, 20 200, 200 20, 20 20, 200 200, 90 130)" |> Geo.WKT.decode!()

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
  test "02-073 - P/nsL.17-5-5: a point on a closed non-simple LineString's interior at a non-vertex with crossing line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 130.0,90.0 200.0,20.0 200.0,200.0 20.0,20.0 20.0,200.0 200.0,90.0 130.0)"
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
  test "02-074 - P/nsL.18-5-1: a point on a non-simple LineString's start point with both crossing and overlapping line segments" do
    a = "POINT (110 200)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 200, 110 110, 20 20, 200 20, 110 110, 110 200, 200 200)"
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
  test "02-074 - P/nsL.18-5-1: a point on a non-simple LineString's start point with both crossing and overlapping line segments (float)" do
    a = "POINT(110.0 200.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,110.0 200.0,200.0 200.0)"
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
  test "02-075 - P/nsL.18-5-2: a point on a non-simple LineString's interior at a non-vertex with overlapping line segments" do
    a = "POINT (110 150)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 200, 110 110, 20 20, 200 20, 110 110, 110 200, 200 200)"
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
  test "02-075 - P/nsL.18-5-2: a point on a non-simple LineString's interior at a non-vertex with overlapping line segments (float)" do
    a = "POINT(110.0 150.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,110.0 200.0,200.0 200.0)"
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
  test "02-076 - P/nsL.18-5-3: a point on a non-simple LineString's interior at a vertex with both crossing and overlapping line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (110 200, 110 110, 20 20, 200 20, 110 110, 110 200, 200 200)"
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
  test "02-076 - P/nsL.18-5-3: a point on a non-simple LineString's interior at a vertex with both crossing and overlapping line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,110.0 200.0,200.0 200.0)"
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
  test "02-077 - P/nsL.19-5-1: a point on a non-simple LineString's closing point with overlapping line segments" do
    a = "POINT (110 200)" |> Geo.WKT.decode!()
    b = "LINESTRING (110 200, 110 110, 20 20, 200 20, 110 110, 110 200)" |> Geo.WKT.decode!()

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
  test "02-077 - P/nsL.19-5-1: a point on a non-simple LineString's closing point with overlapping line segments (float)" do
    a = "POINT(110.0 200.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,110.0 200.0)"
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
  test "02-078 - P/nsL.19-5-2: a point on a non-simple LineString's interior at a non-vertex overlapping line segments" do
    a = "POINT (110 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (110 200, 110 110, 20 20, 200 20, 110 110, 110 200)" |> Geo.WKT.decode!()

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
  test "02-078 - P/nsL.19-5-2: a point on a non-simple LineString's interior at a non-vertex overlapping line segments (float)" do
    a = "POINT(110.0 150.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,110.0 200.0)"
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
  test "02-079 - P/nsL.19-5-3: a point on a non-simple LineString interior at a vertex with both crossing and overlapping line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (110 200, 110 110, 20 20, 200 20, 110 110, 110 200)" |> Geo.WKT.decode!()

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
  test "02-079 - P/nsL.19-5-3: a point on a non-simple LineString interior at a vertex with both crossing and overlapping line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(110.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,110.0 200.0)"
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
  test "02-080 - P/nsL.20-5-1: a point on a non-simple LineString's interior at a non-vertex with overlapping line segments" do
    a = "POINT (110 150)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (20 200, 110 200, 110 110, 20 20, 200 20, 110 110, 110 200, 200 200)"
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
  test "02-080 - P/nsL.20-5-1: a point on a non-simple LineString's interior at a non-vertex with overlapping line segments (float)" do
    a = "POINT(110.0 150.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(20.0 200.0,110.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,110.0 200.0,200.0 200.0)"
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
  test "02-081 - P/nsL.20-5-2: a point on a non-simple LineString's interior at a vertex with both crossing and overlapping line segments" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (20 200, 110 200, 110 110, 20 20, 200 20, 110 110, 110 200, 200 200)"
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
  test "02-081 - P/nsL.20-5-2: a point on a non-simple LineString's interior at a vertex with both crossing and overlapping line segments (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(20.0 200.0,110.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,110.0 200.0,200.0 200.0)"
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
  test "02-082 - P/nsl.20-5-3: a point on a non-simple LineString's interior at a vertex with both crossing and overlapping line segments" do
    a = "POINT (110 200)" |> Geo.WKT.decode!()

    b =
      "LINESTRING (20 200, 110 200, 110 110, 20 20, 200 20, 110 110, 110 200, 200 200)"
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
  test "02-082 - P/nsl.20-5-3: a point on a non-simple LineString's interior at a vertex with both crossing and overlapping line segments (float)" do
    a = "POINT(110.0 200.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(20.0 200.0,110.0 200.0,110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0,110.0 200.0,200.0 200.0)"
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
  test "02-083 - mP/L-2-1: MultiPoint and a line disjoint (points on one side of the line)" do
    a = "MULTIPOINT (50 250, 90 220, 130 190)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-083 - mP/L-2-1: MultiPoint and a line disjoint (points on one side of the line) (float)" do
    a = "MULTIPOINT(50.0 250.0,90.0 220.0,130.0 190.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-084 - mP/L-2-2: MultiPoint and a line disjoint (points over the line but no intersection)" do
    a = "MULTIPOINT (180 180, 230 130, 280 80)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-084 - mP/L-2-2: MultiPoint and a line disjoint (points over the line but no intersection) (float)" do
    a = "MULTIPOINT(180.0 180.0,230.0 130.0,280.0 80.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-085 - mP/L-3-1: one of the points intersecting the start point of a line" do
    a = "MULTIPOINT (50 120, 90 80, 130 40)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-085 - mP/L-3-1: one of the points intersecting the start point of a line (float)" do
    a = "MULTIPOINT(50.0 120.0,90.0 80.0,130.0 40.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-086 - mP/L-3-2: one of the points intersecting the end point of a line" do
    a = "MULTIPOINT (300 280, 340 240, 380 200)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-086 - mP/L-3-2: one of the points intersecting the end point of a line (float)" do
    a = "MULTIPOINT(300.0 280.0,340.0 240.0,380.0 200.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-087 - mP/L-4-1: one of the points intersecting the interior of a line at a non-vertex (points on one side of the line)" do
    a = "MULTIPOINT (230 150, 260 120, 290 90)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-087 - mP/L-4-1: one of the points intersecting the interior of a line at a non-vertex (points on one side of the line) (float)" do
    a = "MULTIPOINT(230.0 150.0,260.0 120.0,290.0 90.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-088 - mP/L-4-2: one of the points intersecting the interior of a line at a non-vertex (points over the line)" do
    a = "MULTIPOINT (200 190, 240 150, 270 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-088 - mP/L-4-2: one of the points intersecting the interior of a line at a non-vertex (points over the line) (float)" do
    a = "MULTIPOINT(200.0 190.0,240.0 150.0,270.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-089 - mP/L-4-3: one of the points intersecting the interior of a line at a vertex (points on one side of the line)" do
    a = "MULTIPOINT (160 150, 190 120, 220 90)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-089 - mP/L-4-3: one of the points intersecting the interior of a line at a vertex (points on one side of the line) (float)" do
    a = "MULTIPOINT(160.0 150.0,190.0 120.0,220.0 90.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-090 - mP/L-4-4: one of the points intersecting the interior of a line at a vertex (points over the line)" do
    a = "MULTIPOINT (120 190, 160 150, 200 110)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-090 - mP/L-4-4: one of the points intersecting the interior of a line at a vertex (points over the line) (float)" do
    a = "MULTIPOINT(120.0 190.0,160.0 150.0,200.0 110.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-091 - mP/L-5-1: all the points on a line" do
    a = "MULTIPOINT (90 80, 160 150, 340 240)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-091 - mP/L-5-1: all the points on a line (float)" do
    a = "MULTIPOINT(90.0 80.0,160.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-092 - mP/L-5-2: all the points on a line" do
    a = "MULTIPOINT (90 80, 160 150, 300 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-092 - mP/L-5-2: all the points on a line (float)" do
    a = "MULTIPOINT(90.0 80.0,160.0 150.0,300.0 150.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-093 - mP/L-5-3: all the points on a line" do
    a = "MULTIPOINT (90 80, 160 150, 240 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-093 - mP/L-5-3: all the points on a line (float)" do
    a = "MULTIPOINT(90.0 80.0,160.0 150.0,240.0 150.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-094 - mP/L-5-4: all the points on a line" do
    a = "MULTIPOINT (90 80, 130 120, 210 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-094 - mP/L-5-4: all the points on a line (float)" do
    a = "MULTIPOINT(90.0 80.0,130.0 120.0,210.0 150.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-095 - mP/L-5-5: all the points on a line" do
    a = "MULTIPOINT (130 120, 210 150, 340 200)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-095 - mP/L-5-5: all the points on a line (float)" do
    a = "MULTIPOINT(130.0 120.0,210.0 150.0,340.0 200.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-096 - mP/L-5-6: all the points on a line" do
    a = "MULTIPOINT (160 150, 240 150, 340 210)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-096 - mP/L-5-6: all the points on a line (float)" do
    a = "MULTIPOINT(160.0 150.0,240.0 150.0,340.0 210.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-097 - mP/L-5-7: all the points on a line" do
    a = "MULTIPOINT (160 150, 300 150, 340 150)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-097 - mP/L-5-7: all the points on a line (float)" do
    a = "MULTIPOINT(160.0 150.0,300.0 150.0,340.0 150.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

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
  test "02-098 - mP/L-5-8: all the points on a line" do
    a = "MULTIPOINT (160 150, 240 150, 340 240)" |> Geo.WKT.decode!()
    b = "LINESTRING (90 80, 160 150, 300 150, 340 150, 340 240)" |> Geo.WKT.decode!()

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
  test "02-098 - mP/L-5-8: all the points on a line (float)" do
    a = "MULTIPOINT(160.0 150.0,240.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

    b =
      "LINESTRING(90.0 80.0,160.0 150.0,300.0 150.0,340.0 150.0,340.0 240.0)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end
end
