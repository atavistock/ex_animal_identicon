defmodule ExAnimalIdenticon.ComponentTest do
  use ExUnit.Case

  import Phoenix.LiveViewTest
  import ExAnimalIdenticon.Component

  test "icon" do
    icon = render_component(&icon/1, id: "user")
    assert String.contains?(icon, ~w[alt="Green Cheetah"])
    assert String.contains?(icon, ~w[background-color: #008000])
  end

  test "avatar" do
    avatar = render_component(&avatar/1, id: "user")
    assert String.contains?(avatar, ~w[alt="Green Cheetah"])
    assert String.contains?(avatar, ~w[>Green Cheetah</div>])
  end

end
