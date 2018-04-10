defmodule MultiPointMultiPolygonTest do
  use ExUnit.Case

  @multipolygon %Geo.MultiPolygon{
    coordinates: [
      [
        [{60, 120}, {60, 40}, {160, 40}, {160, 120}, {60, 120}],
        [{140, 100}, {80, 100}, {80, 60}, {140, 60}, {140, 100}]
      ],
      [[{70, 10}, {100, 10}, {90, 25}, {60, 20}, {70, 10}]]
    ]
  }

  test "One Point in one polygon of a MultiPolygons" do
    b = %Geo.MultiPoint{coordinates: [{70, 50}, {100, 80}]}

    assert Topo.intersects?(@multipolygon, b)
    assert Topo.intersects?(b, @multipolygon)

    refute Topo.contains?(@multipolygon, b)
  end

  test "Both Points outside of a MultiPolygons" do
    b = %Geo.MultiPoint{coordinates: [{70, 35}, {100, 80}]}

    refute Topo.intersects?(@multipolygon, b)
    refute Topo.intersects?(b, @multipolygon)

    refute Topo.contains?(@multipolygon, b)
  end

  test "Both Points inside of a MultiPolygons" do
    b = %Geo.MultiPoint{coordinates: [{70, 50}, {80, 15}]}

    assert Topo.intersects?(@multipolygon, b)
    assert Topo.intersects?(b, @multipolygon)

    assert Topo.contains?(@multipolygon, b)
  end
end
