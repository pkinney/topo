defmodule Topo.Mixfile do
  use Mix.Project

  def project do
    [app: :topo,
     version: "0.1.2",
     elixir: "~> 1.2",
     description: description(),
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     dialyzer: [plt_add_apps: [:poison, :mix]],
     deps: deps()]
  end

  def application do
    [applications: [:logger, :geo, :seg_seg, :vector]]
  end

  defp deps do
    [
      {:geo, "~> 2.0"},
      {:seg_seg, "~> 0.1.1"},
      {:vector, "~> 1.0"},
      {:poison, "~> 3.0", only: [:test, :dev]},
      {:benchfella, "~> 0.3.5", only: :dev},
      {:excoveralls, "~> 0.7.3", only: :test},
      {:envelope, "~> 1.0", only: :dev},
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.16.4", only: :dev},
      {:credo, "~> 0.8.6", only: [:dev, :test]},
      {:dialyxir, "~> 0.5.1", only: [:dev], runtime: false}
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
end
