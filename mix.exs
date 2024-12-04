defmodule ExAnimalIdenticon.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_animal_identicon,
      version: "0.2.2",
      elixir: "~> 1.16",
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
      {:phoenix_live_view, ">= 0.17"}
    ]
  end
end
