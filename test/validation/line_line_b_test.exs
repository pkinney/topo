defmodule Intersect.Validation.LineLineBTest do
  use ExUnit.Case

  @tag :validation
  test "12-001 - LL - A crosses B" do
    a = "LINESTRING (0 0, 100 100)" |> Geo.WKT.decode!()
    b = "LINESTRING (0 100, 100 0)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "12-002 - LL - A shares one segment with B" do
    a = "LINESTRING (0 0, 100 100, 200 0)" |> Geo.WKT.decode!()
    b = "LINESTRING (0 0, 100 100, 200 200)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "12-003 - LL - A and B disjoint" do
    a = "LINESTRING (40 360, 40 220, 120 360)" |> Geo.WKT.decode!()
    b = "LINESTRING (120 340, 60 220, 140 220, 140 360)" |> Geo.WKT.decode!()

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
  test "12-004 - LL - A and B intersect frequently" do
    a =
      "LINESTRING (220 240, 200 220, 60 320, 40 300, 180 200, 160 180, 20 280)"
      |> Geo.WKT.decode!()

    b = "LINESTRING (220 240, 140 160, 120 180, 220 280, 200 300, 100 200)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "12-005 - LL - A and B equal" do
    a = "LINESTRING (80 320, 220 320, 220 160, 80 300)" |> Geo.WKT.decode!()
    b = "LINESTRING (80 320, 220 320, 220 160, 80 300)" |> Geo.WKT.decode!()

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
  test "12-006 - LL - A and B touch ends" do
    a = "LINESTRING (60 200, 60 260, 140 200)" |> Geo.WKT.decode!()
    b = "LINESTRING (60 200, 60 140, 140 200)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "12-007 - LL - intersecting rings" do
    a = "LINESTRING (180 200, 100 280, 20 200, 100 120, 180 200)" |> Geo.WKT.decode!()
    b = "LINESTRING (100 200, 220 200, 220 80, 100 80, 100 200)" |> Geo.WKT.decode!()

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
