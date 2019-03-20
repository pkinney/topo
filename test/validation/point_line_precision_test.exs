defmodule Intersect.Validation.PointLinePrecisionTest do
  use ExUnit.Case

  @tag :validation
  test "15-001 - PP - Point just off line. Causes non-robust algorithms to fail." do
    a = "LINESTRING (-123456789 -40, 381039468754763 123456789)" |> Geo.WKT.decode!
    b = "POINT (0 0)" |> Geo.WKT.decode!

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
