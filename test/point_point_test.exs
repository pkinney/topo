defmodule PointPointTest do
  use ExUnit.Case

  @point %Geo.Point{coordinates: {3, -5}}

  test "point should intersect itself" do
    assert Topo.intersects?(@point, @point)
  end

  test "point should not be disjoint from itself" do
    refute Topo.disjoint?(@point, @point)
  end

  test "point should contain itself" do
    assert Topo.contains?(@point, @point)
  end

  test "point should be within itself" do
    assert Topo.within?(@point, @point)
  end

  test "point should equal itself" do
    assert Topo.equals?(@point, @point)
  end

  test "point should not intersect a different point" do
    refute Topo.intersects?(@point, %Geo.Point{coordinates: {-1, 2}})
  end

  test "point should be disjoint a different point" do
    assert Topo.disjoint?(@point, %Geo.Point{coordinates: {-1, 2}})
  end

  test "point should not contain a different point" do
    refute Topo.contains?(@point, %Geo.Point{coordinates: {-1, 2}})
  end

  test "point should not be within a different point" do
    refute Topo.within?(@point, %Geo.Point{coordinates: {-1, 2}})
  end

  test "point should not equal a different point" do
    refute Topo.equals?(@point, %Geo.Point{coordinates: {-1, 2}})
  end
end
