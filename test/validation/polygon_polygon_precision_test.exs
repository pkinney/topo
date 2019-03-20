defmodule Intersect.Validation.PolygonPolygonPrecisionTest do
  use ExUnit.Case

  @tag :validation
  test "18-001 - AA - sliver triangle, cut by polygon" do
    a = "POLYGON ((10 10, 100 10, 10 11, 10 10))" |> Geo.WKT.decode!()
    b = "POLYGON ((90 0, 200 0, 200 200, 90 200, 90 0))" |> Geo.WKT.decode!()

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
  test "18-002 - AA - polygon with outward sliver, cut by polygon" do
    a = "POLYGON ((100 10, 10 10, 90 11, 90 20, 100 20, 100 10))" |> Geo.WKT.decode!()
    b = "POLYGON ((20 20, 0 20, 0 0, 20 0, 20 20))" |> Geo.WKT.decode!()

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
  test "18-003 - AA - narrow wedge in polygon" do
    a = "POLYGON ((10 10, 50 10, 50 50, 10 50, 10 31, 49 30, 10 30, 10 10))" |> Geo.WKT.decode!()
    b = "POLYGON ((60 40, 40 40, 40 20, 60 20, 60 40))" |> Geo.WKT.decode!()

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
  test "18-004 - AA - hole close to shell" do
    a =
      "POLYGON ((10 100, 10 10, 100 10, 100 100, 10 100),(90 90, 11 90, 10 10, 90 11, 90 90))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((0 30, 0 0, 30 0, 30 30, 0 30))" |> Geo.WKT.decode!()

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
  test "18-005 - mAA - shells close together" do
    a =
      "MULTIPOLYGON (((0 0, 100 0, 100 20, 0 20, 0 0)),((0 40, 0 21, 100 20, 100 40, 0 40)))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((110 30, 90 30, 90 10, 110 10, 110 30))" |> Geo.WKT.decode!()

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
  test "18-006 - AA - A sliver triangle cutting all the way across B" do
    a = "POLYGON ((100 10, 0 10, 100 11, 100 10))" |> Geo.WKT.decode!()
    b = "POLYGON ((20 20, 0 20, 0 0, 20 0, 20 20))" |> Geo.WKT.decode!()

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
  test "18-007 - AA - A polygon with sliver cutting all the way across B" do
    a = "POLYGON ((100 10, 0 10, 90 11, 90 20, 100 20, 100 10))" |> Geo.WKT.decode!()
    b = "POLYGON ((20 20, 0 20, 0 0, 20 0, 20 20))" |> Geo.WKT.decode!()

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
  test "18-008 - AA - hole close to shell, B coincident with A" do
    a =
      "POLYGON ((10 100, 10 10, 100 10, 100 100, 10 100),(90 90, 11 90, 10 10, 90 11, 90 90))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((10 30, 10 0, 30 10, 30 30, 10 30))" |> Geo.WKT.decode!()

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
  test "18-009 - AA - A hole close to shell, B coincident with A" do
    a =
      "POLYGON ((10 100, 10 10, 100 10, 100 100, 10 100),(90 90, 11 90, 10 10, 90 11, 90 90))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((10 30, 10 10, 30 10, 30 30, 10 30))" |> Geo.WKT.decode!()

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
  test "18-010 - AA - B hole close to shell, A coincident with B" do
    a = "POLYGON ((10 30, 10 10, 30 10, 30 30, 10 30))" |> Geo.WKT.decode!()

    b =
      "POLYGON ((10 100, 10 10, 100 10, 100 100, 10 100),(90 90, 11 90, 10 10, 90 11, 90 90))"
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
  test "18-011 - AA - B sliver crossing A triangle in line segment with length &lt; 1" do
    a = "POLYGON ((0 0, 200 0, 0 198, 0 0))" |> Geo.WKT.decode!()
    b = "POLYGON ((280 60, 139 60, 280 70, 280 60))" |> Geo.WKT.decode!()

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
  test "18-012 - AA - sliver triangles, at angle to each other" do
    a = "POLYGON ((0 0, 140 10, 0 20, 0 0))" |> Geo.WKT.decode!()
    b = "POLYGON ((280 0, 139 10, 280 1, 280 0))" |> Geo.WKT.decode!()

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
  test "18-013 - AA - sliver triangle with multiple intersecting boxes" do
    a =
      "MULTIPOLYGON (((1 4, 1 1, 2 1, 2 4, 1 4)),((3 4, 3 1, 4 1, 4 4, 3 4)),((5 4, 5 1, 6 1, 6 4, 5 4)),((7 4, 7 1, 8 1, 8 4, 7 4)),((9 4, 9 1, 10 1, 10 4, 9 4)))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((0 2, 11 3, 11 2, 0 2))" |> Geo.WKT.decode!()

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
  test "18-014 - AA - Polygon with hole with outward sliver, cut by polygon" do
    a =
      "POLYGON ((20 40, 20 200, 180 200, 180 40, 20 40),(180 120, 120 120, 120 160, 60 120, 120 80, 120 119, 180 120))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((200 160, 160 160, 160 80, 200 80, 200 160))" |> Geo.WKT.decode!()

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
  test "18-015 - AA - Polygon with hole with outward sliver, cut by line" do
    a =
      "POLYGON ((20 40, 20 200, 180 200, 180 40, 20 40),(180 120, 120 120, 120 160, 60 120, 120 80, 120 119, 180 120))"
      |> Geo.WKT.decode!()

    b = "LINESTRING (160 140, 160 100)" |> Geo.WKT.decode!()

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
  test "18-016 - AA - Polygon with inward sliver touching hole, cut by polygon" do
    a =
      "POLYGON ((20 40, 20 200, 180 200, 180 120, 140 120, 180 119, 180 40, 20 40),(140 160, 80 120, 140 80, 140 160))"
      |> Geo.WKT.decode!()

    b = "POLYGON ((200 160, 150 160, 150 80, 200 80, 200 160))" |> Geo.WKT.decode!()

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
  test "18-017 - AA - intersecting slivers, dimensional collapse" do
    a = "POLYGON ((83 33, 62 402, 68 402, 83 33))" |> Geo.WKT.decode!()
    b = "POLYGON ((78 39, 574 76, 576 60, 78 39))" |> Geo.WKT.decode!()

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
