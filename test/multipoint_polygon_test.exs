defmodule MultiPointPolygonTest do
  use ExUnit.Case

  @polygon %Geo.MultiPolygon{
    coordinates: [
      [
        [{60, 120}, {60, 40}, {160, 40}, {160, 120}, {60, 120}],
        [{140, 100}, {80, 100}, {80, 60}, {140, 60}, {140, 100}]
      ]
    ]
  }

  test "One Point in a Polygon" do
    b = %Geo.MultiPoint{coordinates: [{70, 50}, {100, 80}]}

    assert Topo.intersects?(@polygon, b)
    assert Topo.intersects?(b, @polygon)

    refute Topo.contains?(@polygon, b)
  end

  test "Both Points outside of a Polygon" do
    b = %Geo.MultiPoint{coordinates: [{70, 35}, {100, 80}]}

    refute Topo.intersects?(@polygon, b)
    refute Topo.intersects?(b, @polygon)

    refute Topo.contains?(@polygon, b)
  end

  test "Both Points inside of a Polygon" do
    b = %Geo.MultiPoint{coordinates: [{70, 50}, {71, 55}]}

    assert Topo.intersects?(@polygon, b)
    assert Topo.intersects?(b, @polygon)

    assert Topo.contains?(@polygon, b)
  end
end
