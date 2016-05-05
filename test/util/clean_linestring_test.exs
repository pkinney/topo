defmodule CleanLineStringTest do
  use ExUnit.Case

  @valid_line [{60, 120}, {60, 40}, {160, 40}]

  test "remove a duplicate point" do
    b = %Geo.LineString{coordinates: List.insert_at(@valid_line, 1, Enum.at(@valid_line, 1))}

    assert Topo.Cleaner.clean(b).coordinates === @valid_line
  end

  test "remove a collinear point" do
    b = %Geo.LineString{coordinates: List.insert_at(@valid_line, 1, {60, 73})}

    assert Topo.Cleaner.clean(b).coordinates === @valid_line
  end

  test "remove a duplicate point from a MultiLineString" do
    b = %Geo.MultiLineString{coordinates: [
      List.insert_at(@valid_line, 1, Enum.at(@valid_line, 1)),
      List.insert_at(@valid_line, 0, Enum.at(@valid_line, 0))
    ]}

    assert Topo.Cleaner.clean(b).coordinates === [@valid_line, @valid_line]
  end
end
