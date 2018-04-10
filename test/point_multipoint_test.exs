defmodule PointMultiPointTest do
  use ExUnit.Case

  @point %Geo.Point{coordinates: {3, -5}}
  @multi_point %Geo.MultiPoint{coordinates: [{-1, 2}, {3, -5}]}

  test "point should intersect a multipoint that contains itself" do
    assert Topo.intersects?(@point, @multi_point)
    assert Topo.intersects?(@multi_point, @point)
  end

  test "point should not be disjoint from a multipoint that contains itself" do
    refute Topo.disjoint?(@point, @multi_point)
    refute Topo.disjoint?(@multi_point, @point)
  end

  test "point should not contain a multipoint that contains any other point" do
    refute Topo.contains?(@point, @multi_point)
  end

  test "point should be within a multipoint that contains itself" do
    assert Topo.within?(@point, @multi_point)
  end

  test "point should not equal a multipoint that contains any other point" do
    refute Topo.equals?(@point, @multi_point)
  end

  test "point should contain a multipoint that contains only that point" do
    assert Topo.contains?(@point, %Geo.MultiPoint{coordinates: [@point.coordinates]})
  end

  test "point should be within a multipoint that contains only that point" do
    assert Topo.within?(@point, %Geo.MultiPoint{coordinates: [@point.coordinates]})
  end

  test "point should equal a multipoint that contains only that point" do
    assert Topo.equals?(@point, %Geo.MultiPoint{coordinates: [@point.coordinates]})
  end
end
