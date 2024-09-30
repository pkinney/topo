defmodule Topo.Mixfile do
  use Mix.Project

  def project do
    [
      app: :topo,
      version: "1.0.2",
      elixir: "~> 1.12",
      description: description(),
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      dialyzer: [plt_add_apps: [:poison, :mix]],
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [applications: [:logger, :geo, :seg_seg, :vector]]
  end

  defp deps do
    [
      {:geo, "~> 3.1 or ~> 4.0"},
      {:seg_seg, "~> 1.0"},
      {:vector, "~> 1.0"},
      {:poison, "~> 5.0", only: [:test, :dev]},
      {:benchfella, "~> 0.3.0", only: :dev},
      {:excoveralls, "~> 0.8", only: :test},
      {:envelope, "~> 1.0", only: :dev},
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.19", only: :dev},
      {:credo, "~> 1.6", only: [:dev], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false}
    ]
  end

  defp description do
    """
    Geometry library for determining spatial relationships between geometries
    """
  end

  defp package do
    [
      files: ["lib/topo.ex", "lib/topo", "mix.exs", "README*"],
      maintainers: ["Powell Kinney"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/pkinney/topo"}
    ]
  end

  defp aliases do
    [
      validate: [
        "clean",
        "compile --warnings-as-error",
        "format --check-formatted",
        "credo",
        "dialyzer"
      ]
    ]
  end
end
