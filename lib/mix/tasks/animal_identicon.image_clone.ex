defmodule Mix.Tasks.AnimalIdenticon.ImageClone do
  @moduledoc "Utilities for helping to manage word lists like the dictionary"
  @shortdoc "tools for managing word lists"

  use Mix.Task

  alias ExAnimalIdenticon.Animal

  @impl Mix.Task
  def run(_) do
    :ok = ensure_directory()

    Animal.list()
    |> Enum.each(fn animal ->
      url = Animal.remote_url(animal) |> String.to_charlist()
      image_file = Animal.image_file(animal)  |> String.to_charlist()
      :httpc.request(:get, {url, []}, [], [{:stream, image_file}])
    end)
  end

  @spec ensure_directory() :: :ok | {:error, atom()}
  defp ensure_directory do
    one_animal = Animal.list() |> List.first()
    image_path = Animal.image_file(one_animal)
    directory = Path.dirname(image_path)
    File.mkdir_p(directory)
  end
end
