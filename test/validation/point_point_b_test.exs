defmodule Intersect.Validation.PointPointBTest do
  use ExUnit.Case

  @tag :validation
  test "09-001 - PP - point contained in both A and B" do
    a = "POINT (100 100)" |> Geo.WKT.decode!()
    b = "POINT (100 100)" |> Geo.WKT.decode!()

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
  test "09-002 - PP - A different from B" do
    a = "POINT (100 100)" |> Geo.WKT.decode!()
    b = "POINT (200 200)" |> Geo.WKT.decode!()

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
  test "09-003 - PmP - point in A contained in B" do
    a = "POINT (100 100)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (100 100, 200 200)" |> Geo.WKT.decode!()

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
  test "09-004 - mPmP - points in A only, B only, and in both" do
    a = "MULTIPOINT (100 100, 200 200, 300 300, 500 500)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (100 100, 200 200, 400 400, 600 600)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "09-005 - PP - point contained in both A and B" do
    a = "POINT (80 200)" |> Geo.WKT.decode!()
    b = "POINT (80 200)" |> Geo.WKT.decode!()

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
  test "09-006 - PP - A different from B" do
    a = "POINT (80 200)" |> Geo.WKT.decode!()
    b = "POINT (260 80)" |> Geo.WKT.decode!()

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
  test "09-007 - PP - A different from B, same y" do
    a = "POINT (60 260)" |> Geo.WKT.decode!()
    b = "POINT (120 260)" |> Geo.WKT.decode!()

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
  test "09-008 - PP - A different from B, same x" do
    a = "POINT (80 80)" |> Geo.WKT.decode!()
    b = "POINT (80 280)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == false
    assert Topo.intersects?(b, a) == false
    assert Topo.disjoint?(a, b) == true
    assert Topo.disjoint?(b, a) == true
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end
end
