defmodule Intersect.Validation.LineLinePrecisionTest do
  use ExUnit.Case

  @tag :validation
  test "16-001 - LL - narrow V" do
    a = "LINESTRING (0 10, 620 10, 0 11)" |> Geo.WKT.decode!
    b = "LINESTRING (400 60, 400 10)" |> Geo.WKT.decode!

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
