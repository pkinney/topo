defmodule Topo.Mixfile do
  use Mix.Project

  def project do
    [app: :topo,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:geo, "~> 1.0"},
      {:seg_seg, "~> 0.0.0"},
      {:vector, "~> 0.2.0"},
      {:poison, "~> 2.0", only: [:test, :dev]},
      {:benchfella, "~> 0.3.0", only: :dev},
      {:excoveralls, "~> 0.4", only: :test},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end
end
