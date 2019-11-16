defmodule Intersect.Validation.PointPolygonATest do
  use ExUnit.Case

  @tag :validation
  test "03-001 - P/A-2-1: a point outside a polygon" do
    a = "POINT (20 20)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-001 - P/A-2-1: a point outside a polygon (float)" do
    a = "POINT(20.0 20.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-002 - P/A-2-2: a point outside a converx polygon" do
    a = "POINT (70 170)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((110 230, 80 160, 20 160, 20 20, 200 20, 200 160, 140 160, 110 230))"
      |> Geo.WKT.decode!()

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
  test "03-002 - P/A-2-2: a point outside a converx polygon (float)" do
    a = "POINT(70.0 170.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((110.0 230.0,80.0 160.0,20.0 160.0,20.0 20.0,200.0 20.0,200.0 160.0,140.0 160.0,110.0 230.0))"
      |> Geo.WKT.decode!()

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
  test "03-003 - P/A-2-3: a point outside a concave polygon" do
    a = "POINT (110 130)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 160, 80 160, 110 100, 140 160, 200 160, 200 20, 20 20, 20 160))"
      |> Geo.WKT.decode!()

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
  test "03-003 - P/A-2-3: a point outside a concave polygon (float)" do
    a = "POINT(110.0 130.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 160.0,80.0 160.0,110.0 100.0,140.0 160.0,200.0 160.0,200.0 20.0,20.0 20.0,20.0 160.0))"
      |> Geo.WKT.decode!()

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
  test "03-004 - P/A-2-4: dim(0){A.P.Int = B.A.Ext}" do
    a = "POINT (100 70)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 150, 100 150, 40 50, 170 50, 110 150, 190 150, 190 20, 20 20, 20 150))"
      |> Geo.WKT.decode!()

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
  test "03-004 - P/A-2-4: dim(0){A.P.Int = B.A.Ext} (float)" do
    a = "POINT(100.0 70.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 150.0,100.0 150.0,40.0 50.0,170.0 50.0,110.0 150.0,190.0 150.0,190.0 20.0,20.0 20.0,20.0 150.0))"
      |> Geo.WKT.decode!()

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
  test "03-005 - P/A-2-5: a point outside a concave polygon" do
    a = "POINT (100 70)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 150, 100 150, 40 50, 160 50, 100 150, 180 150, 180 20, 20 20, 20 150))"
      |> Geo.WKT.decode!()

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
  test "03-005 - P/A-2-5: a point outside a concave polygon (float)" do
    a = "POINT(100.0 70.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 150.0,100.0 150.0,40.0 50.0,160.0 50.0,100.0 150.0,180.0 150.0,180.0 20.0,20.0 20.0,20.0 150.0))"
      |> Geo.WKT.decode!()

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
  test "03-006 - P/A-3-1: a point on the closing point of a polygon" do
    a = "POINT (60 120)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-006 - P/A-3-1: a point on the closing point of a polygon (float)" do
    a = "POINT(60.0 120.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-007 - P/A-3-2: a point on the boudary of a polygon at a non-vertex" do
    a = "POINT (110 120)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-007 - P/A-3-2: a point on the boudary of a polygon at a non-vertex (float)" do
    a = "POINT(110.0 120.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-008 - P/A-3-3: a point on the boundary of a polygon at a vertex" do
    a = "POINT (160 120)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-008 - P/A-3-3: a point on the boundary of a polygon at a vertex (float)" do
    a = "POINT(160.0 120.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-009 - P/A-3-4: a point on the touching point of boudary" do
    a = "POINT (100 150)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((20 150, 100 150, 40 50, 160 50, 100 150, 180 150, 180 20, 20 20, 20 150))"
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
  test "03-009 - P/A-3-4: a point on the touching point of boudary (float)" do
    a = "POINT(100.0 150.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((20.0 150.0,100.0 150.0,40.0 50.0,160.0 50.0,100.0 150.0,180.0 150.0,180.0 20.0,20.0 20.0,20.0 150.0))"
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
  test "03-010 - P/A-5: a point on the interior of a polygon" do
    a = "POINT (100 80)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-010 - P/A-5: a point on the interior of a polygon (float)" do
    a = "POINT(100.0 80.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-011 - P/Ah-2-1: a point outside of polygon with a hole" do
    a = "POINT (60 160)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
      |> Geo.WKT.decode!()

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
  test "03-011 - P/Ah-2-1: a point outside of polygon with a hole (float)" do
    a = "POINT(60.0 160.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
      |> Geo.WKT.decode!()

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
  test "03-012 - P/Ah-2-2: a point inside the hole of the polygon" do
    a = "POINT (190 90)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
      |> Geo.WKT.decode!()

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
  test "03-012 - P/Ah-2-2: a point inside the hole of the polygon (float)" do
    a = "POINT(190.0 90.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
      |> Geo.WKT.decode!()

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
  test "03-013 - P/Ah-3-1: a point on the closing point of the outer boundary of a polygon with a hole" do
    a = "POINT (190 190)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
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
  test "03-013 - P/Ah-3-1: a point on the closing point of the outer boundary of a polygon with a hole (float)" do
    a = "POINT(190.0 190.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
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
  test "03-014 - P/Ah-3-2: a point on the outer boundary of a polygon at a vertex" do
    a = "POINT (360 20)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
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
  test "03-014 - P/Ah-3-2: a point on the outer boundary of a polygon at a vertex (float)" do
    a = "POINT(360.0 20.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
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
  test "03-015 - P/Ah-3-3: a point on the outer boundary of a polygon at a non-vertex" do
    a = "POINT (130 130)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
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
  test "03-015 - P/Ah-3-3: a point on the outer boundary of a polygon at a non-vertex (float)" do
    a = "POINT(130.0 130.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
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
  test "03-016 - P/Ah-3-4: a point on the closing point of the inner boundary of a polygon" do
    a = "POINT (280 50)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
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
  test "03-016 - P/Ah-3-4: a point on the closing point of the inner boundary of a polygon (float)" do
    a = "POINT(280.0 50.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
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
  test "03-017 - P/Ah-3-5: a point on the inner boundary of a polygon at a non-vertex" do
    a = "POINT (150 100)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
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
  test "03-017 - P/Ah-3-5: a point on the inner boundary of a polygon at a non-vertex (float)" do
    a = "POINT(150.0 100.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
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
  test "03-018 - P/Ah-3-6: a point on the inner boundary of a polygon at a vertex" do
    a = "POINT (100 50)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
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
  test "03-018 - P/Ah-3-6: a point on the inner boundary of a polygon at a vertex (float)" do
    a = "POINT(100.0 50.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
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
  test "03-019 - P/Ah-5: a point inside the interior of a polygon with a hole" do
    a = "POINT (140 120)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
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
  test "03-019 - P/Ah-5: a point inside the interior of a polygon with a hole (float)" do
    a = "POINT(140.0 120.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
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
  test "03-020 - P/A2h-3-1: a point on the touching point of two holes in a polygon" do
    a = "POINT (190 50)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(90 50, 150 110, 190 50, 90 50),(190 50, 230 110, 290 50, 190 50))"
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
  test "03-020 - P/A2h-3-1: a point on the touching point of two holes in a polygon (float)" do
    a = "POINT(190.0 50.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(90.0 50.0,150.0 110.0,190.0 50.0,90.0 50.0),(190.0 50.0,230.0 110.0,290.0 50.0,190.0 50.0))"
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
  test "03-021 - P/A2h-3-2: a point on the touching point of two holes in a polygon" do
    a = "POINT (180 90)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(180 140, 180 40, 80 40, 180 140),(180 90, 210 140, 310 40, 230 40, 180 90))"
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
  test "03-021 - P/A2h-3-2: a point on the touching point of two holes in a polygon (float)" do
    a = "POINT(180.0 90.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(180.0 140.0,180.0 40.0,80.0 40.0,180.0 140.0),(180.0 90.0,210.0 140.0,310.0 40.0,230.0 40.0,180.0 90.0))"
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
  test "03-022 - mP/A-2: 3 points outside a polygon" do
    a = "MULTIPOINT (20 80, 110 160, 20 160)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-022 - mP/A-2: 3 points outside a polygon (float)" do
    a = "MULTIPOINT(20.0 80.0,110.0 160.0,20.0 160.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-023 - mP/A-3-1: one of 3 points on the closing point of the boundary of a polygon" do
    a = "MULTIPOINT (20 80, 60 120, 20 160)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-023 - mP/A-3-1: one of 3 points on the closing point of the boundary of a polygon (float)" do
    a = "MULTIPOINT(20.0 80.0,60.0 120.0,20.0 160.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-024 - mP/A-3-2: one of 3 points on the boundary of a polygon at a non-vertex" do
    a = "MULTIPOINT (10 80, 110 170, 110 120)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-024 - mP/A-3-2: one of 3 points on the boundary of a polygon at a non-vertex (float)" do
    a = "MULTIPOINT(10.0 80.0,110.0 170.0,110.0 120.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-025 - mP/A-3-3: one of 3 points on the boundary of a polygon at a vertex" do
    a = "MULTIPOINT (10 80, 110 170, 160 120)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-025 - mP/A-3-3: one of 3 points on the boundary of a polygon at a vertex (float)" do
    a = "MULTIPOINT(10.0 80.0,110.0 170.0,160.0 120.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-026 - mP/A-3-4: 3 of the 5 points on the boundary of a polygon" do
    a = "MULTIPOINT (20 120, 60 120, 110 120, 160 120, 200 120)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-026 - mP/A-3-4: 3 of the 5 points on the boundary of a polygon (float)" do
    a =
      "MULTIPOINT(20.0 120.0,60.0 120.0,110.0 120.0,160.0 120.0,200.0 120.0)" |> Geo.WKT.decode!()

    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-027 - mP/A-3-5: all 3 points on the boundary of a polygon" do
    a = "MULTIPOINT (60 120, 110 120, 160 120)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-027 - mP/A-3-5: all 3 points on the boundary of a polygon (float)" do
    a = "MULTIPOINT(60.0 120.0,110.0 120.0,160.0 120.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-028 - mP/A-3-6: all 4 points on the boundary of a polygon" do
    a = "MULTIPOINT (60 120, 160 120, 160 40, 60 40)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-028 - mP/A-3-6: all 4 points on the boundary of a polygon (float)" do
    a = "MULTIPOINT(60.0 120.0,160.0 120.0,160.0 40.0,60.0 40.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-029 - mP/A-4-1: 1 point outside a polygon, 1 point on the boundary and 1 point inside" do
    a = "MULTIPOINT (20 150, 60 120, 110 80)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-029 - mP/A-4-1: 1 point outside a polygon, 1 point on the boundary and 1 point inside (float)" do
    a = "MULTIPOINT(20.0 150.0,60.0 120.0,110.0 80.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-030 - mP/A-4-2: 1 point outside a polygon, 1 point on the boundary and 1 point inside" do
    a = "MULTIPOINT (110 80, 160 120, 200 160)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-030 - mP/A-4-2: 1 point outside a polygon, 1 point on the boundary and 1 point inside (float)" do
    a = "MULTIPOINT(110.0 80.0,160.0 120.0,200.0 160.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-031 - mP/A-4-3: 1 point outside a polygon, 1 point on the boundary and 1 point inside" do
    a = "MULTIPOINT (110 80, 110 120, 110 160)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-031 - mP/A-4-3: 1 point outside a polygon, 1 point on the boundary and 1 point inside (float)" do
    a = "MULTIPOINT(110.0 80.0,110.0 120.0,110.0 160.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-032 - mP/A-4-4: 1 point outside a polygon, 1 point inside" do
    a = "MULTIPOINT (110 170, 110 80)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-032 - mP/A-4-4: 1 point outside a polygon, 1 point inside (float)" do
    a = "MULTIPOINT(110.0 170.0,110.0 80.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-033 - mP/A-4-5: 1 point outside a polygon, 2 points on the boundary and 1 point inside" do
    a = "MULTIPOINT (60 120, 160 120, 110 80, 110 170)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-033 - mP/A-4-5: 1 point outside a polygon, 2 points on the boundary and 1 point inside (float)" do
    a = "MULTIPOINT(60.0 120.0,160.0 120.0,110.0 80.0,110.0 170.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-034 - mP/A-5-1: 2 points within a polygon" do
    a = "MULTIPOINT (90 80, 130 80)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-034 - mP/A-5-1: 2 points within a polygon (float)" do
    a = "MULTIPOINT(90.0 80.0,130.0 80.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-035 - mP/A-5-2: 1 point on the boundary and 1 point inside a polygon" do
    a = "MULTIPOINT (60 120, 160 120, 110 80)" |> Geo.WKT.decode!()
    b = "POLYGON ((60 120, 60 40, 160 40, 160 120, 60 120))" |> Geo.WKT.decode!()

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
  test "03-035 - mP/A-5-2: 1 point on the boundary and 1 point inside a polygon (float)" do
    a = "MULTIPOINT(60.0 120.0,160.0 120.0,110.0 80.0)" |> Geo.WKT.decode!()
    b = "POLYGON((60.0 120.0,60.0 40.0,160.0 40.0,160.0 120.0,60.0 120.0))" |> Geo.WKT.decode!()

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
  test "03-036 - mP/Ah-2-1: 3 points outside a polygon" do
    a = "MULTIPOINT (40 170, 40 90, 130 170)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
      |> Geo.WKT.decode!()

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
  test "03-036 - mP/Ah-2-1: 3 points outside a polygon (float)" do
    a = "MULTIPOINT(40.0 170.0,40.0 90.0,130.0 170.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
      |> Geo.WKT.decode!()

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
  test "03-037 - mP/Ah-2-2: 2 points outside a polygon and 1 point inside the hole of the polygon" do
    a = "MULTIPOINT (90 170, 280 170, 190 90)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
      |> Geo.WKT.decode!()

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
  test "03-037 - mP/Ah-2-2: 2 points outside a polygon and 1 point inside the hole of the polygon (float)" do
    a = "MULTIPOINT(90.0 170.0,280.0 170.0,190.0 90.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
      |> Geo.WKT.decode!()

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
  test "03-038 - mP/Ah-2-3: all 3 points in polygon's hole" do
    a = "MULTIPOINT (190 110, 150 70, 230 70)" |> Geo.WKT.decode!()

    b =
      "POLYGON ((190 190, 360 20, 20 20, 190 190),(280 50, 100 50, 190 140, 280 50))"
      |> Geo.WKT.decode!()

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
  test "03-038 - mP/Ah-2-3: all 3 points in polygon's hole (float)" do
    a = "MULTIPOINT(190.0 110.0,150.0 70.0,230.0 70.0)" |> Geo.WKT.decode!()

    b =
      "POLYGON((190.0 190.0,360.0 20.0,20.0 20.0,190.0 190.0),(280.0 50.0,100.0 50.0,190.0 140.0,280.0 50.0))"
      |> Geo.WKT.decode!()

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
  test "03-039 - P/mA-3-1: a point on the touching point of two polygons" do
    a = "POINT (100 100)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((20 100, 20 20, 100 20, 100 100, 20 100)),((100 180, 100 100, 180 100, 180 180, 100 180)))"
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
  test "03-039 - P/mA-3-1: a point on the touching point of two polygons (float)" do
    a = "POINT(100.0 100.0)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON(((20.0 100.0,20.0 20.0,100.0 20.0,100.0 100.0,20.0 100.0)),((100.0 180.0,100.0 100.0,180.0 100.0,180.0 180.0,100.0 180.0)))"
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
  test "03-040 - P/mA-3-2: a point on the boundary of one of the 2 polygons" do
    a = "POINT (20 100)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((20 100, 20 20, 100 20, 100 100, 20 100)),((100 180, 100 100, 180 100, 180 180, 100 180)))"
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
  test "03-040 - P/mA-3-2: a point on the boundary of one of the 2 polygons (float)" do
    a = "POINT(20.0 100.0)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON(((20.0 100.0,20.0 20.0,100.0 20.0,100.0 100.0,20.0 100.0)),((100.0 180.0,100.0 100.0,180.0 100.0,180.0 180.0,100.0 180.0)))"
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
  test "03-041 - P/mA-3-3: a point on the boundary of one of the 2 polygons" do
    a = "POINT (60 100)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((20 100, 20 20, 100 20, 100 100, 20 100)),((100 180, 100 100, 180 100, 180 180, 100 180)))"
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
  test "03-041 - P/mA-3-3: a point on the boundary of one of the 2 polygons (float)" do
    a = "POINT(60.0 100.0)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON(((20.0 100.0,20.0 20.0,100.0 20.0,100.0 100.0,20.0 100.0)),((100.0 180.0,100.0 100.0,180.0 100.0,180.0 180.0,100.0 180.0)))"
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
  test "03-042 - P/mA-3-4: a point touching a polygon's boundary where the boundaries touch at a point" do
    a = "POINT (110 110)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON (((110 110, 20 200, 200 200, 110 110),(110 110, 80 180, 140 180, 110 110)),((110 110, 20 20, 200 20, 110 110),(110 110, 80 40, 140 40, 110 110)))"
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
  test "03-042 - P/mA-3-4: a point touching a polygon's boundary where the boundaries touch at a point (float)" do
    a = "POINT(110.0 110.0)" |> Geo.WKT.decode!()

    b =
      "MULTIPOLYGON(((110.0 110.0,20.0 200.0,200.0 200.0,110.0 110.0),(110.0 110.0,80.0 180.0,140.0 180.0,110.0 110.0)),((110.0 110.0,20.0 20.0,200.0 20.0,110.0 110.0),(110.0 110.0,80.0 40.0,140.0 40.0,110.0 110.0)))"
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
end
