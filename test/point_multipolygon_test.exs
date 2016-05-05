defmodule PointMultiPolygonTest do
  use ExUnit.Case

  @multipolygon %Geo.MultiPolygon{
    coordinates: [[[{60, 120}, {60, 40}, {160, 40}, {160, 120}, {60, 120}],
                   [{140, 100}, {80, 100}, {80, 60}, {140, 60}, {140, 100}]],
                  [[{70, 10}, {100, 10}, {90, 25}, {60, 20}, {70, 10}]]]}

  test "Point in one polygon of a MultiPolygons" do
    assert Topo.intersects? @multipolygon, {70, 50}
    assert Topo.intersects? {70, 50}, @multipolygon
    assert Topo.intersects? @multipolygon, {80, 15}
    assert Topo.intersects? {80, 15}, @multipolygon

    assert Topo.contains? @multipolygon, {70, 50}
    assert Topo.contains? @multipolygon, {80, 15}
  end

  test "Point outside both polygons of a MultiPolygons" do
    refute Topo.intersects? @multipolygon, {70, 35}
    refute Topo.contains? @multipolygon, {70, 35}
  end

  test "Point inside the hole of a polygon of a MultiPolygons" do
    refute Topo.intersects? @multipolygon, {100, 80}
    refute Topo.contains? @multipolygon, {100, 80}
  end
end
