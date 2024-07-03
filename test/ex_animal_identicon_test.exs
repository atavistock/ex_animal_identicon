defmodule ExAnimalIdenticonTest do
  use ExUnit.Case

  test "generates an svg" do
    {:ok, result} = ExAnimalIdenticon.generate(1)
    svg = Map.get(result, :svg)
    assert String.contains?(svg, "</svg>")
  end

  test "has a background color" do
    {:ok, result} = ExAnimalIdenticon.generate(1)
    svg = Map.get(result, :svg)
    assert String.match?(svg, ~r<background-color: #[0-9a-f]{6}>)
  end

  test "has an animal link" do
    {:ok, result} = ExAnimalIdenticon.generate(1)
    svg = Map.get(result, :svg)
    assert String.match?(svg, ~r<profile/\w{3,}_lg.png>)
  end

  test "can generate a name" do
    {:ok, result} = ExAnimalIdenticon.generate(1)
    name = Map.get(result, :name)
    assert String.length(name) > 5
  end

  test "supports any term" do
    {:ok, result} = ExAnimalIdenticon.generate(:foo)
    svg = Map.get(result, :svg)
    assert String.contains?(svg, "</svg>")

    {:ok, result} = ExAnimalIdenticon.generate(%{})
    svg = Map.get(result, :svg)
    assert String.contains?(svg, "</svg>")
  end

  test "is different for different terms" do
    {:ok, result1} = ExAnimalIdenticon.generate(1)
    {:ok, result2} = ExAnimalIdenticon.generate(2)
    assert result1 != result2
  end

  test "is the same for the same term" do
    {:ok, result1} = ExAnimalIdenticon.generate("foo")
    {:ok, result2} = ExAnimalIdenticon.generate("foo")
    assert result1 == result2
  end

  test "svg supports a size option" do
    {:ok, result} = ExAnimalIdenticon.generate("blah", size: 48)
    svg = Map.get(result, :svg)
    assert String.contains?(svg, "width: 48px")
  end

  test "svg supports a circle option" do
    {:ok, result} = ExAnimalIdenticon.generate("blah", type: :circle)
    svg = Map.get(result, :svg)
    assert String.contains?(svg, "border-radius: 50%")
  end
end
