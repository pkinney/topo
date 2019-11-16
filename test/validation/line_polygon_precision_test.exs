defmodule Intersect.Validation.LinePolygonPrecisionTest do
  use ExUnit.Case

  @tag :validation
  test "17-001 - LA - line and sliver intersecting, dimensional collapse" do
    a = "POLYGON ((95 9, 81 414, 87 414, 95 9))" |> Geo.WKT.decode!()
    b = "LINESTRING (93 13, 96 13)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "17-001 - LA - line and sliver intersecting, dimensional collapse (float)" do
    a = "POLYGON((95.0 9.0,81.0 414.0,87.0 414.0,95.0 9.0))" |> Geo.WKT.decode!()
    b = "LINESTRING(93.0 13.0,96.0 13.0)" |> Geo.WKT.decode!()

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
