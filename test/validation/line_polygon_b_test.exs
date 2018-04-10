defmodule Intersect.Validation.LinePolygonBTest do
  use ExUnit.Case

  @tag :validation
  test "13-001 - LA - A and B simple" do
    a = "LINESTRING (240 190, 120 120)" |> Geo.WKT.decode()
    b = "POLYGON ((110 240, 50 80, 240 70, 110 240))" |> Geo.WKT.decode()

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
  test "13-002 - LA - A intersects B-hole" do
    a = "LINESTRING (0 100, 100 100, 200 200)" |> Geo.WKT.decode()

    b =
      "POLYGON ((30 240, 260 30, 30 30, 30 240),(80 140, 80 80, 140 80, 80 140))"
      |> Geo.WKT.decode()

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
  test "13-003 - LA - A intersects B-hole #2" do
    a = "LINESTRING (40 340, 200 250, 120 180, 160 110, 270 40)" |> Geo.WKT.decode()

    b =
      "POLYGON ((160 330, 60 260, 20 150, 60 40, 190 20, 270 130, 260 250, 160 330),(140 240, 80 190, 90 100, 160 70, 210 130, 210 210, 140 240))"
      |> Geo.WKT.decode()

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
  test "13-004 - mLmA - A and B complex, disjoint" do
    a =
      "MULTIPOLYGON (((60 320, 60 80, 300 80, 60 320),(80 280, 80 100, 260 100, 80 280)),((120 160, 140 160, 140 140, 120 160)))"
      |> Geo.WKT.decode()

    b =
      "MULTILINESTRING ((100 240, 100 180, 160 180, 160 120, 220 120),(40 360, 40 60, 340 60, 40 360, 40 20),(120 120, 120 140, 100 140, 100 120, 140 120))"
      |> Geo.WKT.decode()

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
  test "13-005 - mLmA - A and B complex, overlapping and touching #1" do
    a =
      "MULTIPOLYGON (((60 260, 60 120, 220 120, 220 260, 60 260),(80 240, 80 140, 200 140, 200 240, 80 240)),((100 220, 100 160, 180 160, 180 220, 100 220),(120 200, 120 180, 160 180, 160 200, 120 200)))"
      |> Geo.WKT.decode()

    b =
      "MULTILINESTRING ((40 260, 240 260, 240 240, 40 240, 40 220, 240 220),(120 300, 120 80, 140 80, 140 300, 140 80, 120 80, 120 320))"
      |> Geo.WKT.decode()

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
  test "13-006 - mLmA - A and B complex, overlapping and touching #2" do
    a =
      "MULTIPOLYGON (((60 320, 60 120, 280 120, 280 320, 60 320),(120 260, 120 180, 240 180, 240 260, 120 260)),((280 400, 320 400, 320 360, 280 360, 280 400)),((300 240, 300 220, 320 220, 320 240, 300 240)))"
      |> Geo.WKT.decode()

    b =
      "MULTILINESTRING ((80 300, 80 160, 260 160, 260 300, 80 300, 80 140),(220 360, 220 240, 300 240, 300 360))"
      |> Geo.WKT.decode()

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
  test "13-007 - mLmA - A and B complex, overlapping and touching #3" do
    a =
      "MULTIPOLYGON (((120 180, 60 80, 180 80, 120 180)),((100 240, 140 240, 120 220, 100 240)))"
      |> Geo.WKT.decode()

    b =
      "MULTILINESTRING ((180 260, 120 180, 60 260, 180 260),(60 300, 60 40),(100 100, 140 100))"
      |> Geo.WKT.decode()

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
