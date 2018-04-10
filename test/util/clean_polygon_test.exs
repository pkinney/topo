defmodule CleanPolygonTest do
  use ExUnit.Case

  @valid_ring [{60, 120}, {60, 40}, {160, 40}, {160, 120}, {60, 120}]
  @valid_hole [{140, 100}, {80, 100}, {80, 60}, {140, 60}, {140, 100}]

  @exterior {20, 20}
  @interior {70, 70}
  @in_hole {100, 80}

  test "reverse an incorrect exterior" do
    polygon = %Geo.Polygon{
      coordinates: [
        Enum.reverse(@valid_ring),
        @valid_hole
      ]
    }

    refute Topo.intersects?(polygon, @exterior)
    assert Topo.intersects?(polygon, @interior)
    refute Topo.intersects?(polygon, @in_hole)
  end

  test "reverse an incorrect hole" do
    polygon = %Geo.Polygon{
      coordinates: [
        @valid_ring,
        Enum.reverse(@valid_hole)
      ]
    }

    refute Topo.intersects?(polygon, @exterior)
    assert Topo.intersects?(polygon, @interior)
    refute Topo.intersects?(polygon, @in_hole)
  end

  test "repeat the first point at the end of the exterior" do
    polygon = %Geo.Polygon{
      coordinates: [
        Enum.drop(@valid_ring, -1),
        @valid_hole
      ]
    }

    refute Topo.intersects?(polygon, @exterior)
    assert Topo.intersects?(polygon, @interior)
    refute Topo.intersects?(polygon, @in_hole)
  end

  test "repeat the first point at the end of the hole" do
    polygon = %Geo.Polygon{
      coordinates: [
        @valid_ring,
        Enum.drop(@valid_hole, -1)
      ]
    }

    refute Topo.intersects?(polygon, @exterior)
    assert Topo.intersects?(polygon, @interior)
    refute Topo.intersects?(polygon, @in_hole)
  end

  test "repeat the first point at the end of the hole in a MultiPolygon" do
    polygon = %Geo.MultiPolygon{
      coordinates: [
        [
          @valid_ring,
          Enum.drop(@valid_hole, -1)
        ],
        [
          [{6, 12}, {6, 4}, {16, 4}, {16, 12}, {6, 12}]
        ]
      ]
    }

    refute Topo.intersects?(polygon, @exterior)
    assert Topo.intersects?(polygon, @interior)
    refute Topo.intersects?(polygon, @in_hole)
  end

  test "repeat the first point at the end of the hole in a MultiPolygon 2" do
    polygon = %Geo.MultiPolygon{
      coordinates: [
        [
          [{6, 12}, {6, 4}, {16, 4}, {16, 12}, {6, 12}]
        ],
        [
          @valid_ring,
          Enum.drop(@valid_hole, -1)
        ]
      ]
    }

    refute Topo.intersects?(polygon, @exterior)
    assert Topo.intersects?(polygon, @interior)
    refute Topo.intersects?(polygon, @in_hole)
  end

  test "clean a GeoJSON-like map" do
    polygon = %{
      type: "MultiPolygon",
      coordinates: [
        [
          [{6, 12}, {6, 4}, {16, 4}, {16, 12}, {6, 12}]
        ],
        [
          @valid_ring,
          Enum.drop(@valid_hole, -1)
        ]
      ]
    }

    refute Topo.intersects?(polygon, @exterior)
    assert Topo.intersects?(polygon, @interior)
    refute Topo.intersects?(polygon, @in_hole)
  end
end
