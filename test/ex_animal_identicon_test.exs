defmodule ExAnimalIdenticonTest do
  use ExUnit.Case

  test "creates an svg" do
    identicon = ExAnimalIdenticon.create(1)
    assert String.contains?(identicon.svg, "</svg>")
  end

  test "has a background color" do
    identicon = ExAnimalIdenticon.create(1)
    assert String.match?(identicon.svg, ~r<background-color: #[0-9a-f]{6}>)
  end

  test "has an animal link" do
    identicon = ExAnimalIdenticon.create(1)
    assert String.match?(identicon.svg, ~r<profile/\w{3,}_lg.png>)
  end

  test "can create a name" do
    identicon = ExAnimalIdenticon.create(1)
    assert String.length(identicon.name) > 5
  end

  test "supports any term" do
    identicon = ExAnimalIdenticon.create(:foo)
    assert String.contains?(identicon.svg, "</svg>")

    identicon = ExAnimalIdenticon.create(%{foo: :bar})
    assert String.contains?(identicon.svg, "</svg>")
  end

  test "is different for different terms" do
    result1 = ExAnimalIdenticon.create(1)
    result2 = ExAnimalIdenticon.create(2)
    assert result1 != result2
  end

  test "is the same for the same term" do
    result1 = ExAnimalIdenticon.create("foo")
    result2 = ExAnimalIdenticon.create("foo")
    assert result1 == result2
  end

  test "svg supports a size option" do
    identicon = ExAnimalIdenticon.create("blah", size: 48)
    assert String.contains?(identicon.svg, "width: 48px;")
  end

  test "svg supports a circle option" do
    identicon = ExAnimalIdenticon.create("blah", type: :circle)
    assert String.contains?(identicon.svg, "border-radius: 50%;")
  end
end
