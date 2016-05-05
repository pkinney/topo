defmodule Mix.Tasks.Validation.Gen do
  @moduledoc false
  
  use Mix.Task

  @shortdoc "Generates the ExUnit tests to cover the validation suite"

  @skip ~w{05-033 05-034 05-037 05-038 05-042 06-001 06-002 06-003 06-004}

  @groups %{
    "TestRelatePP" => %{ file_name: "point_point_a", module_name: "PointPointA" },
    "TestRelatePL" => %{ file_name: "point_line_a", module_name: "PointLineA" },
    "TestRelatePA" => %{ file_name: "point_polygon_a", module_name: "PointPolygonA" },
    "TestRelateLL" => %{ file_name: "line_line_a", module_name: "LineLineA" },
    "TestRelateLA" => %{ file_name: "line_polygon_a", module_name: "LinePolygonA" },
    "TestRelateLC" => %{ file_name: "line_complex_a", module_name: "LineComplexA" },
    "TestRelateAA" => %{ file_name: "polygon_polygon_a", module_name: "PolygonPolygonA" },
    "TestRelateAC" => %{ file_name: "polygon_complex_a", module_name: "PolygonComplexA" },
    "TestFunctionPP" => %{ file_name: "point_point_b", module_name: "PointPointB" },
    "TestFunctionPL" => %{ file_name: "point_line_b", module_name: "PointLineB" },
    "TestFunctionPA" => %{ file_name: "point_polygon_b", module_name: "PointPolygonB" },
    "TestFunctionLL" => %{ file_name: "line_line_b", module_name: "LineLineB" },
    "TestFunctionLA" => %{ file_name: "line_polygon_b", module_name: "LinePolygonB" },
    "TestFunctionAA" => %{ file_name: "polygon_polygon_b", module_name: "PolygonPolygonB" },
    "TestFunctionPLPrec" => %{ file_name: "point_line_precision", module_name: "PointLinePrecision" },
    "TestFunctionLLPrec" => %{ file_name: "line_line_precision", module_name: "LineLinePrecision" },
    "TestFunctionLAPrec" => %{ file_name: "line_polygon_precision", module_name: "LinePolygonPrecision" },
    "TestFunctionAAPrec" => %{ file_name: "polygon_polygon_precision", module_name: "PolygonPolygonPrecision" }
  }

  def run(_) do
    cases = test_cases()
    Enum.each(Map.keys(@groups), fn group ->
      group_cases = Enum.filter(cases, &(&1["group"] === group))
      write_test_file(group_cases, @groups[group].module_name <> "Test", "test/validation/#{@groups[group].file_name}_test.exs")
    end)
  end

  defp test_cases() do
    Path.join([ "lib", "mix", "tasks", "validation_cases.json" ])
    |> File.read!
    |> Poison.decode!
    |> Map.get("cases")
    |> Enum.filter(&(&1["b"]))
  end

  defp write_test_file(test_cases, module_name, filename) do
    s = ~s"""
    defmodule Intersect.Validation.#{module_name} do
      use ExUnit.Case
    #{test_cases |> Enum.map(&generate_test/1)}end
    """

    File.write!(filename, s)
  end

  defp generate_test(test_case) do
    title = test_case["title"] |> String.replace(~r{\[.*\]}, "") |> String.strip

    tags = cond do
      test_case["id"] in @skip -> "@tag :validation\n  @tag :skip"
      true -> "@tag :validation"
    end
    ~s"""

      #{tags}
      test "#{test_case["id"]} - #{title}" do
        a = "#{test_case["a"]["wkt"]}" |> Geo.WKT.decode
        b = "#{test_case["b"]["wkt"]}" |> Geo.WKT.decode

        assert Topo.intersects?(a, b) === #{test_case["relationship"]["intersects"]}
        assert Topo.intersects?(b, a) === #{test_case["relationship"]["intersects"]}
        assert Topo.disjoint?(a, b) === #{test_case["relationship"]["disjoint"]}
        assert Topo.disjoint?(b, a) === #{test_case["relationship"]["disjoint"]}
        assert Topo.contains?(a, b) === #{test_case["relationship"]["contains"]}
        assert Topo.within?(a, b) === #{test_case["relationship"]["within"]}
        assert Topo.equals?(a, b) === #{test_case["relationship"]["equals"]}
        assert Topo.equals?(b, a) === #{test_case["relationship"]["equals"]}
      end
    """
  end
end
