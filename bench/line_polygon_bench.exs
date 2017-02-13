defmodule LinePolygonBench do
  use Benchfella
  import Topo

  @states Path.join([ "bench", "shapes", "states.json" ])
    |> File.read!
    |> Poison.decode!
    |> Map.fetch!("features")
    |> Enum.map(&(&1["geometry"]))
    |> Enum.map(&Geo.JSON.decode/1)

  @interstates Path.join([ "bench", "shapes", "interstates.json" ])
    |> File.read!
    |> Poison.decode!
    |> Map.fetch!("features")
    |> Enum.map(&(&1["geometry"]))
    |> Enum.map(&Geo.JSON.decode/1)

  bench "Interstates in States" do
    [state] = Enum.take_random(@states, 1)
    [interstates] = Enum.take_random(@interstates, 1)
    Topo.intersects?(state, interstates)
    :ok
  end

  bench "Interstates in States with Envelope check" do
    [state] = Enum.take_random(@states, 1)
    [interstates] = Enum.take_random(@interstates, 1)
    case Envelope.intersects?(Envelope.from_geo(state), Envelope.from_geo(interstates)) do
      true -> Topo.intersects?(state, interstates)
      false -> false
    end
    :ok
  end
end