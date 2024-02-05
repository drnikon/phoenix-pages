defmodule PhoenixPages.MixProject do
  use Mix.Project

  @url "https://github.com/jsonmaur/phoenix-pages"

  def project do
    [
      app: :phoenix_pages,
      version: "0.1.1",
      elixir: "~> 1.13",
      elixirc_paths: Mix.env() |> elixirc_paths(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      source_url: @url,
      homepage_url: "#{@url}#readme",
      description: "Blogs, docs, and static pages in Phoenix",
      package: [
        licenses: ["MIT"],
        links: %{"GitHub" => @url},
        files: ~w(css lib .formatter.exs CHANGELOG.md LICENSE mix.exs README.md)
      ],
      docs: [
        main: "readme",
        extras: ["README.md"],
        authors: ["Jason Maurer"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:earmark, "~> 1.4"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:makeup, "~> 1.0"},
      {:makeup_eex, "~> 0.1", only: :dev},
      {:makeup_js, "~> 0.1", only: :dev},
      {:makeup_json, "~> 0.1", only: [:dev, :test]},
      {:phoenix, "~> 1.6"},
      {:phoenix_html, "~> 4.0"},
      {:yaml_elixir, "~> 2.9"}
    ]
  end

  defp aliases do
    [
      test: [
        "format --check-formatted",
        "deps.unlock --check-unused",
        "compile --warnings-as-errors",
        "test"
      ]
    ]
  end
end
