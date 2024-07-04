# ExAnimalIdenticon

Reproduction of Animal Identicon done in Elixir

Simple user icons in 4096 patterns (64 animals and 64 colors).  Results come back as a tuple with the svg content as the first part and the name `"#{color} #{animal}"` as the second part.

Usage examples
```
  {"<svg ...>", "Red Moose"} = ExAnimalIdenticon.generate(id)
  {"<svg ...>", "Neon Pink Monkey"} = ExAnimalIdenticon.generate(user.name)
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

