defmodule PointPolygonBench do
  use Benchfella
  import Topo

  @values -1..13
  @points (for x <- @values, y <- @values, do: %Geo.Point{coordinates: {x, y}})
  @multipoint %Geo.MultiPoint{coordinates: (for x <- @values, y <- @values, do: {x, y})}
  @polygon Path.join([ "test", "fixtures", "poly.geo.json" ])
    |> File.read!
    |> Poison.decode!
    |> Geo.JSON.decode

  bench "Point / Polygon intersects" do
    Enum.each @points, fn point ->
      intersects? point, @polygon
    end
  end

  bench "MultiPoint / Polygon intersects" do
    intersects? @multipoint, @polygon
  end

  bench "Polygon / MultiPoint contains" do
    contains? @polygon, @multipoint
  end
end