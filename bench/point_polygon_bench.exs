defmodule PointPolygonBench do
  use Benchfella
  import Topo

  @values -1..13
  @points for x <- @values,
              y <- @values,
              do: %Geo.Point{coordinates: {x, y}}
  @multipoint %Geo.MultiPoint{
    coordinates:
      for(
        x <- @values,
        y <- @values,
        do: {x, y}
      )
  }
  @polygon Path.join(["test", "fixtures", "poly.geo.json"])
           |> File.read!()
           |> Poison.decode!()
           |> Geo.JSON.decode!()

  bench "Point / Polygon intersects" do
    Enum.each(@points, fn point ->
      intersects?(point, @polygon)
    end)
  end

  bench "MultiPoint / Polygon intersects" do
    intersects?(@multipoint, @polygon)
  end

  bench "Polygon / MultiPoint contains" do
    contains?(@polygon, @multipoint)
  end

  @states Path.join(["bench", "shapes", "states.json"])
          |> File.read!()
          |> Poison.decode!()
          |> Map.fetch!("features")
          |> Enum.map(& &1["geometry"])
          |> Enum.map(&Geo.JSON.decode!/1)

  @cities Path.join(["bench", "shapes", "cities.json"])
          |> File.read!()
          |> Poison.decode!()
          |> Map.fetch!("features")
          |> Enum.map(& &1["geometry"])
          |> Enum.map(&Geo.JSON.decode!/1)

  bench "Cities in States" do
    [state] = Enum.take_random(@states, 1)
    [city] = Enum.take_random(@cities, 1)
    Topo.contains?(state, city)
    :ok
  end

  bench "Cities in States with Envelope check" do
    [state] = Enum.take_random(@states, 1)
    [%{coordinates: {lon, lat}}] = Enum.take_random(@cities, 1)

    case Envelope.contains?(Envelope.from_geo(state), {lon, lat}) do
      true -> Topo.contains?(state, {lon, lat})
      false -> false
    end

    :ok
  end
end
