defmodule ExAnimalIdenticon do
  @moduledoc """
    Generate an Identicon based on a key which use an animal image with a
    background color
  """

  @animals ~w(
    alligator anteater armadillo auroch badger bat beaver buffalo camel capybara
    chameleon cheetah chinchilla chipmunk chupacabra cormorant coyote crow dingo
    dolphin duck elephant ferret fox giraffe gopher grizzly hippo hyena ibex
    iguana jackal kangaroo koala kraken lemur leopard liger llama manatee
    mink monkey moose narwhal orangutan otter panda penguin platypus python
    quagga rabbit raccoon rhino sheep shrew skunk squirrel tiger turtle
    walrus wolf wolverine wombat
  )

  @colors %{
    "#FF0000" => "Red",
    "#FFA500" => "Orange",
    "#FFFF00" => "Yellow",
    "#FFC0CB" => "Pink",
    "#ADD8E6" => "Light Blue",
    "#0000FF" => "Blue",
    "#00FFFF" => "Cyan",
    "#008000" => "Green",
    "#00008B" => "Dark Blue",
    "#800080" => "Purple",
    "#7FFFD4" => "Aquamarine",
    "#FF00FF" => "Magenta",
    "#00FF00" => "Lime",
    "#800000" => "Maroon",
    "#93917C" => "Millennium Jade",
    "#FFCE44" => "Chrome Gold",
    "#4863A0" => "Azure Blue",
    "#660000" => "Red Blood",
    "#A52A2A" => "Brown",
    "#966F33" => "Wood",
    "#728FCE" => "Light Purple Blue",
    "#22CE83" => "Isle Of Man Green",
    "#1589FF" => "Neon Blue",
    "#FBE7A1" => "Golden Blonde",
    "#FFFF33" => "Neon Yellow",
    "#36013F" => "Deep Purple",
    "#95B9C7" => "Baby Blue",
    "#87CEEB" => "SkyBlue",
    "#2B65EC" => "Ocean Blue",
    "#FFD700" => "Gold",
    "#006400" => "Dark Green",
    "#368BC1" => "Glacial Blue Ice",
    "#151B54" => "Night Blue",
    "#EB5406" => "Red Gold",
    "#1E90FF" => "Dodger Blue",
    "#0041C2" => "Blueberry Blue",
    "#357EC7" => "Windows Blue",
    "#E799A3" => "Pink Daisy",
    "#583759" => "Plum Purple",
    "#F98B88" => "Peach Pink",
    "#F535AA" => "Neon Pink",
    "#90EE90" => "Light Green",
    "#254117" => "Dark Forest Green",
    "#835C3B" => "Brown Bear",
    "#AA6C39" => "Dark Gold",
    "#E42217" => "Lava Red",
    "#EE82EE" => "Violet",
    "#C48189" => "Pink Brown",
    "#6F4E37" => "Coffee",
    "#FDD7E4" => "Pinky",
    "#E8ADAA" => "Rose",
    "#000080" => "Navy",
    "#848B79" => "Sage Green",
    "#14A3C7" => "Cyan Blue",
    "#9D00FF" => "Neon Purple",
    "#4B0082" => "Indigo",
    "#FDD017" => "Bright Gold",
    "#2F539B" => "Bright Blue",
    "#FDBD01" => "Neon Gold",
    "#0000A0" => "New Midnight Blue",
    "#C19A6B" => "Camel Brown",
    "#FFDB58" => "Mustard Yellow",
    "#85BB65" => "Dollar Bill Green",
    "#6495ED" => "Cornflower Blue"
  }

  @spec generate(any(), Keyword.t()) :: {nonempty_binary, nonempty_binary}
  @spec generate(any()) :: {nonempty_binary(), nonempty_binary()}
  def generate(term, opts \\ []) do
    {animal, color} = identicon_from_term(term)
    {svg(animal, color, opts), name(animal, color)}
  end


  @spec svg(binary, binary, Keyword.t()) :: nonempty_binary()
  defp svg(animal, color, opts) do
    radius = if(opts[:type] == :circle, do: "border-radius: 50%;", else: nil)
    size = opts[:size] || 128
    dimensions = "height: #{size}px; width: #{size}px"
    url = "https://ssl.gstatic.com/docs/common/profile/#{animal}_lg.png"

    """
      <svg style="background-color: #{color}; #{dimensions}; #{radius}">
        <image xlink:href="#{url}" style="#{dimensions}:></image>
      </svg>
    """
    |> String.replace(~r/\s+/, " ")
  end

  @spec name(binary, binary) :: nonempty_binary()
  defp name(animal, color) do
    animal_name = animal |> String.capitalize()
    "#{Map.get(@colors, color)} #{animal_name}"
  end

  @spec identicon_from_term(any) :: {binary, binary}
  defp identicon_from_term(term) do
    <<
      _::size(48),
      animal_id::size(6),
      color_id::size(6),
      _::bitstring
    >> = :erlang.term_to_binary(term) |> then(&:crypto.hash(:blake2b, &1))

    animal = Enum.at(@animals, animal_id)
    color = Map.keys(@colors) |> Enum.at(color_id)
    {animal, color}
  end
end
