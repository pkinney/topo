defmodule Intersect.Validation.PointLineBTest do
  use ExUnit.Case

  @tag :validation
  test "10-001 - mPL - points in I and E of line" do
    a = "MULTIPOINT (40 90, 20 20, 70 70)" |> Geo.WKT.decode!()
    b = "LINESTRING (20 20, 100 100)" |> Geo.WKT.decode!()

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
  test "10-001 - mPL - points in I and E of line (float)" do
    a = "MULTIPOINT(40.0 90.0,20.0 20.0,70.0 70.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(20.0 20.0,100.0 100.0)" |> Geo.WKT.decode!()

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
  test "10-002 - mPL - points in I and E of line, line self-intersecting" do
    a = "MULTIPOINT (40 90, 20 20, 70 70)" |> Geo.WKT.decode!()
    b = "LINESTRING (20 20, 110 110, 170 50, 130 10, 70 70)" |> Geo.WKT.decode!()

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
  test "10-002 - mPL - points in I and E of line, line self-intersecting (float)" do
    a = "MULTIPOINT(40.0 90.0,20.0 20.0,70.0 70.0)" |> Geo.WKT.decode!()
    b = "LINESTRING(20.0 20.0,110.0 110.0,170.0 50.0,130.0 10.0,70.0 70.0)" |> Geo.WKT.decode!()

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
  test "10-003 - mPmL - points in I, B and E of lines, lines overlap, points overlap" do
    a =
      "MULTILINESTRING ((100 320, 100 220),(100 180, 200 180),(220 180, 220 320),(220 320, 160 320),(100 320, 100 220),(100 180, 200 180),(220 180, 220 320),(220 320, 160 320),(100 220, 100 320))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOINT (100 320, 100 260, 100 220, 100 200, 100 180, 120 180, 200 180, 220 180, 220 260, 220 320, 200 320, 160 320, 140 320, 120 320, 100 320, 100 260, 100 220, 100 200, 100 180, 120 180, 200 180, 220 180, 220 260, 220 320, 200 320, 160 320, 140 320, 120 320)"
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
  test "10-003 - mPmL - points in I, B and E of lines, lines overlap, points overlap (float)" do
    a =
      "MULTILINESTRING((100.0 320.0,100.0 220.0),(100.0 180.0,200.0 180.0),(220.0 180.0,220.0 320.0),(220.0 320.0,160.0 320.0),(100.0 320.0,100.0 220.0),(100.0 180.0,200.0 180.0),(220.0 180.0,220.0 320.0),(220.0 320.0,160.0 320.0),(100.0 220.0,100.0 320.0))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOINT(100.0 320.0,100.0 260.0,100.0 220.0,100.0 200.0,100.0 180.0,120.0 180.0,200.0 180.0,220.0 180.0,220.0 260.0,220.0 320.0,200.0 320.0,160.0 320.0,140.0 320.0,120.0 320.0,100.0 320.0,100.0 260.0,100.0 220.0,100.0 200.0,100.0 180.0,120.0 180.0,200.0 180.0,220.0 180.0,220.0 260.0,220.0 320.0,200.0 320.0,160.0 320.0,140.0 320.0,120.0 320.0)"
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
  test "10-004 - mPmL - points in I, B and E of lines, lines overlap, points overlap, x &lt;0, y &lt; 0" do
    a =
      "MULTILINESTRING ((-500 -140, -500 -280, -320 -280, -320 -140, -500 -140, -500 -340),(-500 -140, -320 -140, -500 -140, -320 -140, -500 -140))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOINT (-560 -180, -420 -180, -500 -220, -500 -340, -500 -280, -500 -140, -320 -140, -420 -140, -320 -180, -280 -140, -320 -120, -560 -180, -420 -180, -500 -220, -500 -340, -500 -280, -500 -140, -320 -140, -420 -140, -320 -180, -280 -140, -320 -120)"
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
  test "10-004 - mPmL - points in I, B and E of lines, lines overlap, points overlap, x &lt;0, y &lt; 0 (float)" do
    a =
      "MULTILINESTRING((-500.0 -140.0,-500.0 -280.0,-320.0 -280.0,-320.0 -140.0,-500.0 -140.0,-500.0 -340.0),(-500.0 -140.0,-320.0 -140.0,-500.0 -140.0,-320.0 -140.0,-500.0 -140.0))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOINT(-560.0 -180.0,-420.0 -180.0,-500.0 -220.0,-500.0 -340.0,-500.0 -280.0,-500.0 -140.0,-320.0 -140.0,-420.0 -140.0,-320.0 -180.0,-280.0 -140.0,-320.0 -120.0,-560.0 -180.0,-420.0 -180.0,-500.0 -220.0,-500.0 -340.0,-500.0 -280.0,-500.0 -140.0,-320.0 -140.0,-420.0 -140.0,-320.0 -180.0,-280.0 -140.0,-320.0 -120.0)"
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
  test "10-006 - mPmL - points in I, B and E of lines, lines overlap, points overlap" do
    a =
      "MULTILINESTRING ((100 320, 100 220),(100 180, 200 180),(220 180, 220 320),(220 320, 160 320),(100 320, 100 220),(100 180, 200 180),(220 180, 220 320),(220 320, 160 320),(100 220, 100 320))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOINT (100 320, 100 260, 100 220, 100 200, 100 180, 120 180, 200 180, 220 180, 220 260, 220 320, 200 320, 160 320, 140 320, 120 320, 100 320, 100 260, 100 220, 100 200, 100 180, 120 180, 200 180, 220 180, 220 260, 220 320, 200 320, 160 320, 140 320, 120 320)"
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
  test "10-006 - mPmL - points in I, B and E of lines, lines overlap, points overlap (float)" do
    a =
      "MULTILINESTRING((100.0 320.0,100.0 220.0),(100.0 180.0,200.0 180.0),(220.0 180.0,220.0 320.0),(220.0 320.0,160.0 320.0),(100.0 320.0,100.0 220.0),(100.0 180.0,200.0 180.0),(220.0 180.0,220.0 320.0),(220.0 320.0,160.0 320.0),(100.0 220.0,100.0 320.0))"
      |> Geo.WKT.decode!()

    b =
      "MULTIPOINT(100.0 320.0,100.0 260.0,100.0 220.0,100.0 200.0,100.0 180.0,120.0 180.0,200.0 180.0,220.0 180.0,220.0 260.0,220.0 320.0,200.0 320.0,160.0 320.0,140.0 320.0,120.0 320.0,100.0 320.0,100.0 260.0,100.0 220.0,100.0 200.0,100.0 180.0,120.0 180.0,200.0 180.0,220.0 180.0,220.0 260.0,220.0 320.0,200.0 320.0,160.0 320.0,140.0 320.0,120.0 320.0)"
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
