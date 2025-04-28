defmodule Hol.MixProject do
  use Mix.Project

  def project do
    [
      app: :hol,
      version: "1.0.0",
      elixir: "~> 1.17.3",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Benchmarking
      {:benchee, "~> 1.0", only: :dev},
      # Code Analyzer
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      # Code Analyzer
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      # Documentation
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end
end
