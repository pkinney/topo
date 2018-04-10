defmodule PointLineStringTest do
  use ExUnit.Case

  @point %Geo.Point{coordinates: {14, 18}}
  @linestring %Geo.LineString{
    coordinates: [{4, 2}, {4, 4}, {10, 10}, {15, 10}, {20, 12}, {8, 24}, {12, 24}]
  }
  @multilinestring %Geo.MultiLineString{
    coordinates: [
      [{4, 2}, {4, 4}, {10, 10}, {15, 10}, {20, 12}, {8, 24}, {12, 24}],
      [{1, 3}, {2, -1}, {0, -1}, {1, 3}]
    ]
  }

  test "point should intersect a linestring that it lies on" do
    assert Topo.intersects?(@point, @linestring)
    assert Topo.intersects?(@linestring, @point)
  end

  test "point should not be disjoint from a linestring that contains itself" do
    refute Topo.disjoint?(@point, @linestring)
    refute Topo.disjoint?(@linestring, @point)
  end

  test "point should not contain a linestring" do
    refute Topo.contains?(@point, @linestring)
  end

  test "point should be within a linestring that it lies on" do
    assert Topo.within?(@point, @linestring)
  end

  test "point should not equal a linestring" do
    refute Topo.equals?(@point, @linestring)
  end

  test "point on the first point of a linestring" do
    b = %Geo.Point{coordinates: List.first(@linestring.coordinates)}
    assert Topo.intersects?(@linestring, b)
    assert Topo.intersects?(b, @linestring)
    refute Topo.disjoint?(@linestring, b)
    refute Topo.disjoint?(b, @linestring)

    refute Topo.contains?(@linestring, b)
    refute Topo.within?(@linestring, b)
    refute Topo.equals?(@linestring, b)
  end

  test "a LineString does not contain it's endpoints" do
    a = %Geo.Point{coordinates: List.first(@linestring.coordinates)}
    b = %Geo.Point{coordinates: List.last(@linestring.coordinates)}

    refute Topo.contains?(@linestring, a)
    refute Topo.contains?(@linestring, b)
  end

  test "point on one of the points in a LineString" do
    b = %Geo.Point{coordinates: Enum.at(@linestring.coordinates, 2)}
    assert Topo.intersects?(@linestring, b)
    assert Topo.intersects?(b, @linestring)
    refute Topo.disjoint?(@linestring, b)
    refute Topo.disjoint?(b, @linestring)

    assert Topo.contains?(@linestring, b)
    refute Topo.within?(@linestring, b)
    refute Topo.equals?(@linestring, b)
  end

  test "point not on a LineString" do
    b = %Geo.Point{coordinates: {12, 5}}
    refute Topo.intersects?(@linestring, b)
    refute Topo.intersects?(b, @linestring)
    assert Topo.disjoint?(@linestring, b)
    assert Topo.disjoint?(b, @linestring)

    refute Topo.contains?(@linestring, b)
    refute Topo.within?(@linestring, b)
    refute Topo.equals?(@linestring, b)
  end

  test "point not on a MultiLineString" do
    b = %Geo.Point{coordinates: {12, 5}}
    refute Topo.intersects?(@multilinestring, b)
    refute Topo.intersects?(b, @multilinestring)
    assert Topo.disjoint?(@multilinestring, b)
    assert Topo.disjoint?(b, @multilinestring)

    refute Topo.contains?(@multilinestring, b)
    refute Topo.within?(@multilinestring, b)
    refute Topo.equals?(@multilinestring, b)
  end

  test "point on one linestring of a MultiLineString" do
    assert Topo.intersects?(@multilinestring, @point)
    assert Topo.intersects?(@point, @multilinestring)
    refute Topo.disjoint?(@multilinestring, @point)
    refute Topo.disjoint?(@point, @multilinestring)

    assert Topo.contains?(@multilinestring, @point)
    refute Topo.within?(@multilinestring, @point)
    refute Topo.equals?(@multilinestring, @point)
  end
end
