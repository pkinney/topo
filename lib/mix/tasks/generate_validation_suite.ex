defmodule Mix.Tasks.Validation.Gen do
  @moduledoc false

  use Mix.Task

  @shortdoc "Generates the ExUnit tests to cover the validation suite"

  @skip ~w{05-033 05-034 05-037 05-038 05-042 06-001 06-002 06-003 06-004}

  @groups %{
    "TestRelatePP" => %{file_name: "point_point_a", module_name: "PointPointA"},
    "TestRelatePL" => %{file_name: "point_line_a", module_name: "PointLineA"},
    "TestRelatePA" => %{file_name: "point_polygon_a", module_name: "PointPolygonA"},
    "TestRelateLL" => %{file_name: "line_line_a", module_name: "LineLineA"},
    "TestRelateLA" => %{file_name: "line_polygon_a", module_name: "LinePolygonA"},
    "TestRelateLC" => %{file_name: "line_complex_a", module_name: "LineComplexA"},
    "TestRelateAA" => %{file_name: "polygon_polygon_a", module_name: "PolygonPolygonA"},
    "TestRelateAC" => %{file_name: "polygon_complex_a", module_name: "PolygonComplexA"},
    "TestFunctionPP" => %{file_name: "point_point_b", module_name: "PointPointB"},
    "TestFunctionPL" => %{file_name: "point_line_b", module_name: "PointLineB"},
    "TestFunctionPA" => %{file_name: "point_polygon_b", module_name: "PointPolygonB"},
    "TestFunctionLL" => %{file_name: "line_line_b", module_name: "LineLineB"},
    "TestFunctionLA" => %{file_name: "line_polygon_b", module_name: "LinePolygonB"},
    "TestFunctionAA" => %{file_name: "polygon_polygon_b", module_name: "PolygonPolygonB"},
    "TestFunctionPLPrec" => %{
      file_name: "point_line_precision",
      module_name: "PointLinePrecision"
    },
    "TestFunctionLLPrec" => %{file_name: "line_line_precision", module_name: "LineLinePrecision"},
    "TestFunctionLAPrec" => %{
      file_name: "line_polygon_precision",
      module_name: "LinePolygonPrecision"
    },
    "TestFunctionAAPrec" => %{
      file_name: "polygon_polygon_precision",
      module_name: "PolygonPolygonPrecision"
    }
  }

  @spec run(any) :: atom
  def run(_) do
    cases = test_cases()

    Enum.each(Map.keys(@groups), fn group ->
      group_cases = Enum.filter(cases, &(&1["group"] == group))

      write_test_file(
        group_cases,
        @groups[group].module_name <> "Test",
        "test/validation2/#{@groups[group].file_name}_test.exs"
      )
    end)

    :ok
  end

  defp test_cases() do
    ["lib", "mix", "tasks", "validation_cases.json"]
    |> Path.join()
    |> File.read!()
    |> Poison.decode!()
    |> Map.get("cases")
    |> Enum.filter(& &1["b"])
  end

  defp write_test_file(cases, module_name, filename) do
    s = ~s"""
    defmodule Intersect.Validation.#{module_name} do
      use ExUnit.Case
    #{cases |> Enum.map(&generate_test/1)}end
    """

    File.write!(filename, s)
  end

  defp generate_test(test_case) do
    title = test_case["title"] |> String.replace(~r{\[.*\]}, "") |> String.trim()

    tags =
      if test_case["id"] in @skip do
        "@tag :validation\n  @tag :skip"
      else
        "@tag :validation"
      end

    build_test(test_case, title, tags)
  end

  defp build_test(test_case, title, tag_str) do
    ~s"""

      #{tag_str}
      test "#{test_case["id"]} - #{title}" do
        a = "#{test_case["a"]["wkt"]}" |> Geo.WKT.decode!
        b = "#{test_case["b"]["wkt"]}" |> Geo.WKT.decode!

        #{build_assertions(test_case)}
      end

      #{tag_str}
      test "#{test_case["id"]} - #{title} (float)" do
        a = "#{test_case["a"]["wkt"] |> convert_to_float()}" |> Geo.WKT.decode!
        b = "#{test_case["b"]["wkt"] |> convert_to_float()}" |> Geo.WKT.decode!

        #{build_assertions(test_case)}
      end
    """
  end

  defp build_assertions(test_case) do
    build_symetric_assertion(test_case, "intersects") <>
      build_symetric_assertion(test_case, "disjoint") <>
      build_asymetric_assertion(test_case, "contains") <>
      build_asymetric_assertion(test_case, "within") <>
      build_symetric_assertion(test_case, "equals")
  end

  defp build_asymetric_assertion(test_case, relationship) do
    ~s"""
        assert Topo.#{relationship}?(a, b) == #{test_case["relationship"][relationship]}
    """
  end

  defp build_symetric_assertion(test_case, relationship) do
    ~s"""
        assert Topo.#{relationship}?(a, b) == #{test_case["relationship"][relationship]}
        assert Topo.#{relationship}?(b, a) == #{test_case["relationship"][relationship]}
    """
  end

  defp convert_to_float(wkt) when is_binary(wkt) do
    geometry = Geo.WKT.decode!(wkt)
    Geo.WKT.encode!(%{geometry | coordinates: convert_to_float(geometry.coordinates)})
  end

  defp convert_to_float([value]), do: [convert_to_float(value)]
  defp convert_to_float([value | rest]), do: [convert_to_float(value)] ++ convert_to_float(rest)
  defp convert_to_float({a, b}), do: {a * 1.0, b * 1.0}
end
