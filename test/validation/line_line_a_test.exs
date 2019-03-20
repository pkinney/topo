defmodule Intersect.Validation.LineLineATest do
  use ExUnit.Case

  @tag :validation
  test "04-001 - L/L.1-3-1: touching at the start points of two lines" do
    a = "LINESTRING (40 40, 120 120)" |> Geo.WKT.decode!
    b = "LINESTRING (40 40, 60 120)" |> Geo.WKT.decode!

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
  test "04-002 - L/L.1-3-2: start point of one line touching end point of another line" do
    a = "LINESTRING (40 40, 120 120)" |> Geo.WKT.decode!
    b = "LINESTRING (60 240, 40 40)" |> Geo.WKT.decode!

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
  test "04-003 - L/L.1-3-3: start point of a line touching the interior of another line at a non-vertex" do
    a = "LINESTRING (40 40, 180 180)" |> Geo.WKT.decode!
    b = "LINESTRING (120 120, 20 200)" |> Geo.WKT.decode!

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
  test "04-004 - L/L.1-3-4: touching at the end points of two lines" do
    a = "LINESTRING (40 40, 120 120)" |> Geo.WKT.decode!
    b = "LINESTRING (60 240, 120 120)" |> Geo.WKT.decode!

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
  test "04-005 - L/L.1-3-5: end point of a line touching the interior of another line at a non-vertex" do
    a = "LINESTRING (40 40, 180 180)" |> Geo.WKT.decode!
    b = "LINESTRING (20 180, 140 140)" |> Geo.WKT.decode!

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
  test "04-006 - L/L.1-4-1: two lines crossing at non-vertex" do
    a = "LINESTRING (40 40, 120 120)" |> Geo.WKT.decode!
    b = "LINESTRING (40 120, 120 40)" |> Geo.WKT.decode!

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
  test "04-007 - L/L.1-1-1: equal pointwise" do
    a = "LINESTRING (40 40, 100 100)" |> Geo.WKT.decode!
    b = "LINESTRING (40 40, 100 100)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-008 - L/L.1-1-2: equal lines but points in reverse sequence" do
    a = "LINESTRING (40 40, 100 100)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 40 40)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-009 - L/L.1-2-1: dim(1){A.L.Int.SP-EP = B.L.Ext}" do
    a = "LINESTRING (40 40, 120 120)" |> Geo.WKT.decode!
    b = "LINESTRING (40 120, 120 160)" |> Geo.WKT.decode!

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
  test "04-010 - L/L.1-5-1: line A containing line B" do
    a = "LINESTRING (20 20, 180 180)" |> Geo.WKT.decode!
    b = "LINESTRING (20 20, 180 180)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-011 - L/L.1-5-2: line B is part of line A" do
    a = "LINESTRING (20 20, 180 180)" |> Geo.WKT.decode!
    b = "LINESTRING (20 20, 110 110)" |> Geo.WKT.decode!

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
  test "04-012 - L/L.1-5-3: Line B is part of line A (in the middle portion)" do
    a = "LINESTRING (20 20, 180 180)" |> Geo.WKT.decode!
    b = "LINESTRING (50 50, 140 140)" |> Geo.WKT.decode!

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
  test "04-013 - L/L.1-6-1: start portions of two lines overlapping" do
    a = "LINESTRING (180 180, 40 40)" |> Geo.WKT.decode!
    b = "LINESTRING (120 120, 260 260)" |> Geo.WKT.decode!

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
  test "04-014 - L/L.1-6-2: end portions of two lines overlapping" do
    a = "LINESTRING (40 40, 180 180)" |> Geo.WKT.decode!
    b = "LINESTRING (260 260, 120 120)" |> Geo.WKT.decode!

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
  test "04-015 - L/L.1-6-3: end portion of line A overlapping the start portion of line B" do
    a = "LINESTRING (40 40, 180 180)" |> Geo.WKT.decode!
    b = "LINESTRING (120 120, 260 260)" |> Geo.WKT.decode!

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
  test "04-016 - L/L.2-3-1: two LineStrings touching at start points" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (40 40, 20 100, 40 160, 20 200)" |> Geo.WKT.decode!

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
  test "04-017 - L/L.2-3-2: start point of LineStrings A touching the end point of LineString B" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (20 200, 40 160, 20 100, 40 40)" |> Geo.WKT.decode!

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
  test "04-018 - L/L.2-3-3: two LineStrings touching at end points" do
    a = "LINESTRING (80 240, 200 120, 100 100, 40 40)" |> Geo.WKT.decode!
    b = "LINESTRING (20 200, 40 160, 20 100, 40 40)" |> Geo.WKT.decode!

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
  test "04-019 - L/L.2-3-4: both the start and end points of LineString A touching the interior of LineString B at two vertices" do
    a = "LINESTRING (60 60, 60 230, 140 230, 250 160)" |> Geo.WKT.decode!
    b = "LINESTRING (20 20, 60 60, 250 160, 310 230)" |> Geo.WKT.decode!

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
  test "04-020 - L/L.2-3-5: both the start and end points of LineString A touching the interior of LineString B at two non-vertices" do
    a = "LINESTRING (60 60, 60 230, 140 230, 250 160)" |> Geo.WKT.decode!
    b = "LINESTRING (20 20, 110 110, 200 110, 320 230)" |> Geo.WKT.decode!

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
  test "04-021 - L/L.2-3-6: the start and end points of two LineStrings touching each other" do
    a = "LINESTRING (60 110, 60 250, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-022 - L/L.2-3-7: the start and end points of two LineStrings touching each other" do
    a = "LINESTRING (60 110, 60 250, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (360 210, 310 160, 110 160, 60 110)" |> Geo.WKT.decode!

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
  test "04-023 - L/L.2-3-8: start point of LineString B touching LineString A at a non-vertex" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (160 160, 240 240)" |> Geo.WKT.decode!

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
  test "04-024 - L/L.2-3-9: end point of LineString B touching LineString A at a non-vertex" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (240 240, 160 160)" |> Geo.WKT.decode!

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
  test "04-025 - L/L.2-3-10: both the start and end points of LineString B touching the interior of LineString A at two non-vertices" do
    a = "LINESTRING (60 60, 60 230, 140 230, 250 160)" |> Geo.WKT.decode!
    b = "LINESTRING (60 150, 110 100, 170 100, 110 230)" |> Geo.WKT.decode!

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
  test "04-026 - L/L.2-3-11: the start point of LineString B touching the interior of LineString A at a non-vertex and the end point of LineString A touching the interior of LineString B at a vertex" do
    a = "LINESTRING (60 60, 60 230, 140 230, 250 160)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-027 - L/L.2-3-12: start point of LineString B touching LineString A at a vertex" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (200 120, 200 190, 150 240, 200 240)" |> Geo.WKT.decode!

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
  test "04-028 - L/L.2-3-13: end point of LineString B touching LineString A at a vertex" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (200 240, 150 240, 200 200, 200 120)" |> Geo.WKT.decode!

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
  test "04-029 - L/L.2-3-14: both the start and end points of LineString B touching the interior of LineString A at two vertices" do
    a = "LINESTRING (60 60, 60 230, 140 230, 250 160)" |> Geo.WKT.decode!
    b = "LINESTRING (60 230, 80 140, 120 140, 140 230)" |> Geo.WKT.decode!

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
  test "04-030 - L/L.2-4-1: two LineStrings crossing at two points" do
    a = "LINESTRING (60 110, 200 110, 250 160, 300 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-031 - L/L.2-4-2: two LineStrings crossing at two points" do
    a = "LINESTRING (60 110, 200 110, 250 160, 300 210, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-032 - L/L.2-4-3: two LineStrings crossing on one side" do
    a = "LINESTRING (60 110, 220 110, 250 160, 280 110)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-033 - L/L.2-4-4: two LineStrings crossing on one side" do
    a = "LINESTRING (60 110, 150 110, 200 160, 250 110, 360 110, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-034 - L/L.2-4-5: two LineStrings crossing at two points" do
    a = "LINESTRING (130 160, 160 110, 220 110, 250 160, 250 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-035 - L/L.2-4-6: two LineStrings crossing at two points" do
    a = "LINESTRING (130 160, 160 110, 190 110, 230 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-036 - L/L.2-4-7: two LineStrings crossing at two points" do
    a = "LINESTRING (130 160, 160 110, 200 110, 230 160, 260 210, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-037 - L/L.2-4-8: two LineStrings crossing at two points" do
    a = "LINESTRING (130 160, 160 110, 200 110, 230 160, 260 210, 360 210, 380 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-038 - L/L.2-4-9: two LineStrings crossing at three points" do
    a = "LINESTRING (130 160, 160 110, 200 110, 230 160, 260 210, 380 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-039 - L/L.2-4-10: two LineStrings crossing at two points" do
    a = "LINESTRING (110 160, 160 110, 200 110, 250 160, 250 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-040 - L/L.2-4-11: two LineStrings crossing on one side" do
    a = "LINESTRING (110 160, 180 110, 250 160, 320 110)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-041 - L/L.2-4-12: two LineStrings crossing on one side" do
    a = "LINESTRING (140 160, 180 80, 220 160, 250 80)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-042 - L/L.2-4-13: two LineStrings crossing at a vertex for one of the LineStrings" do
    a = "LINESTRING (40 40, 100 100, 200 120, 130 190)" |> Geo.WKT.decode!
    b = "LINESTRING (20 130, 70 130, 160 40)" |> Geo.WKT.decode!

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
  test "04-043 - L/L.2-4-14: two LineStrings crossing at non-vertices for both of the LineStrings" do
    a = "LINESTRING (40 40, 100 100, 200 120, 130 190)" |> Geo.WKT.decode!
    b = "LINESTRING (40 160, 40 100, 110 40, 170 40)" |> Geo.WKT.decode!

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
  test "04-044 - L/L.2-4-15: two LineStrings crossing on one side" do
    a = "LINESTRING (130 110, 180 160, 230 110, 280 160, 330 110)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-045 - L/L.2-4-16: two LineStrings crossing at vertices for both LineString" do
    a = "LINESTRING (40 40, 100 100, 200 120, 130 190)" |> Geo.WKT.decode!
    b = "LINESTRING (30 140, 80 140, 100 100, 200 30)" |> Geo.WKT.decode!

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
  test "04-046 - L/L.2-4-17: two LineStrings crossing on one side" do
    a = "LINESTRING (110 110, 110 160, 180 110, 250 160, 250 110)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

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
  test "04-047 - L/L.2-4-18: multiple crossings" do
    a = "LINESTRING (20 20, 80 80, 160 80, 240 80, 300 140)" |> Geo.WKT.decode!
    b = "LINESTRING (20 60, 60 60, 60 140, 80 80, 100 20, 140 140, 180 20, 200 80, 220 20, 240 80, 300 80, 270 110, 200 110)" |> Geo.WKT.decode!

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
  test "04-048 - L/L.2-4-19: spiky LineStrings with multiple crossing" do
    a = "LINESTRING (20 20, 230 20, 20 30, 170 30, 20 40, 230 40, 20 50, 230 60, 60 60, 230 70, 20 70, 180 80, 60 80, 230 90, 20 90, 230 100, 30 100, 210 110, 20 110, 80 120, 20 130, 170 130, 90 120, 230 130, 170 140, 230 140, 80 150, 160 140, 20 140, 70 150, 20 150, 230 160, 80 160, 230 170, 20 160, 180 170, 20 170, 230 180, 20 180, 40 190, 230 190, 20 200, 230 200)" |> Geo.WKT.decode!
    b = "LINESTRING (30 210, 30 60, 40 210, 40 30, 50 190, 50 20, 60 160, 60 50, 70 220, 70 50, 80 20, 80 210, 90 50, 90 150, 100 30, 100 210, 110 20, 110 190, 120 50, 120 180, 130 210, 120 20, 140 210, 130 50, 150 210, 130 20, 160 210, 140 30, 170 210, 150 20, 180 210, 160 20, 190 210, 180 80, 170 50, 170 20, 180 70, 180 20, 190 190, 190 30, 200 210, 200 30, 210 210, 210 20, 220 150, 220 20)" |> Geo.WKT.decode!

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
  test "04-049 - L/L.2-1-1: two equal LineStrings with equal pointwise" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-050 - L/L.2-1-2: two equal LineStrings with points in reverse sequence" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (80 240, 200 120, 100 100, 40 40)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-051 - L/L.2-1-3: two equal LineStrings with different number of points" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (80 240, 120 200, 200 120, 100 100, 80 80, 40 40)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-052 - L/L.2-2-1: disjoint" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (260 210, 240 130, 280 120, 260 40)" |> Geo.WKT.decode!

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
  test "04-053 - L/L.2-2-2: wrapping around but still disjoint" do
    a = "LINESTRING (100 20, 20 20, 20 160, 210 160, 210 20, 110 20, 50 120, 120 150, 200 150)" |> Geo.WKT.decode!
    b = "LINESTRING (140 130, 100 110, 120 60, 170 60)" |> Geo.WKT.decode!

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
  test "04-054 - L/L.2-5-1: LineString A containing LineString B, same pointwise" do
    a = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-055 - L/L.2-5-2: LineString A containing LineString B, LineString A with less points" do
    a = "LINESTRING (60 110, 110 160, 310 160, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-056 - L/L.2-5-3: LineString A containing LineString B" do
    a = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (60 110, 110 160, 250 160)" |> Geo.WKT.decode!

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
  test "04-057 - L/L.2-5-4: LineString A containing LineString B" do
    a = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (110 160, 310 160, 340 190)" |> Geo.WKT.decode!

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
  test "04-058 - L/L.2-5-5: LineString A containing LineString B" do
    a = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (140 160, 250 160, 310 160, 340 190)" |> Geo.WKT.decode!

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
  test "04-059 - L/L.2-5-6: LineString A containing LineString B" do
    a = "LINESTRING (60 110, 110 160, 250 160, 310 160, 360 210)" |> Geo.WKT.decode!
    b = "LINESTRING (110 160, 250 160, 310 160)" |> Geo.WKT.decode!

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
  test "04-060 - L/L.2-6-1: start portions of two LineStrings overlapping" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (200 120, 100 100, 40 40, 140 80, 200 40)" |> Geo.WKT.decode!

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
  test "04-061 - L/L.2-6-2: start portion of LineString A overlapping end portion of LineString B, intersecting at the middle of LineString A" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (280 240, 240 140, 200 120, 100 100, 40 40)" |> Geo.WKT.decode!

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
  test "04-062 - L/L.2-6-3: start portion of LineString A overlapping end portion of LineString B, intersecting at the middle of LineString A" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (80 190, 140 140, 40 40)" |> Geo.WKT.decode!

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
  test "04-063 - L/L.2-6-4: end portions of two LineStrings overlapping" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (240 200, 200 260, 80 240, 140 180)" |> Geo.WKT.decode!

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
  test "04-064 - L/L.2-6-5: end portion of LineString A overlapping start portion of LineString B" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (140 180, 80 240, 200 260, 240 200)" |> Geo.WKT.decode!

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
  test "04-065 - L/L.2-6-6: end portion of LineString A overlapping end portion of LineString B, intersecting at the middle of LineString A" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (280 240, 240 140, 200 120, 80 240)" |> Geo.WKT.decode!

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
  test "04-066 - L/L.2-6-7: middle portions of two LineStrings overlapping" do
    a = "LINESTRING (20 20, 80 80, 160 80, 240 80, 300 140)" |> Geo.WKT.decode!
    b = "LINESTRING (20 80, 120 80, 200 80, 260 20)" |> Geo.WKT.decode!

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
  test "04-067 - L/L.2-6-8: middle portion of LineString A overlapping start portion of LineString B" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 200 120, 240 140, 280 240)" |> Geo.WKT.decode!

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
  test "04-068 - L/L.2-6-9: middle portion of LineString A overlapping end portion of LineString B" do
    a = "LINESTRING (40 40, 100 100, 200 120, 80 240)" |> Geo.WKT.decode!
    b = "LINESTRING (280 240, 240 140, 200 120, 100 100)" |> Geo.WKT.decode!

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
  test "04-069 - L/L.2-6-10: middle portions of two LineStrings overlapping" do
    a = "LINESTRING (20 20, 80 80, 160 80, 240 80, 300 140)" |> Geo.WKT.decode!
    b = "LINESTRING (80 20, 80 80, 240 80, 300 20)" |> Geo.WKT.decode!

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
  test "04-070 - L/L.2-6-11: middle portions of two LineStrings overlapping, multiple intersects" do
    a = "LINESTRING (20 20, 80 80, 160 80, 240 80, 300 140)" |> Geo.WKT.decode!
    b = "LINESTRING (20 80, 80 80, 120 80, 140 140, 160 80, 200 80, 220 20, 240 80, 270 110, 300 80)" |> Geo.WKT.decode!

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
  test "04-071 - L/LR-3-1: a LineString touching a LinearRing" do
    a = "LINESTRING (100 100, 20 180, 180 180)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!

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
  test "04-072 - L/LR-4-1: a LineString crossing a LinearRing" do
    a = "LINESTRING (20 100, 180 100, 100 180)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!

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
  test "04-073 - L/LR-4-2: a LineString crossing a LinearRing" do
    a = "LINESTRING (100 40, 100 160, 180 160)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!

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
  test "04-074 - L/LR-4-3: a LineString crossing a LinearRing" do
    a = "LINESTRING (20 100, 100 100, 180 100, 100 180)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!

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
  test "04-075 - L/LR-5-1: a LineString within a LinearRing" do
    a = "LINESTRING (100 100, 160 40)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!

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
  test "04-076 - L/LR-5-2: a LineString within a LinearRing" do
    a = "LINESTRING (100 100, 180 20)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!

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
  test "04-077 - L/LR-5-3: a LineString within a LinearRing" do
    a = "LINESTRING (60 60, 100 100, 140 60)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!

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
  test "04-078 - L/LR-6-1: a LineString crossing a LinearRing" do
    a = "LINESTRING (100 100, 190 10, 190 100)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!

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
  test "04-079 - L/LR-6-2: a LineString crossing a LinearRing" do
    a = "LINESTRING (100 100, 160 40, 160 100)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!

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
  test "04-080 - L/LR-6-3: a LineString crossing a LinearRing" do
    a = "LINESTRING (60 140, 160 40, 160 140)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!

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
  test "04-081 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's end point with both crossing and overlapping line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (80 80, 20 80, 140 80, 80 20, 80 140)" |> Geo.WKT.decode!

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
  test "04-082 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's end point with overlapping line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (80 80, 20 80, 140 80)" |> Geo.WKT.decode!

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
  test "04-083 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's end point with crossing line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (80 80, 140 80, 80 20, 80 140)" |> Geo.WKT.decode!

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
  test "04-084 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's closing point with both crossing and overlapping line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (80 80, 20 80, 140 80, 80 20, 80 80)" |> Geo.WKT.decode!

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
  test "04-085 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's closing point with overlapping line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (80 80, 20 80, 140 80, 80 80)" |> Geo.WKT.decode!

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
  test "04-086 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's closing point with crossing line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (80 80, 20 80, 20 140, 140 20, 80 20, 80 80)" |> Geo.WKT.decode!

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
  test "04-087 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's interior at a non-vertex" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (20 140, 140 20, 100 20, 100 80)" |> Geo.WKT.decode!

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
  test "04-088 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's interior at a non-vertex with both crossing and overlapping line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (140 80, 20 80, 120 80, 80 20, 80 140)" |> Geo.WKT.decode!

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
  test "04-089 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's interior at a non-vertex with overlapping line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (140 80, 20 80, 140 80)" |> Geo.WKT.decode!

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
  test "04-090 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's interior at a non-vertex with crossing line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (140 80, 20 80, 80 140, 80 20)" |> Geo.WKT.decode!

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
  test "04-091 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's interior at a vertex" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (140 80, 80 80, 20 80, 50 140, 50 60)" |> Geo.WKT.decode!

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
  test "04-092 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's interior at a vertex with both crossing and overlapping line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (140 80, 20 80, 120 80, 80 20, 80 80, 80 140)" |> Geo.WKT.decode!

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
  test "04-093 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's interior at a vertex with overlapping line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (140 80, 20 80, 80 80, 140 80)" |> Geo.WKT.decode!

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
  test "04-094 - L/nsL: A line's interior at a non-vertex intersecting a non-simple linestring's interior at a vertex with crossing line segments" do
    a = "LINESTRING (20 20, 140 140)" |> Geo.WKT.decode!
    b = "LINESTRING (140 80, 20 80, 80 140, 80 80, 80 20)" |> Geo.WKT.decode!

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
  test "04-095 - L/nsL.1-3-1: start point of a LineString touching the self-intersecting point of a non-simple LineString" do
    a = "LINESTRING (130 150, 220 150, 220 240)" |> Geo.WKT.decode!
    b = "LINESTRING (130 240, 130 150, 220 20, 50 20, 130 150)" |> Geo.WKT.decode!

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
  test "04-096 - L/nsL.1-3-2: the interior of a LineString touching the self-intersecting point of a non-simple LineString" do
    a = "LINESTRING (30 150, 130 150, 250 150)" |> Geo.WKT.decode!
    b = "LINESTRING (130 240, 130 150, 220 20, 50 20, 130 150)" |> Geo.WKT.decode!

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
  test "04-097 - L/nsL.1-3-3: the interior of a LineString touching the self-intersecting point of a non-simple LineString" do
    a = "LINESTRING (30 150, 250 150)" |> Geo.WKT.decode!
    b = "LINESTRING (130 240, 130 150, 220 20, 50 20, 130 150)" |> Geo.WKT.decode!

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
  test "04-098 - L/nsL.1-3-4: the interior of a LineString touching the self-intersecting point of a non-simple LineString" do
    a = "LINESTRING (30 150, 130 150, 250 150)" |> Geo.WKT.decode!
    b = "LINESTRING (130 240, 130 20, 30 20, 130 150)" |> Geo.WKT.decode!

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
  test "04-099 - L/nsL.1-4: a Line crossing a non-simple LineString at non-vertices" do
    a = "LINESTRING (30 150, 250 150)" |> Geo.WKT.decode!
    b = "LINESTRING (120 240, 120 20, 20 20, 120 170)" |> Geo.WKT.decode!

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
  test "04-100 - nsL.5/L-3-1: switching the geometries for case L/nsL.5-3-1" do
    a = "LINESTRING (200 200, 20 20, 200 20, 110 110, 20 200, 110 200, 110 110)" |> Geo.WKT.decode!
    b = "LINESTRING (110 110, 200 110)" |> Geo.WKT.decode!

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
  test "04-101 - L/nsL.5-3-2: the start point of a line touching the self-intersecting and self-crossing point of a non-simple LineString" do
    a = "LINESTRING (110 110, 200 110)" |> Geo.WKT.decode!
    b = "LINESTRING (200 200, 20 20, 200 20, 110 110, 20 200, 110 200, 110 110)" |> Geo.WKT.decode!

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
  test "04-102 - L/nsL.5-3-3: the interior of a line touching the self-intersecting and self-crossing point of a non-simple LineString" do
    a = "LINESTRING (20 110, 200 110)" |> Geo.WKT.decode!
    b = "LINESTRING (200 200, 20 20, 200 20, 110 110, 20 200, 110 200, 110 110)" |> Geo.WKT.decode!

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
  test "04-103 - nsL.5/L-3-4 touches dim(0){A.nsL.Bdy.EPx = B.L.Int.NV}" do
    a = "LINESTRING (200 200, 20 20, 200 20, 110 110, 20 200, 110 200, 110 110)" |> Geo.WKT.decode!
    b = "LINESTRING (20 110, 200 110)" |> Geo.WKT.decode!

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
  test "04-104 - L/nsL.10-6-1: the middle portion of a line overlapping from the self-intersecting to the self-crossing a non-simple LineString" do
    a = "LINESTRING (90 200, 90 130, 110 110, 150 200)" |> Geo.WKT.decode!
    b = "LINESTRING (200 200, 20 20, 200 20, 20 200, 20 130, 90 130)" |> Geo.WKT.decode!

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
  test "04-105 - L/nsL.10-6-2: the middle portion of a line overlapping from the self-intersecting to the self-crossing a non-simple LineString" do
    a = "LINESTRING (200 110, 110 110, 90 130, 90 200)" |> Geo.WKT.decode!
    b = "LINESTRING (200 200, 20 20, 200 20, 20 200, 20 130, 90 130)" |> Geo.WKT.decode!

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
  test "04-106 - L/mL-3-1: a line's end point touching a non-vertex with crossing line segments of a MultiLineString" do
    a = "LINESTRING (80 80, 150 80, 210 80)" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((20 20, 140 140),(20 140, 140 20))" |> Geo.WKT.decode!

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
  test "04-107 - LR/LR-1-1: two equal LinearRings, pointwise" do
    a = "LINESTRING (40 80, 160 200, 260 20, 40 80)" |> Geo.WKT.decode!
    b = "LINESTRING (40 80, 160 200, 260 20, 40 80)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-108 - LR/LR-1-2: two equal LinearRings with points in reverse sequence" do
    a = "LINESTRING (40 80, 160 200, 260 20, 40 80)" |> Geo.WKT.decode!
    b = "LINESTRING (40 80, 260 20, 160 200, 40 80)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-109 - LR/LR-1-3: two equal LinearRings with points in different sequence" do
    a = "LINESTRING (40 80, 160 200, 260 20, 40 80)" |> Geo.WKT.decode!
    b = "LINESTRING (260 20, 40 80, 160 200, 260 20)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-110 - LR/LR-1-4: two equal LinearRings with different number of points" do
    a = "LINESTRING (40 80, 160 200, 260 20, 40 80)" |> Geo.WKT.decode!
    b = "LINESTRING (100 140, 160 200, 260 20, 40 80, 100 140)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-111 - LR/LR-4-1: two LinearRings crossing at closing points" do
    a = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!
    b = "LINESTRING (100 100, 180 180, 20 180, 100 100)" |> Geo.WKT.decode!

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
  test "04-112 - LR/LR-4-2: two LinearRings crossing at two points" do
    a = "LINESTRING (40 150, 40 40, 150 40, 150 150, 40 150)" |> Geo.WKT.decode!
    b = "LINESTRING (40 150, 150 40, 170 20, 170 190, 40 150)" |> Geo.WKT.decode!

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
  test "04-113 - LR/LR-4-3: two LinearRings crossing at the closing and a non-vertex" do
    a = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!
    b = "LINESTRING (180 100, 20 100, 100 180, 180 100)" |> Geo.WKT.decode!

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
  test "04-114 - LR/LR-4-4: two LinearRings crossing at the closing and a vertex" do
    a = "LINESTRING (100 100, 180 20, 20 20, 100 100)" |> Geo.WKT.decode!
    b = "LINESTRING (180 180, 100 100, 20 180, 180 180)" |> Geo.WKT.decode!

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
  test "04-115 - LR/LR-4-5: two LinearRings crossing at a vertex and a non-vertex" do
    a = "LINESTRING (20 180, 100 100, 20 20, 20 180)" |> Geo.WKT.decode!
    b = "LINESTRING (100 20, 100 180, 180 100, 100 20)" |> Geo.WKT.decode!

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
  test "04-116 - LR/LR-4-6: two LinearRings crossing at two points" do
    a = "LINESTRING (40 150, 40 40, 150 40, 150 150, 40 150)" |> Geo.WKT.decode!
    b = "LINESTRING (170 20, 20 170, 170 170, 170 20)" |> Geo.WKT.decode!

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
  test "04-117 - LR/LR-6-1: two LinearRings overlapping" do
    a = "LINESTRING (40 150, 40 40, 150 40, 150 150, 40 150)" |> Geo.WKT.decode!
    b = "LINESTRING (40 150, 150 150, 90 210, 40 150)" |> Geo.WKT.decode!

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
  test "04-118 - LR/LR-6-2: two LinearRings overlapping" do
    a = "LINESTRING (40 150, 40 40, 150 40, 150 150, 40 150)" |> Geo.WKT.decode!
    b = "LINESTRING (20 150, 170 150, 90 230, 20 150)" |> Geo.WKT.decode!

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
  test "04-119 - LR/LR-6-3: two LinearRings overlapping" do
    a = "LINESTRING (40 150, 40 40, 150 40, 150 150, 40 150)" |> Geo.WKT.decode!
    b = "LINESTRING (40 150, 150 150, 150 40, 20 40, 20 150, 40 150)" |> Geo.WKT.decode!

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
  test "04-120 - LR/nsL-3-1: a LinearRing touching a non-simple LineString" do
    a = "LINESTRING (110 110, 200 20, 20 20, 110 110)" |> Geo.WKT.decode!
    b = "LINESTRING (110 110, 200 200, 110 110, 20 200, 20 110, 200 110)" |> Geo.WKT.decode!

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
  test "04-121 - LR/nsL-3-1: a LinearRing touching a non-simple LineString" do
    a = "LINESTRING (110 110, 200 20, 20 20, 110 110)" |> Geo.WKT.decode!
    b = "LINESTRING (110 110, 20 110, 200 110, 50 110, 110 170)" |> Geo.WKT.decode!

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
  test "04-122 - LR/nsL-3-1: a LinearRing touching a non-simple LineString" do
    a = "LINESTRING (110 110, 200 20, 20 20, 110 110)" |> Geo.WKT.decode!
    b = "LINESTRING (110 110, 20 200, 110 200, 110 110, 200 200)" |> Geo.WKT.decode!

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
  test "04-123 - LR/nsL-6-1: a LinearRing and a non-simple LineString overlapping" do
    a = "LINESTRING (110 110, 200 20, 20 20, 110 110)" |> Geo.WKT.decode!
    b = "LINESTRING (200 20, 20 200, 200 200, 110 110, 110 40)" |> Geo.WKT.decode!

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
  test "04-124 - LR/nsL-6-2: a LinearRing and a non-simple LineString overlapping" do
    a = "LINESTRING (110 110, 200 20, 20 20, 110 110)" |> Geo.WKT.decode!
    b = "LINESTRING (200 20, 20 200, 200 200, 20 20)" |> Geo.WKT.decode!

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
  test "04-125 - nsL/nsL-4-1: non-simple LineStrings crossing at closing points" do
    a = "LINESTRING (110 110, 20 110, 110 20, 20 20, 110 110)" |> Geo.WKT.decode!
    b = "LINESTRING (110 110, 200 200, 110 200, 200 110, 110 110)" |> Geo.WKT.decode!

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
  test "04-126 - nsL/nsL-4-2: non-simple LineStrings crossing at two points without vertices" do
    a = "LINESTRING (20 120, 120 120, 20 20, 120 20, 20 120)" |> Geo.WKT.decode!
    b = "LINESTRING (170 100, 70 100, 170 170, 70 170, 170 100)" |> Geo.WKT.decode!

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
  test "04-127 - nsL/nsL-4-3: non-simple LineStrings crossing at a point" do
    a = "LINESTRING (20 110, 110 110, 20 20, 110 20, 20 110)" |> Geo.WKT.decode!
    b = "LINESTRING (110 160, 70 110, 60 160, 20 130, 110 160)" |> Geo.WKT.decode!

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
  test "04-128 - nsL/nsL-4-4: non-simple LineStrings crossing at self-crossing points" do
    a = "LINESTRING (20 200, 200 200, 20 20, 200 20, 20 200)" |> Geo.WKT.decode!
    b = "LINESTRING (20 110, 200 110, 200 160, 20 60, 20 110)" |> Geo.WKT.decode!

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
  test "04-129 - nsL/nsL-4-5: non-simple LineStrings crossing at vertices" do
    a = "LINESTRING (20 110, 110 110, 20 20, 110 20, 20 110)" |> Geo.WKT.decode!
    b = "LINESTRING (200 200, 110 110, 200 110, 110 200, 200 200)" |> Geo.WKT.decode!

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
  test "04-130 - nsL/nsL-4-6: non-simple LineStrings crossing at two points with vertices" do
    a = "LINESTRING (20 120, 120 120, 20 20, 120 20, 20 120)" |> Geo.WKT.decode!
    b = "LINESTRING (220 120, 120 20, 220 20, 120 120, 220 120)" |> Geo.WKT.decode!

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
  test "04-131 - mL/mL-1: MultiLineString" do
    a = "MULTILINESTRING ((70 20, 20 90, 70 170),(70 170, 120 90, 70 20))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((70 20, 20 90, 70 170),(70 170, 120 90, 70 20))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-132 - mL/mL-1-1: non-simple MultiLineString" do
    a = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-133 - mL/mL-1-2: equal non-simple MultiLineString with different sequence of lines and points" do
    a = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((90 140, 90 60, 90 20),(170 20, 130 20, 20 20))" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true

  end

  @tag :validation
  test "04-134 - mL/mL-3-1: non-simple MultiLineStrings touching at boundaries" do
    a = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((90 20, 170 100, 170 140),(170 60, 90 20, 20 60),(130 100, 130 60, 90 20, 50 90))" |> Geo.WKT.decode!

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
  test "04-135 - mL/mL-3-2: non-simple MultiLineStrings touching at boundaries" do
    a = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((90 20, 170 100, 170 140),(130 140, 130 60, 90 20, 20 90, 90 20, 130 60, 170 60))" |> Geo.WKT.decode!

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
  test "04-136 - mL/mL-3-3: non-simple MultiLineStrings touching at boundaries" do
    a = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((90 20, 170 100, 170 140),(170 60, 90 20, 20 60))" |> Geo.WKT.decode!

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
  test "04-137 - mL/mL-3-4: non-simple MultiLineStrings touching at boundaries" do
    a = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((90 20, 170 100, 170 140),(170 60, 90 20, 20 60),(130 100, 90 20))" |> Geo.WKT.decode!

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
  test "04-138 - mL/mL-3-5: non-simple MultiLineStrings touching at boundaries" do
    a = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((90 20, 170 100, 170 140),(170 60, 90 20, 20 60),(120 100, 170 100, 90 20))" |> Geo.WKT.decode!

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
  test "04-139 - mL/mL-3-6: non-simple MultiLineStrings touching at boundaries" do
    a = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((90 20, 170 100, 170 140),(170 60, 90 20, 20 60),(120 100, 170 100, 90 20))" |> Geo.WKT.decode!

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
  test "04-140 - mL/mL-3-7: non-simple MultiLineStrings touching at boundaries" do
    a = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((90 20, 170 100, 170 140),(130 140, 130 60, 90 20, 20 90, 90 20))" |> Geo.WKT.decode!

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
  test "04-141 - mL/mL-3-8: non-simple MultiLineStrings touching at boundaries" do
    a = "MULTILINESTRING ((20 20, 90 20, 170 20),(90 20, 90 80, 90 140))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((90 20, 170 100, 170 140),(170 60, 90 20, 20 60, 20 140, 90 20))" |> Geo.WKT.decode!

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
  test "04-142 - mL/mL-4-1: non-simple MultiLineStrings crossing" do
    a = "MULTILINESTRING ((20 20, 90 90, 20 160),(90 160, 90 20))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((160 160, 90 90, 160 20),(160 120, 120 120, 90 90, 160 60))" |> Geo.WKT.decode!

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
  test "04-143 - mL/mL-4-2: non-simple MultiLineStrings crossing" do
    a = "MULTILINESTRING ((20 20, 90 90, 20 160),(90 160, 90 20))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((160 160, 90 90, 160 20),(160 120, 120 120, 90 90, 120 60, 160 60))" |> Geo.WKT.decode!

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
  test "04-144 - mL/mL-4-3: non-simple MultiLineStrings crossing" do
    a = "MULTILINESTRING ((20 20, 90 90, 20 160),(90 160, 90 20))" |> Geo.WKT.decode!
    b = "MULTILINESTRING ((160 160, 90 90, 160 20),(160 120, 90 90, 160 60))" |> Geo.WKT.decode!

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
