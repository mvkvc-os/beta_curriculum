defmodule Games.MixProject do
  use Mix.Project

  def project do
    [
      app: :games,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      escript: [main_module: Games.CLI],
      aliases: aliases()
    ]
  end

  defp docs do
    [
      # The main page in the doc
      main: "readme",
      extras: ["README.md"]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      docs: ["docs --formatter html"]
    ]
  end
end
