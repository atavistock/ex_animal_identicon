# ExAnimalIdenticon

Reproduction of Animal Identicon done in Elixir

Simple user icons in 4096 patterns (64 animals and 64 colors).

Calls to `create(term)` are deterministic and will always return the same values for the same input.  Results come back as a struct with svg and name keys.

Usage examples
```
  identicon = ExAnimalIdenticon.create(id)
  identicon.svg # "<svg ...>"
  identicon.name # "Neon Pink Monkey"
```

## Installation

```elixir
def deps do
  [
    {:ex_animal_identicon, "~> 0.1.5", github: "atavistock/ex_animal_identicon"}
  ]
end
```

After running `mix deps.get` you will want to copy the images to your project by running `mix animal_identicons.image_clone`

