defmodule ExAnimalIdenticon do
  @moduledoc """
    Generate an Identicon based on a key which use an animal image with a
    background color
  """

  @type t :: %__MODULE__{}

  defstruct [:name, :svg]

  alias ExAnimalIdenticon.Animal
  alias ExAnimalIdenticon.Color

  @spec create(any(), Keyword.t()) :: t()
  @spec create(any()) :: t()
  def create(term, opts \\ []) do
    {animal_id, color_id} = identicon_from_term(term)

    animal = Animal.get(animal_id)
    color = Color.get(color_id)

    %__MODULE__{
      name: "#{color.name} #{animal.name}",
      svg: build_svg(animal, color, opts),
    }
  end

  @spec build_svg(Animal.t(), Color.t(), Keywords.t()) :: t()
  defp build_svg(animal, color, opts) do
    rounded = if(opts[:type] == :circle, do: "border-radius: 9999px;", else: "")
    size = opts[:size] || 96
    url = Animal.image_path(animal)

    """
      <svg viewBox="0 0 128 128" style="height:#{size}px; width:#{size}px; background-color: #{color.value}; #{rounded}">
        <image href="/#{url}" height="128px" width="128px" style="filter: drop-shadow(1px 1px 1px #000);"></image>
      </svg>
    """
    |> String.replace(~r/\s+/, " ")
  end

  @spec identicon_from_term(any) :: {binary, binary}
  defp identicon_from_term(term) do
    <<
      _::size(48),
      animal_id::size(6),
      color_id::size(6),
      _::bitstring
    >> = :erlang.term_to_binary(term) |> then(&:crypto.hash(:blake2b, &1))

    {animal_id, color_id}
  end
end
