defmodule Intersect.Validation.PointPolygonBTest do
  use ExUnit.Case

  @tag :validation
  test "11-001 - PA - point contained in simple polygon" do
    a = "POINT (100 100)" |> Geo.WKT.decode!
    b = "POLYGON ((50 50, 200 50, 200 200, 50 200, 50 50))" |> Geo.WKT.decode!

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
  test "11-002 - mPmA - points on I, B and E of touching triangles" do
    a = "MULTIPOLYGON (((120 320, 180 200, 240 320, 120 320)),((180 200, 240 80, 300 200, 180 200)))" |> Geo.WKT.decode!
    b = "MULTIPOINT (120 320, 180 260, 180 320, 180 200, 300 200, 200 220)" |> Geo.WKT.decode!

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false

  end

  @tag :validation
  test "11-003 - mPmA - points on I, B and E of concentric doughnuts" do
    a = "MULTIPOLYGON (((120 80, 420 80, 420 340, 120 340, 120 80),(160 300, 160 120, 380 120, 380 300, 160 300)),((200 260, 200 160, 340 160, 340 260, 200 260),(240 220, 240 200, 300 200, 300 220, 240 220)))" |> Geo.WKT.decode!
    b = "MULTIPOINT (200 360, 420 340, 400 100, 340 120, 200 140, 200 160, 220 180, 260 200, 200 360, 420 340, 400 100, 340 120, 200 140, 200 160, 220 180, 260 200)" |> Geo.WKT.decode!

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
