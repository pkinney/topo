defmodule Intersect.Validation.PointPointATest do
  use ExUnit.Case

  @tag :validation
  test "01-001 - P/P: same point" do
    a = "POINT (20 20)" |> Geo.WKT.decode!()
    b = "POINT (20 20)" |> Geo.WKT.decode!()

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
  test "01-002 - P/P: different point" do
    a = "POINT (20 20)" |> Geo.WKT.decode!()
    b = "POINT (40 60)" |> Geo.WKT.decode!()

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
  test "01-003 - P/mP: different points" do
    a = "POINT (40 40)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (20 20, 80 80, 20 120)" |> Geo.WKT.decode!()

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
  test "01-004 - P/mP: point A within one of B points" do
    a = "POINT (20 20)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (20 20, 80 80, 20 120)" |> Geo.WKT.decode!()

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
  test "01-005 - mP/mP-1-1: same points" do
    a = "MULTIPOINT (40 40, 80 60, 120 100)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (40 40, 80 60, 120 100)" |> Geo.WKT.decode!()

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
  test "01-006 - mP/mP-1-2: same but different sequence of points" do
    a = "MULTIPOINT (40 40, 80 60, 120 100)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (40 40, 120 100, 80 60)" |> Geo.WKT.decode!()

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
  test "01-007 - mP/mP-2: different points" do
    a = "MULTIPOINT (40 40, 60 100, 100 60, 120 120)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (20 120, 60 60, 100 100, 140 40)" |> Geo.WKT.decode!()

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
  test "01-008 - mP/mP-5-1: same points" do
    a = "MULTIPOINT (20 20, 80 70, 140 120, 200 170)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (20 20, 80 70, 140 120, 200 170)" |> Geo.WKT.decode!()

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
  test "01-009 - mP/mP-5-2: same points but different sequence" do
    a = "MULTIPOINT (20 20, 140 120, 80 70, 200 170)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (80 70, 20 20, 200 170, 140 120)" |> Geo.WKT.decode!()

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
  test "01-010 - mP/mP-5-3: some points same" do
    a = "MULTIPOINT (20 20, 80 70, 140 120, 200 170)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (80 70, 140 120)" |> Geo.WKT.decode!()

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
  test "01-011 - mP/mP-5-4: some points same, in a different sequence" do
    a = "MULTIPOINT (80 70, 20 20, 200 170, 140 120)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (140 120, 80 70)" |> Geo.WKT.decode!()

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
  test "01-012 - mP/mP-6-1: some points same, some different" do
    a = "MULTIPOINT (80 70, 20 20, 200 170, 140 120)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (80 170, 140 120, 200 80)" |> Geo.WKT.decode!()

    assert Topo.intersects?(a, b) == true
    assert Topo.intersects?(b, a) == true
    assert Topo.disjoint?(a, b) == false
    assert Topo.disjoint?(b, a) == false
    assert Topo.contains?(a, b) == false
    assert Topo.within?(a, b) == false
    assert Topo.equals?(a, b) == false
    assert Topo.equals?(b, a) == false
  end

  @tag :validation
  test "01-013 - mP/mP-6-2: dim(0){A.4P1.Int = B.4P4.Int}, dim(0){A.4P4.Int = B.4P2.Int}" do
    a = "MULTIPOINT (80 70, 20 20, 200 170, 140 120)" |> Geo.WKT.decode!()
    b = "MULTIPOINT (80 170, 140 120, 200 80, 80 70)" |> Geo.WKT.decode!()

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
