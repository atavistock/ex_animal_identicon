defmodule ExAnimalIdenticonTest do
  use ExUnit.Case

  test "generates an svg" do
    {:ok, icon} = ExAnimalIdenticon.svg(1)
    assert String.contains?(icon, "</svg>")
  end

  test "has a background color" do
    {:ok, icon} = ExAnimalIdenticon.svg(1)
    assert String.match?(icon, ~r<background-color: #[0-9a-f]{6}>)
  end

  test "has an animal link" do
    {:ok, icon} = ExAnimalIdenticon.svg(1)
    assert String.match?(icon, ~r<profile/\w{3,}_lg.png>)
  end

  test "supports any term" do
    {:ok, icon} = ExAnimalIdenticon.svg(:foo)
    assert String.contains?(icon, "</svg>")
    {:ok, icon} = ExAnimalIdenticon.svg(%{})
    assert String.contains?(icon, "</svg>")
  end

  test "is different for different terms" do
    {:ok, icon1} = ExAnimalIdenticon.svg(1)
    {:ok, icon2} = ExAnimalIdenticon.svg(2)
    assert icon1 != icon2
  end

  test "is the same for the same term" do
    {:ok, icon1} = ExAnimalIdenticon.svg("foo")
    {:ok, icon2} = ExAnimalIdenticon.svg("foo")
    assert icon1 == icon2
  end

  test "supports a size option" do
    {:ok, icon} = ExAnimalIdenticon.svg("blah", size: 48)
    assert String.contains?(icon, "width: 48px")
  end

  test "supports a circle option" do
    {:ok, icon} = ExAnimalIdenticon.svg("blah", type: :circle)
    assert String.contains?(icon, "border-radius: 50%")
  end
end
