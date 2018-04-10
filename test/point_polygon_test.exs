defmodule PointPolygonTest do
  use ExUnit.Case

  @convex %Geo.Polygon{coordinates: [[{60, 120}, {60, 40}, {160, 40}, {160, 120}, {60, 120}]]}
  @concave Path.join(["test", "fixtures", "poly.geo.json"])
           |> File.read!()
           |> Poison.decode!()
           |> Geo.JSON.decode()
  @with_hole %Geo.Polygon{
    coordinates: [
      [{60, 120}, {60, 40}, {160, 40}, {160, 120}, {60, 120}],
      [{140, 100}, {80, 100}, {80, 60}, {140, 60}, {140, 100}]
    ]
  }

  test "Point inside a convex polygon" do
    assert Topo.intersects?(@convex, {100, 70})
    assert Topo.contains?(@convex, {100, 70})
  end

  test "Point inside a concave polygon" do
    assert Topo.intersects?(@concave, {3.5, 6.5})
    assert Topo.intersects?(@concave, {1, 2})
  end

  test "Point outside a convex polygon" do
    refute Topo.intersects?(@convex, {0, 0})
    refute Topo.contains?(@convex, {0, 0})
  end

  test "Point outside a concave polygon" do
    refute Topo.intersects?(@concave, {3, 5})
    refute Topo.contains?(@concave, {3, 5})
  end

  test "Point on the edge of a polygon" do
    assert Topo.intersects?(@convex, {60, 80})
    refute Topo.contains?(@convex, {60, 80})

    assert Topo.intersects?(@concave, {2.5, 7})
    refute Topo.contains?(@concave, {2.5, 7})
  end

  test "Point on a vertex of a polygon" do
    assert Topo.intersects?(@convex, {160, 40})
    refute Topo.contains?(@convex, {160, 40})

    assert Topo.intersects?(@convex, {60, 120})
    refute Topo.contains?(@convex, {60, 120})

    assert Topo.intersects?(@concave, {3, 2})
    refute Topo.contains?(@concave, {3, 2})
  end

  test "Point inside the exterior of a polygon" do
    assert Topo.intersects?(@with_hole, {70, 50})
    assert Topo.contains?(@with_hole, {70, 50})
  end

  test "Point inside the hole of a polygon" do
    refute Topo.intersects?(@with_hole, {100, 80})
    refute Topo.contains?(@with_hole, {100, 80})
  end

  test "Point on a vertex of the hole of a polygon" do
    assert Topo.intersects?(@with_hole, {80, 100})
    refute Topo.contains?(@with_hole, {80, 100})
  end

  test "Point on an edge of the hole of a polygon" do
    assert Topo.intersects?(@with_hole, {80, 70})
    refute Topo.contains?(@with_hole, {80, 70})
  end
end
