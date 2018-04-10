defmodule MultiPointMultPointTest do
  use ExUnit.Case

  @multi_point %Geo.MultiPoint{coordinates: [{-1, 2}, {3, -5}, {2, 0}]}

  test "MultiPoint should intersect itself" do
    assert Topo.intersects?(@multi_point, @multi_point)
  end

  test "MultiPoint should not be disjoint from itself" do
    refute Topo.disjoint?(@multi_point, @multi_point)
  end

  test "MultiPoint should contain itself" do
    assert Topo.contains?(@multi_point, @multi_point)
  end

  test "MultiPoint should be within itself" do
    assert Topo.within?(@multi_point, @multi_point)
  end

  test "MultiPoint should equal itself" do
    assert Topo.equals?(@multi_point, @multi_point)
  end

  test "MultiPoint pair that share at least on point" do
    b = %Geo.MultiPoint{coordinates: [{3, -5}, {1, 2}, {0, -1}]}
    assert Topo.intersects?(@multi_point, b)
    assert Topo.intersects?(b, @multi_point)
    refute Topo.disjoint?(@multi_point, b)
    refute Topo.disjoint?(b, @multi_point)
    refute Topo.contains?(@multi_point, b)
    refute Topo.within?(@multi_point, b)
    refute Topo.equals?(@multi_point, b)
  end

  test "MultiPoint pair that share no points" do
    b = %Geo.MultiPoint{coordinates: [{-1, -5}, {1, -1}]}
    refute Topo.intersects?(@multi_point, b)
    refute Topo.intersects?(b, @multi_point)
    assert Topo.disjoint?(@multi_point, b)
    assert Topo.disjoint?(b, @multi_point)
    refute Topo.contains?(@multi_point, b)
    refute Topo.within?(@multi_point, b)
    refute Topo.equals?(@multi_point, b)
  end

  test "MultiPoint pair where one is a subset of the other" do
    b = %Geo.MultiPoint{coordinates: [{-1, 2}, {2, 0}]}
    assert Topo.intersects?(@multi_point, b)
    assert Topo.intersects?(b, @multi_point)
    refute Topo.disjoint?(@multi_point, b)
    refute Topo.disjoint?(b, @multi_point)
    assert Topo.contains?(@multi_point, b)
    refute Topo.within?(@multi_point, b)
    refute Topo.equals?(@multi_point, b)
  end
end
