defmodule Mix.Tasks.CopyImages do
  @shortdoc "Copy the images referenced by README.md, since ex_doc doesn't do this."
  use Mix.Task
  def run(_) do
    File.cp_r "assets", "doc/assets"
  end
end

defmodule ElixirAle.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_ale,
     version: "0.5.2",
     elixir: "~> 1.2",
     name: "elixir_ale",
     description: description,
     package: package,
     source_url: "https://github.com/fhunleth/elixir_ale",
     compilers: [:elixir_make] ++ Mix.compilers,
     make_clean: ["clean"],
     docs: [extras: ["README.md"]],
     aliases: ["docs": ["docs", "copy_images"]],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application, do: []

  defp description do
    """
    Elixir access to hardware I/O interfaces such as GPIO, I2C, and SPI.
    """
  end

  defp package do
    %{files: ["lib", "src/*.[ch]", "mix.exs", "README.md", "LICENSE", "Makefile"],
      maintainers: ["Frank Hunleth"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/fhunleth/elixir_ale"}}
  end

  defp deps do
    [
      {:elixir_make, "~> 0.1"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:credo, "~> 0.3", only: [:dev, :test]}
    ]
  end
end
