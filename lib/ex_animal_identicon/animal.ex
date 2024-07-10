defmodule ExAnimalIdenticon.Animal do

  @type t :: %__MODULE__{}

  defstruct [:name, :value]

  @animals ~w(
    alligator anteater armadillo badger bat beaver buffalo camel capybara
    chameleon cheetah chinchilla chipmunk chupacabra cormorant coyote crow dingo
    dolphin duck elephant ferret fox giraffe gopher grizzly hedgehog hyena ibex
    iguana jackal kangaroo koala kraken lemur leopard liger llama manatee
    mink monkey moose narwhal orangutan otter panda penguin platypus python
    quagga rabbit raccoon rhino sheep shrew skunk squirrel tiger turtle
    unicorn walrus wolf wolverine wombat
  )

  @spec get(non_neg_integer) :: t()
  def get(idx) do
    value = Enum.at(@animals, idx)
    %__MODULE__{name: String.capitalize(value), value: value}
  end

  @spec list :: list(binary)
  def list do
    Enum.map(@animals, fn value ->
      %__MODULE__{name: String.capitalize(value), value: value}
    end)
  end

  @spec image_file(t()) :: nonempty_binary
  def image_file(animal) do
    [".", "priv", "static", image_path(animal)]
    |> Path.join()
    |> Path.expand()
  end

  @spec image_path(t()) :: nonempty_binary
  def image_path(animal) do
   ["images", "animal_identicons", "#{animal.value}_lg.png"]
   |> Path.join()
  end

  @spec remote_url(t()) :: nonempty_binary
  def remote_url(animal) do
    "http://gstatic.com/docs/common/profile/#{animal.value}_lg.png"
  end
end
