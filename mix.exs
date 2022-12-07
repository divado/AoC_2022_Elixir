defmodule AoC2022.MixProject do
  use Mix.Project

  def project do
    [
      app: :AoC2022,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {AoC2022, []},
      applications: [:httpoison],
      extra_applications: [:logger, :floki]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:httpoison, "~> 1.8"},
      {:floki, "~> 0.34.0"}
    ]
  end
end
