defmodule Intersect.Validation.LineComplexATest do
  use ExUnit.Case

  @tag :validation
  @tag :skip
  test "06-001 - LC - topographically equal with no boundary" do
    a = "LINESTRING (0 0, 0 50, 50 50, 50 0, 0 0)" |> Geo.WKT.decode!()

    b =
      "MULTILINESTRING ((0 0, 0 50),(0 50, 50 50),(50 50, 50 0),(50 0, 0 0))" |> Geo.WKT.decode!()

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
  @tag :skip
  test "06-002 - LC - intersection (containment) along mod-2 A-Int line segment" do
    a = "LINESTRING (40 180, 140 180)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((20 320, 180 320, 180 180, 20 180, 20 320)),((20 180, 20 80, 180 80, 180 180, 20 180)))"
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
  test "06-003 - LC - intersection (overlap) along mod-2 A-Int line segment" do
    a = "LINESTRING (40 180, 140 180)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((20 320, 180 320, 180 180, 20 180, 20 320)),((60 180, 60 80, 180 80, 180 180, 60 180)))"
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
  test "06-004 - LC - equal with boundary intersection" do
    a = "LINESTRING (0 0, 60 0, 60 60, 60 0, 120 0)" |> Geo.WKT.decode!()
    b = "MULTILINESTRING ((0 0, 60 0),(60 0, 120 0),(60 0, 60 60))" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == true
    assert Topo.within?(a, b) == true
    assert Topo.equals?(a, b) == true
    assert Topo.equals?(b, a) == true
  end
end
