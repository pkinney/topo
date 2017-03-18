defmodule Topo do
  alias Topo.Intersects
  alias Topo.Contains
  alias Topo.Cleaner

  @moduledoc ~S"""
  A Geometry library for Elixir that calculates relationships between two
  geometries.  Geometries can be of any of the following types:

  * Point
  * LineString
  * Polygon
  * MultiPoint
  * MultiLineString
  * MultiPolygon

  Each of these functions can be passed any two Geometries in either a Map with a
  `:type` and `:coordinates` keys or as a struct generated via the Geo library
  (https://github.com/bryanjos/geo). Coordinates are represented as atoms `{x, y}`
  and multiple coordinates as Lists.

  ```elixir
  a = %{type: "Polygon", coordinates: [[{2, 2}, {20, 2}, {11, 11}, {2, 2}]]}
  b = %Geo.Polygon{coordinates: [[{2, 2}, {20, 2}, {11, 11}, {2, 2}]]}

  Topo.equals? a, b # => true
  ```

  Instead of a Point geometry, just a single coordinate can be used.

  ```elixir
  a = %{type: "Polygon", coordinates: [[{2, 2}, {20, 2}, {11, 11}, {2, 2}]]}

  Topo.intersects? a, {4, 6} # => true
  ```

  The `Topo` library's functions will automatically attempt to "clean" geometries
  passed to them:

  * Linear Rings (including Polygons) will be reordered to a counter-clockwise
  direction.
  * Polygon's Linear Rings will automatically be closed if the first point is not
  repeated as the last point.
  * Points that are equal or collinear with surrounding points are removed from
  LineStrings or Polygons.
  """

  @type geometry :: {number, number}
                  | %{type: String.t, coordinates: list}
                  | %Geo.Point{}
                  | %Geo.MultiPoint{}
                  | %Geo.LineString{}
                  | %Geo.MultiLineString{}
                  | %Geo.Polygon{}
                  | %Geo.MultiPolygon{}

  @doc ~S"""
  Returns `true` if geometries **A** and **B** share at least one point in
  common.

  ## Examples
      iex> Topo.intersects?(
      ...>   %{type: "Polygon", coordinates: [[{2, 2}, {20, 2}, {11, 11}, {2, 2}]]},
      ...>   %{type: "LineString", coordinates: [{11, 10}, {4, 2.5}, {16, 2.5}, {11, 10}]}
      ...> )
      true

      iex> Topo.intersects?(
      ...>   %{type: "Polygon", coordinates: [
      ...>     [{60, 120}, {60, 40}, {160, 40}, {160, 120}, {60, 120}],
      ...>     [{140, 100}, {80, 100}, {80, 60}, {140, 60}, {140, 100}]]},
      ...>   %{type: "MultiPoint", coordinates: [{70, 35}, {100, 80}]}
      ...> )
      false
  """
  @spec intersects?(geometry, geometry) :: boolean
  def intersects?(a, b), do: Intersects.intersects?(Cleaner.clean(a), Cleaner.clean(b))

  @doc ~S"""
  Returns `true` if geometries **A** and **B** do not have any points in
  common.

  ## Examples
      iex> Topo.disjoint?({1, -3}, %{type: "MultiPoint", coordinates: [{70, 35}, {100, 80}]})
      true

      iex> Topo.disjoint?(
      ...>   %{type: "Polygon", coordinates: [
      ...>     [{60, 120}, {60, 40}, {160, 40}, {160, 120}, {60, 120}],
      ...>     [{140, 100}, {80, 100}, {80, 60}, {140, 60}, {140, 100}]]},
      ...>   %Geo.MultiPoint{coordinates: [{70, 35}, {100, 80}]}
      ...> )
      true
  """
  @spec disjoint?(geometry, geometry) :: boolean
  def disjoint?(a, b), do: !Intersects.intersects?(Cleaner.clean(a), Cleaner.clean(b))

  @doc ~S"""
  Returns `true` if all points of geometry **B** lie within **A**.

  There are a few non-obvious special cases that are worth mentioning:

    - A Polygon does not contain its own boundary.  Specifically a LineString that
    is the exact same as a Polygon's exterior Linear ring is not contained within a
    that Polygon.

    ```elixir
    a = %Geo.Polygon{coordinates: [[{2, 2}, {20, 2}, {11, 11}, {2, 2}]]}
    b = %Geo.LineString{coordinates: [{2, 2}, {20, 2}, {11, 11}, {2, 2}]}

    Topo.contains? a, b # => false
    Topo.intersects? a, b  # => true
    ```

    - A LineString does not contain it's own first and last point (unless those
    points are the same, as in a LinearRing)

    ```elixir
    a = %Geo.LineString{coordinates: [{1, 3}, {2, -1}, {0, -1}]}
    b = %Geo.LineString{coordinates: [{1, 3}, {2, -1}, {0, -1}, {1, 3}]}

    Topo.contains? a, {1, 3} # => false
    Topo.intersects? a, {1, 3} # => true
    Topo.contains? b, {1, 3} # => true
    ```

  ## Examples
      iex> Topo.contains?(
      ...>   %{type: "Polygon", coordinates: [[{20, 20}, {20, 180}, {220, 180}, {220, 20}, {20, 20}]]},
      ...>   %{type: "Polygon", coordinates: [[{160, 60}, {20, 20}, {100, 140}, {160, 60}]]}
      ...> )
      true

      iex> Topo.contains?(
      ...>   %{type: "Polygon", coordinates: [[{160, 60}, {20, 20}, {100, 140}, {160, 60}]]},
      ...>   %{type: "Polygon", coordinates: [[{20, 20}, {20, 180}, {220, 180}, {220, 20}, {20, 20}]]}
      ...> )
      false
  """
  @spec contains?(geometry, geometry) :: boolean
  def contains?(a, b), do: Contains.contains?(Cleaner.clean(a), Cleaner.clean(b))

  @doc ~S"""
  This is the direct converse of `contains?`.  All points of
  geometry **A** lie within geometry **B**.

  ## Examples
      iex> Topo.within?(
      ...>   %{type: "Polygon", coordinates: [[{20, 20}, {20, 180}, {220, 180}, {220, 20}, {20, 20}]]},
      ...>   %{type: "Polygon", coordinates: [[{160, 60}, {20, 20}, {100, 140}, {160, 60}]]}
      ...> )
      false

      iex> Topo.within?(
      ...>   %{type: "Polygon", coordinates: [[{160, 60}, {20, 20}, {100, 140}, {160, 60}]]},
      ...>   %{type: "Polygon", coordinates: [[{20, 20}, {20, 180}, {220, 180}, {220, 20}, {20, 20}]]}
      ...> )
      true
  """
  @spec within?(geometry, geometry) :: boolean
  def within?(a, b), do: Contains.contains?(Cleaner.clean(b), Cleaner.clean(a))

  @doc ~S"""
  Geometries **A** and **B** are equivalent and cover the exact
  same set of points.  By definition, **A** and **B** are equal if **A** contains
  **B** and **B** contains **A**.  Equality does not necessarily mean that the
  geometries are of the same type.  A Point **A** is equal to a MultiPoint that
  contains only the same Point **A**.

  ## Examples
      iex> Topo.equals?(
      ...>   %{type: "Point", coordinates: {2, -3}},
      ...>   %{type: "MultiPoint", coordinates: [{2, -3}]}
      ...> )
      true

      iex> Topo.equals?(
      ...>   %{type: "Polygon", coordinates: [[{160, 60}, {20, 20}, {100, 140}, {160, 60}]]},
      ...>   %{type: "Polygon", coordinates: [[{20, 20}, {20, 180}, {220, 180}, {220, 20}, {20, 20}]]}
      ...> )
      false
  """
  @spec equals?(geometry, geometry) :: boolean
  def equals?(a, b), do: do_equals?(Cleaner.clean(a), Cleaner.clean(b))

  defp do_equals?(a, b), do: Contains.contains?(a, b) && Contains.contains?(b, a)
end
