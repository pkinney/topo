defmodule Intersect.Validation.PolygonPolygonATest do
  use ExUnit.Case

  @tag :validation
  test "07-001 - A/A-1-1: same polygons" do
    a = "POLYGON ((20 20, 20 100, 120 100, 140 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 20 100, 120 100, 140 20, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === true
    assert Topo.equals?(b, a) === true
  end

  @tag :validation
  test "07-002 - A/A-1-2: same polygons with reverse sequence of points" do
    a = "POLYGON ((20 20, 20 100, 120 100, 140 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 140 20, 120 100, 20 100, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === true
    assert Topo.equals?(b, a) === true
  end

  @tag :validation
  test "07-003 - A/A-1-3: same polygons with different sequence of points" do
    a = "POLYGON ((20 20, 20 100, 120 100, 140 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((120 100, 140 20, 20 20, 20 100, 120 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === true
    assert Topo.equals?(b, a) === true
  end

  @tag :validation
  test "07-004 - A/A-1-4: same polygons with different number of points" do
    a = "POLYGON ((20 20, 20 100, 120 100, 140 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 100, 60 100, 120 100, 140 20, 80 20, 20 20, 20 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === true
    assert Topo.equals?(b, a) === true
  end

  @tag :validation
  test "07-005 - A/A-2: different polygons" do
    a = "POLYGON ((0 0, 80 0, 80 80, 0 80, 0 0))" |> Geo.WKT.decode
    b = "POLYGON ((100 200, 100 140, 180 140, 180 200, 100 200))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === false
    assert Topo.intersects?(b, a) === false
    assert Topo.disjoint?(a, b) === true
    assert Topo.disjoint?(b, a) === true
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-006 - A/A-3-1-1: the closing point of a polygon touching the closing point of another polygon" do
    a = "POLYGON ((140 120, 160 20, 20 20, 20 120, 140 120))" |> Geo.WKT.decode
    b = "POLYGON ((140 120, 140 200, 240 200, 240 120, 140 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-007 - A/A-3-1-2: the closing point of a polygon touching the boundary (at a non-vertex) of another polygon" do
    a = "POLYGON ((140 120, 160 20, 20 20, 20 120, 140 120))" |> Geo.WKT.decode
    b = "POLYGON ((80 180, 140 260, 260 200, 200 60, 80 180))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-008 - A/A-3-1-3: the closing point of a polygon touching the boundary (at a vertex) of another polygon" do
    a = "POLYGON ((140 120, 160 20, 20 20, 20 120, 140 120))" |> Geo.WKT.decode
    b = "POLYGON ((240 80, 140 120, 180 240, 280 200, 240 80))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-009 - A/A-3-1-4: the boundary (at a non-vertex) of a polygon touching the closing point of another polygon" do
    a = "POLYGON ((140 160, 20 20, 270 20, 150 160, 230 40, 60 40, 140 160))" |> Geo.WKT.decode
    b = "POLYGON ((140 40, 180 80, 120 100, 140 40))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-010 - A/A-3-1-5: the boundary (at a non-vertex) of a polygon touching the boundary (at a vertex) of another polygon" do
    a = "POLYGON ((140 160, 20 20, 270 20, 150 160, 230 40, 60 40, 140 160))" |> Geo.WKT.decode
    b = "POLYGON ((120 100, 180 80, 130 40, 120 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-011 - A/A-3-1-6: the boundary (at a vertex) of a polygon touching the boundary (at a non-vertex) of another polygon" do
    a = "POLYGON ((20 20, 180 20, 140 140, 20 140, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((180 100, 80 200, 180 280, 260 200, 180 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-012 - A/A-3-1-7: the boundary (at a vertex) of a polygon touching the boundary (at a vertex) of another polygon" do
    a = "POLYGON ((140 120, 160 20, 20 20, 20 120, 140 120))" |> Geo.WKT.decode
    b = "POLYGON ((140 140, 20 120, 0 220, 120 240, 140 140))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-013 - A/A-3-1-8: the closing point of a polygon touching the boundary of another polygon where the closing point touching the boundary at a vertex" do
    a = "POLYGON ((160 200, 210 70, 120 70, 160 200))" |> Geo.WKT.decode
    b = "POLYGON ((160 200, 260 40, 70 40, 160 200, 20 20, 310 20, 160 200))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-014 - A/A-3-1-9: the closing point of a polygon touching the boundary of another polygon where the closing point intersecting the boundary at a non-vertex" do
    a = "POLYGON ((110 140, 200 70, 200 160, 110 140))" |> Geo.WKT.decode
    b = "POLYGON ((110 140, 110 50, 60 50, 60 90, 160 190, 20 110, 20 20, 200 20, 110 140))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-015 - A/A-3-2-1: two polygons touching at multiple points" do
    a = "POLYGON ((20 120, 20 20, 260 20, 260 120, 200 40, 140 120, 80 40, 20 120))" |> Geo.WKT.decode
    b = "POLYGON ((20 120, 20 240, 260 240, 260 120, 200 200, 140 120, 80 200, 20 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-016 - A/A-3-2-2: two polygons touching at multiple points" do
    a = "POLYGON ((20 120, 20 20, 260 20, 260 120, 180 40, 140 120, 100 40, 20 120))" |> Geo.WKT.decode
    b = "POLYGON ((20 120, 300 120, 140 240, 20 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-017 - A/A-3-2-3: two polygons touching at multiple points" do
    a = "POLYGON ((20 20, 20 300, 280 300, 280 260, 220 260, 60 100, 60 60, 280 60, 280 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((100 140, 160 80, 280 180, 200 240, 220 160, 160 200, 180 120, 100 140))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-018 - A/A-3-2-4: two polygons touching at multiple points" do
    a = "POLYGON ((20 20, 20 300, 280 300, 280 260, 220 260, 60 100, 60 60, 280 60, 280 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((260 200, 180 80, 120 160, 200 160, 180 220, 260 200))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-019 - A/A-3-2-5: two polygons touching at multiple points" do
    a = "POLYGON ((20 20, 280 20, 280 140, 220 60, 140 140, 80 60, 20 140, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((0 140, 300 140, 140 240, 0 140))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-020 - A/A-3-2-6: two polygons touching at multiple points" do
    a = "POLYGON ((20 20, 280 20, 280 140, 220 60, 140 140, 80 60, 20 140, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 240, 20 140, 320 140, 180 240, 20 240))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-021 - A/A-3-2-7: two polygons touching at multiple points" do
    a = "POLYGON ((20 20, 280 20, 280 140, 220 60, 140 140, 80 60, 20 140, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 240, 20 140, 80 180, 140 140, 220 180, 280 140, 280 240, 20 240))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-022 - A/A-3-3-1: two polygons touching along a boundary" do
    a = "POLYGON ((120 120, 180 60, 20 20, 20 120, 120 120))" |> Geo.WKT.decode
    b = "POLYGON ((120 120, 220 20, 280 20, 240 160, 120 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-023 - A/A-3-3-2: two polygons touching along a boundary" do
    a = "POLYGON ((140 120, 160 20, 20 20, 20 120, 140 120))" |> Geo.WKT.decode
    b = "POLYGON ((140 120, 160 20, 260 120, 220 200, 140 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-024 - A/A-3-3-3: two polygons touching along a boundary" do
    a = "POLYGON ((20 140, 120 40, 20 40, 20 140))" |> Geo.WKT.decode
    b = "POLYGON ((190 140, 190 20, 140 20, 20 140, 190 140))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-025 - A/A-3-3-4: two polygons touching along a boundary" do
    a = "POLYGON ((120 120, 180 60, 20 20, 20 120, 120 120))" |> Geo.WKT.decode
    b = "POLYGON ((300 20, 220 20, 120 120, 260 160, 300 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-026 - A/A-3-3-5: two polygons touching along a boundary" do
    a = "POLYGON ((140 120, 160 20, 20 20, 20 120, 140 120))" |> Geo.WKT.decode
    b = "POLYGON ((140 120, 240 160, 280 60, 160 20, 140 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-027 - A/A-3-3-6: two polygons touching along a boundary" do
    a = "POLYGON ((120 120, 180 60, 20 20, 20 120, 120 120))" |> Geo.WKT.decode
    b = "POLYGON ((280 60, 180 60, 120 120, 260 180, 280 60))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-028 - A/A-3-3-7: two polygons touching along a boundary" do
    a = "POLYGON ((140 120, 160 20, 20 20, 20 120, 140 120))" |> Geo.WKT.decode
    b = "POLYGON ((120 200, 120 120, 40 120, 40 200, 120 200))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-029 - A/A-3-3-8: two polygons touching along a boundary" do
    a = "POLYGON ((140 120, 160 20, 20 20, 20 120, 140 120))" |> Geo.WKT.decode
    b = "POLYGON ((160 220, 140 120, 60 120, 40 220, 160 220))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-030 - A/A-3-3-9: two polygons touching along a boundary" do
    a = "POLYGON ((140 120, 160 20, 20 20, 20 120, 140 120))" |> Geo.WKT.decode
    b = "POLYGON ((140 120, 20 120, 20 220, 140 220, 140 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-031 - A/A-3-3-10: two polygons touching along a boundary" do
    a = "POLYGON ((120 120, 180 60, 20 20, 20 120, 120 120))" |> Geo.WKT.decode
    b = "POLYGON ((320 20, 220 20, 80 160, 240 140, 320 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-032 - A/A-5-1: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((60 40, 60 140, 180 140, 180 40, 60 40))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-033 - A/A-5-2-1: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 80 140, 160 60, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-034 - A/A-5-2-2: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((160 60, 20 20, 100 140, 160 60))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-035 - A/A-5-2-3: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 100, 140 160, 160 40, 20 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-036 - A/A-5-2-4: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((160 40, 20 100, 160 160, 160 40))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-037 - A/A-5-2-5: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 180, 180 120, 80 40, 20 180))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-038 - A/A-5-2-6: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((180 120, 100 40, 20 180, 180 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-039 - A/A-5-3-1: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 140 40, 140 120, 20 160, 80 80, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-040 - A/A-5-3-2: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 140 40, 140 140, 20 180, 80 100, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-041 - A/A-5-3-3: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((40 180, 60 100, 180 100, 200 180, 120 120, 40 180))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-042 - A/A-5-3-4: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 180, 60 80, 180 80, 220 180, 120 120, 20 180))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-043 - A/A-5-3-5: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((40 60, 20 180, 100 100, 140 180, 160 120, 220 100, 140 40, 40 60))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-044 - A/A-5-3-6: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((60 100, 180 100, 220 180, 120 140, 20 180, 60 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-045 - A/A-5-4-1: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 20 140, 120 120, 120 40, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-046 - A/A-5-4-2: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 20 180, 140 140, 140 60, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-047 - A/A-5-4-3: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 120 40, 120 120, 20 140, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-048 - A/A-5-4-4: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((120 40, 20 20, 20 140, 120 120, 120 40))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-049 - A/A-5-4-5: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 140 60, 140 140, 20 180, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-050 - A/A-5-4-6: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((140 60, 20 20, 20 180, 140 140, 140 60))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-051 - A/A-5-4-7: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 60 120, 140 120, 180 20, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-052 - A/A-5-4-8: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 40, 120 40, 120 120, 20 140, 20 40))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-053 - A/A-5-5-1: a polygon containing another polygon" do
    a = "POLYGON ((20 20, 20 180, 220 180, 220 20, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((20 20, 20 180, 60 120, 100 180, 140 120, 220 180, 200 120, 140 60, 20 20))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-054 - A/A-6-1: a polygon overlapping another polygon" do
    a = "POLYGON ((150 150, 330 150, 250 70, 70 70, 150 150))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 270 150, 140 20, 20 20, 150 150))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-055 - A/A-6-2: a polygon overlapping another polygon" do
    a = "POLYGON ((150 150, 270 150, 330 150, 250 70, 190 70, 70 70, 150 150))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 270 150, 190 70, 140 20, 20 20, 70 70, 150 150))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-056 - A/A-6-3: spiky polygons overlapping; boundary &lt;-&gt; boundary intersecting at 0 dimension" do
    a = "POLYGON ((20 20, 60 50, 20 40, 60 70, 20 60, 60 90, 20 90, 70 110, 20 130, 80 130, 20 150, 80 160, 20 170, 80 180, 20 200, 80 200, 30 240, 80 220, 50 260, 100 220, 100 260, 120 220, 130 260, 140 220, 150 280, 150 190, 160 280, 170 190, 180 280, 190 190, 200 280, 210 190, 220 280, 230 190, 240 260, 250 230, 260 260, 260 220, 290 270, 290 220, 330 260, 300 210, 340 240, 290 180, 340 210, 290 170, 350 170, 240 150, 350 150, 240 140, 350 130, 240 120, 350 120, 240 110, 350 110, 240 100, 350 100, 240 90, 350 90, 240 80, 350 80, 300 70, 340 60, 290 60, 340 40, 300 50, 340 20, 270 60, 310 20, 250 60, 270 20, 230 60, 240 20, 210 60, 210 20, 190 70, 190 20, 180 90, 170 20, 160 90, 150 20, 140 90, 130 20, 120 90, 110 20, 100 90, 100 20, 90 60, 80 20, 70 40, 20 20))" |> Geo.WKT.decode
    b = "POLYGON ((190 140, 140 130, 200 160, 130 150, 210 170, 130 170, 210 180, 120 190, 220 200, 120 200, 250 210, 120 210, 250 220, 120 220, 250 230, 120 240, 230 240, 120 250, 240 260, 120 260, 240 270, 120 270, 270 290, 120 290, 230 300, 150 310, 250 310, 180 320, 250 320, 200 360, 260 330, 240 360, 280 320, 290 370, 290 320, 320 360, 310 320, 360 360, 310 310, 380 340, 310 290, 390 330, 310 280, 410 310, 310 270, 420 280, 310 260, 430 250, 300 250, 440 240, 300 240, 450 230, 280 220, 440 220, 280 210, 440 210, 300 200, 430 190, 300 190, 440 180, 330 180, 430 150, 320 180, 420 130, 300 180, 410 120, 280 180, 400 110, 280 170, 390 90, 280 160, 400 70, 270 160, 450 30, 260 160, 420 30, 250 160, 390 30, 240 160, 370 30, 230 160, 360 30, 230 150, 330 50, 240 130, 330 30, 230 130, 310 30, 220 130, 280 30, 230 100, 270 40, 220 110, 250 30, 210 130, 240 30, 210 100, 220 40, 200 90, 200 20, 190 100, 180 30, 20 20, 180 40, 20 30, 180 50, 20 50, 180 60, 30 60, 180 70, 20 70, 170 80, 80 80, 170 90, 20 80, 180 100, 40 100, 200 110, 60 110, 200 120, 120 120, 190 140))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-057 - A/A-6-4: spiky polygons overlapping; boundary &lt;-&gt; boundary intersecting at 1 dimension at a few locations" do
    a = "POLYGON ((70 150, 20 160, 110 160, 20 180, 100 200, 20 200, 190 210, 20 210, 160 220, 20 220, 150 230, 60 240, 180 250, 20 260, 170 260, 60 270, 160 270, 100 310, 170 280, 200 260, 180 230, 210 260, 130 330, 230 250, 210 290, 240 250, 230 210, 260 300, 250 230, 270 300, 270 240, 300 340, 280 250, 320 330, 290 250, 340 350, 290 240, 350 360, 270 190, 350 340, 290 200, 350 330, 300 190, 360 320, 310 190, 360 300, 320 200, 360 280, 330 200, 360 260, 340 200, 370 260, 340 180, 390 290, 340 170, 400 260, 350 170, 400 250, 350 160, 410 240, 350 150, 400 170, 350 140, 310 170, 340 140, 270 180, 330 140, 260 170, 310 140, 240 170, 290 140, 200 190, 270 140, 180 190, 260 140, 170 190, 260 130, 170 180, 250 130, 170 170, 240 120, 170 160, 210 120, 170 150, 210 110, 340 130, 230 110, 420 140, 220 100, 410 130, 220 90, 400 120, 220 80, 390 110, 220 70, 420 110, 240 70, 420 100, 260 70, 420 90, 280 70, 430 80, 230 60, 430 60, 270 50, 450 40, 210 50, 370 40, 260 40, 460 30, 160 40, 210 60, 200 110, 190 60, 190 120, 170 50, 180 130, 150 30, 170 130, 140 20, 160 120, 130 20, 160 150, 120 20, 160 170, 110 20, 160 190, 100 20, 150 190, 90 20, 140 180, 80 20, 120 140, 70 20, 120 150, 60 20, 110 150, 50 20, 100 140, 50 30, 90 130, 40 30, 80 120, 30 30, 80 130, 30 40, 80 140, 20 40, 70 140, 40 90, 60 130, 20 90, 60 140, 20 130, 70 150))" |> Geo.WKT.decode
    b = "POLYGON ((190 140, 140 130, 200 160, 130 150, 210 170, 130 170, 210 180, 120 190, 220 200, 120 200, 250 210, 120 210, 250 220, 120 220, 250 230, 120 240, 230 240, 120 250, 240 260, 120 260, 240 270, 120 270, 270 290, 120 290, 230 300, 150 310, 250 310, 180 320, 250 320, 200 360, 260 330, 240 360, 280 320, 290 370, 290 320, 320 360, 310 320, 360 360, 310 310, 380 340, 310 290, 390 330, 310 280, 410 310, 310 270, 420 280, 310 260, 430 250, 300 250, 440 240, 300 240, 450 230, 280 220, 440 220, 280 210, 440 210, 300 200, 430 190, 300 190, 440 180, 330 180, 430 150, 320 180, 420 130, 300 180, 410 120, 280 180, 400 110, 280 170, 390 90, 280 160, 400 70, 270 160, 450 30, 260 160, 420 30, 250 160, 390 30, 240 160, 370 30, 230 160, 360 30, 230 150, 330 50, 240 130, 330 30, 230 130, 310 30, 220 130, 280 30, 230 100, 270 40, 220 110, 250 30, 210 130, 240 30, 210 100, 220 40, 200 90, 200 20, 190 100, 180 30, 20 20, 180 40, 20 30, 180 50, 20 50, 180 60, 30 60, 180 70, 20 70, 170 80, 80 80, 170 90, 20 80, 180 100, 40 100, 200 110, 60 110, 200 120, 120 120, 190 140))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-058 - A/A-6-5: a polygon overlapping another polygon" do
    a = "POLYGON ((60 160, 220 160, 220 20, 60 20, 60 160))" |> Geo.WKT.decode
    b = "POLYGON ((60 160, 20 200, 260 200, 220 160, 140 80, 60 160))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-059 - A/A-6-6: a polygon overlapping another polygon" do
    a = "POLYGON ((60 160, 220 160, 220 20, 60 20, 60 160))" |> Geo.WKT.decode
    b = "POLYGON ((60 160, 20 200, 260 200, 140 80, 60 160))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-060 - A/A-6-7: a polygon overlapping another polygon" do
    a = "POLYGON ((60 160, 220 160, 220 20, 60 20, 60 160))" |> Geo.WKT.decode
    b = "POLYGON ((20 200, 140 80, 260 200, 20 200))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-061 - A/A-6-8: a polygon overlapping another polygon" do
    a = "POLYGON ((60 160, 220 160, 220 20, 60 20, 60 160))" |> Geo.WKT.decode
    b = "POLYGON ((20 200, 60 160, 140 80, 220 160, 260 200, 20 200))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-062 - A/A-6-9: a polygon overlapping another polygon" do
    a = "POLYGON ((60 160, 220 160, 220 20, 60 20, 60 160))" |> Geo.WKT.decode
    b = "POLYGON ((20 200, 60 160, 140 80, 260 200, 20 200))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-063 - A/A-6-10: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((0 0, 0 200, 200 200, 200 0, 0 0))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 1000000 110, 10000000 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-064 - A/A-6-11: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((100 0, 100 200, 200 200, 200 0, 100 0))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 1000000 110, 10000000 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-065 - A/A-6-12: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((120 0, 120 200, 200 200, 200 0, 120 0))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 1000000 110, 10000000 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-066 - A/A-6-13: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((0 0, 0 200, 110 200, 110 0, 0 0))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 1000000 110, 10000000 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-067 - A/A-6-14: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((100 100, 100 200, 200 200, 200 100, 100 100))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 2100 110, 2100 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-068 - A/A-6-15: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((100 100, 100 200, 200 200, 200 100, 100 100))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 2101 110, 2101 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-069 - A/A-6-16: two skinny polygons overlapping" do
    a = "POLYGON ((100 100, 200 200, 200 100, 100 100))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 2101 110, 2101 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-070 - A/A-6-17: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((100 100, 100 200, 200 200, 200 100, 100 100))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 1000000 110, 1000000 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-071 - A/A-6-19: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((120 100, 120 200, 200 200, 200 100, 120 100))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 500 110, 500 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-072 - A/A-6-20: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((120 100, 120 200, 200 200, 200 100, 120 100))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 501 110, 501 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-073 - A/A-6-21: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((120 100, 130 200, 200 200, 200 100, 120 100))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 501 110, 501 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-074 - A/A-6-22: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((120 100, 17 200, 200 200, 200 100, 120 100))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 501 110, 501 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-075 - A/A-6-23: a polygon overlapping a skinny polygon" do
    a = "POLYGON ((120 100, 120 200, 200 200, 200 100, 120 100))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 1000000 110, 1000000 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-076 - A/A-6-25: two skinny polygons overlapping" do
    a = "POLYGON ((101 99, 101 1000000, 102 1000000, 101 99))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 1000000 110, 1000000 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-077 - A/A-6-26: two skinny polygons overlapping" do
    a = "POLYGON ((100 100, 200 101, 200 100, 100 100))" |> Geo.WKT.decode
    b = "POLYGON ((100 100, 2101 110, 2101 100, 100 100))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-078 - A/A-6-26: two polygons overlapping" do
    a = "POLYGON ((16 319, 150 39, 25 302, 160 20, 265 20, 127 317, 16 319))" |> Geo.WKT.decode
    b = "POLYGON ((10 307, 22 307, 153 34, 22 34, 10 307))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-079 - A/Ah-3-1: the closing point of a polygon touching the closing points of another polygon and its hole" do
    a = "POLYGON ((160 200, 210 70, 120 70, 160 200))" |> Geo.WKT.decode
    b = "POLYGON ((160 200, 310 20, 20 20, 160 200),(160 200, 260 40, 70 40, 160 200))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-080 - A/Ah-3-2: the boundary of a polygon touching the inner boundary of another polygon at two spots" do
    a = "POLYGON ((170 120, 240 100, 260 50, 190 70, 170 120))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-081 - A/Ah-3-3: the boundary of a polygon touching the inner boundary of another polygon at two spots" do
    a = "POLYGON ((270 90, 200 50, 150 80, 210 120, 270 90))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-082 - A/Ah-3-4: the boundary of a polygon touching the inner boundary of another polygon at one spot" do
    a = "POLYGON ((170 120, 260 100, 240 60, 150 80, 170 120))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-083 - A/Ah-3-5: the boundary of a polygon touching the inner boundary of another polygon at one spot" do
    a = "POLYGON ((220 120, 270 80, 200 60, 160 100, 220 120))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-084 - A/Ah-3-6: the boundary of a polygon touching the inner boundary of another polygon at one spot" do
    a = "POLYGON ((260 50, 180 70, 180 110, 260 90, 260 50))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-085 - A/Ah-3-7: the boundary of a polygon touching the inner boundary of another polygon at two spots" do
    a = "POLYGON ((230 110, 290 80, 190 60, 140 90, 230 110))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-086 - A/Ah-3-8: the boundary of a polygon touching the inner boundary of another polygon" do
    a = "POLYGON ((170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-087 - A/Ah-3-9: part of the boundary of a polygon touching part of the inner boundary of another polygon" do
    a = "POLYGON ((170 120, 330 120, 280 70, 120 70, 170 120))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-088 - A/Ah-3-10: part of the boundary of a polygon touching part of the inner boundary of another polygon" do
    a = "POLYGON ((170 120, 300 120, 250 70, 120 70, 170 120))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-089 - A/Ah-3-11: part of the boundary of a polygon touching part of the inner boundary of another polygon" do
    a = "POLYGON ((190 100, 310 100, 260 50, 140 50, 190 100))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 330 120, 260 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-090 - A/Ah-5-1: an entire polygon within another polygon which has a hole" do
    a = "POLYGON ((280 130, 360 130, 270 40, 190 40, 280 130))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 250 120, 180 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-091 - A/Ah-5-2: an entire polygon within another polygon which has a hole" do
    a = "POLYGON ((220 80, 180 40, 80 40, 170 130, 270 130, 230 90, 300 90, 250 30, 280 30, 390 140, 150 140, 40 30, 230 30, 280 80, 220 80))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 250 120, 180 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-092 - A/Ah-5-3: polygon A within polygon B, the boundary of A touching the inner boundary of B" do
    a = "POLYGON ((260 130, 360 130, 280 40, 170 40, 260 130))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 250 120, 180 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-093 - A/Ah-5-4: polygon A within polygon B, the boundary of A touching the inner boundary of B" do
    a = "POLYGON ((240 110, 340 110, 290 60, 190 60, 240 110))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 250 120, 180 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-094 - A/Ah-5-5: polygon A within polygon B, the boundary of A touching the inner boundary of B" do
    a = "POLYGON ((250 120, 350 120, 280 50, 180 50, 250 120))" |> Geo.WKT.decode
    b = "POLYGON ((150 150, 410 150, 280 20, 20 20, 150 150),(170 120, 250 120, 180 50, 100 50, 170 120))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-095 - Ah/Ah-1-1: same polygons (with a hole)" do
    a = "POLYGON ((230 210, 230 20, 20 20, 20 210, 230 210),(120 180, 50 50, 200 50, 120 180))" |> Geo.WKT.decode
    b = "POLYGON ((230 210, 230 20, 20 20, 20 210, 230 210),(120 180, 50 50, 200 50, 120 180))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === true
    assert Topo.equals?(b, a) === true
  end

  @tag :validation
  test "07-096 - A2h/A2h-1-1: same polygons (with two holes)" do
    a = "POLYGON ((230 210, 230 20, 20 20, 20 210, 230 210),(140 40, 40 40, 40 170, 140 40),(110 190, 210 190, 210 50, 110 190))" |> Geo.WKT.decode
    b = "POLYGON ((230 210, 230 20, 20 20, 20 210, 230 210),(140 40, 40 40, 40 170, 140 40),(110 190, 210 190, 210 50, 110 190))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === true
    assert Topo.within?(a, b) === true
    assert Topo.equals?(a, b) === true
    assert Topo.equals?(b, a) === true
  end

  @tag :validation
  test "07-097 - A/mA-3-1: a polygon touching multipolygon at two points" do
    a = "POLYGON ((280 190, 330 150, 200 110, 150 150, 280 190))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((140 110, 260 110, 170 20, 50 20, 140 110)),((300 270, 420 270, 340 190, 220 190, 300 270)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-098 - A/mA-3-2: a polygon touching multipolygon at two points" do
    a = "POLYGON ((80 190, 220 190, 140 110, 0 110, 80 190))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((140 110, 260 110, 170 20, 50 20, 140 110)),((300 270, 420 270, 340 190, 220 190, 300 270)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-099 - A/mA-3-3: a polygon touching multipolygon at two points" do
    a = "POLYGON ((330 150, 200 110, 150 150, 280 190, 330 150))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((140 110, 260 110, 170 20, 50 20, 140 110)),((300 270, 420 270, 340 190, 220 190, 300 270)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-100 - A/mA-3-4: a polygon touching multipolygon at one spoint" do
    a = "POLYGON ((290 190, 340 150, 220 120, 170 170, 290 190))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((140 110, 260 110, 170 20, 50 20, 140 110)),((300 270, 420 270, 340 190, 220 190, 300 270)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-101 - A/mA-3-5: a polygon touching multipolygon along boundaries" do
    a = "POLYGON ((220 190, 340 190, 260 110, 140 110, 220 190))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((140 110, 260 110, 170 20, 50 20, 140 110)),((300 270, 420 270, 340 190, 220 190, 300 270)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-102 - A/mA-3-6: a polygon touching multipolygon along boundaries and at a point" do
    a = "POLYGON ((140 190, 220 190, 100 70, 20 70, 140 190))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((140 110, 260 110, 170 20, 50 20, 140 110)),((300 270, 420 270, 340 190, 220 190, 300 270)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-103 - A/mA-6-1: a polygon overlapping multipolygon" do
    a = "POLYGON ((140 220, 60 140, 140 60, 220 140, 140 220))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((100 20, 180 20, 180 100, 100 100, 100 20)),((20 100, 100 100, 100 180, 20 180, 20 100)),((100 180, 180 180, 180 260, 100 260, 100 180)),((180 100, 260 100, 260 180, 180 180, 180 100)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-104 - mA/mA-3-1: MultiPolygon touching MultiPolygon" do
    a = "MULTIPOLYGON (((110 110, 70 200, 150 200, 110 110)),((110 110, 150 20, 70 20, 110 110)))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((110 110, 160 160, 210 110, 160 60, 110 110)),((110 110, 60 60, 10 110, 60 160, 110 110)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-105 - mAh/mAh-3-1: MultiPolygon touching MultiPolygon" do
    a = "MULTIPOLYGON (((110 110, 70 200, 150 200, 110 110),(110 110, 100 180, 120 180, 110 110)),((110 110, 150 20, 70 20, 110 110),(110 110, 120 40, 100 40, 110 110)))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((110 110, 160 160, 210 110, 160 60, 110 110),(110 110, 160 130, 160 90, 110 110)),((110 110, 60 60, 10 110, 60 160, 110 110),(110 110, 60 90, 60 130, 110 110)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-106 - mAh/mAh-3-2: MultiPolygon touching MultiPolygon" do
    a = "MULTIPOLYGON (((110 110, 70 200, 200 200, 110 110),(110 110, 100 180, 120 180, 110 110)),((110 110, 200 20, 70 20, 110 110),(110 110, 120 40, 100 40, 110 110)))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((110 110, 160 160, 210 110, 160 60, 110 110),(110 110, 160 130, 160 90, 110 110)),((110 110, 60 60, 10 110, 60 160, 110 110),(110 110, 60 90, 60 130, 110 110)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-107 - mAh/mAh-3-3: MultiPolygon touching MultiPolygon" do
    a = "MULTIPOLYGON (((110 110, 20 200, 200 200, 110 110),(110 110, 100 180, 120 180, 110 110)),((110 110, 200 20, 20 20, 110 110),(110 110, 120 40, 100 40, 110 110)))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((110 110, 160 160, 210 110, 160 60, 110 110),(110 110, 160 130, 160 90, 110 110)),((110 110, 60 60, 10 110, 60 160, 110 110),(110 110, 60 90, 60 130, 110 110)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-108 - mAh/mAh-6-1: MultiPolygon touching MultiPolygon" do
    a = "MULTIPOLYGON (((110 110, 70 200, 200 200, 110 110),(110 110, 100 180, 120 180, 110 110)),((110 110, 200 20, 70 20, 110 110),(110 110, 120 40, 100 40, 110 110)))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((110 110, 160 160, 210 110, 160 60, 110 110),(110 110, 160 130, 160 90, 110 110)),((110 110, 60 60, 10 110, 60 160, 110 110),(110 110, 60 90, 60 130, 110 110)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end

  @tag :validation
  test "07-109 - mAh/mAh-6-2: MultiPolygon touching MultiPolygon" do
    a = "MULTIPOLYGON (((110 110, 70 200, 200 200, 110 110),(110 110, 100 180, 120 180, 110 110)),((110 110, 200 20, 70 20, 110 110),(110 110, 120 40, 100 40, 110 110)))" |> Geo.WKT.decode
    b = "MULTIPOLYGON (((110 110, 70 200, 210 110, 70 20, 110 110),(110 110, 110 140, 150 110, 110 80, 110 110)),((110 110, 60 60, 10 110, 60 160, 110 110),(110 110, 60 90, 60 130, 110 110)))" |> Geo.WKT.decode

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end
end
