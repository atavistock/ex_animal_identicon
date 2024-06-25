# ExAnimalIdenticon

Reproduction of Animal Identicon done in Elixir

Simple user icons in 4096 patterns (64 animals and 64 colors)

Usage examples
```
  {:ok, icon} = ExAnimalIdenticon.svg(id)
  {:ok, icon} = ExAnimalIdenticon.svg(user.name)
```

## Installation

```elixir
def deps do
  [
    {:ex_animal_identicon, "~> 0.1.0", github: "atavistock/ex_animal_identicon"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_animal_identicon>.

