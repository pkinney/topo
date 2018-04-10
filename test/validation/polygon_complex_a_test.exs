defmodule Intersect.Validation.PolygonComplexATest do
  use ExUnit.Case

  @tag :validation
  test "08-001 - AC A-shells overlapping B-shell at A-vertex" do
    a = "POLYGON ((100 60, 140 100, 100 140, 60 100, 100 60))" |> Geo.WKT.decode()

    b =
      "MULTIPOLYGON (((80 40, 120 40, 120 80, 80 80, 80 40)),((120 80, 160 80, 160 120, 120 120, 120 80)),((80 120, 120 120, 120 160, 80 160, 80 120)),((40 80, 80 80, 80 120, 40 120, 40 80)))"
      |> Geo.WKT.decode()

    assert Topo.intersects?(a, b) === true
    assert Topo.intersects?(b, a) === true
    assert Topo.disjoint?(a, b) === false
    assert Topo.disjoint?(b, a) === false
    assert Topo.contains?(a, b) === false
    assert Topo.within?(a, b) === false
    assert Topo.equals?(a, b) === false
    assert Topo.equals?(b, a) === false
  end
end
