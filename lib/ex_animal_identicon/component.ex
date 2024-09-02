defmodule ExAnimalIdenticon.Component do
  use Phoenix.Component

  attr :id, :any, required: true
  attr :name, :string, default: nil
  attr :name_class, :string, default: nil
  attr :icon_class, :string, default: nil
  attr :icon_size, :integer, default: 128

  def avatar(assigns) do
    assigns = assign_new(assigns, :identicon, fn -> create_identicon(assigns) end)
    ~H"""
    <div class="flex flex-row">
      <.icon {assigns} />
      <div class={@name_class}><%= @name || @identicon.name %></div>
    </div>
    """
  end

  attr :id, :any, required: true
  attr :icon_class, :string, default: nil
  attr :icon_size, :integer, default: 128

  def icon(assigns) do
    assigns = assign_new(assigns, :identicon, fn -> create_identicon(assigns) end)
    ~H"""
    <div alt={@identicon.name} class={@icon_class}><%= {:safe, @identicon.svg} %></div>
    """
  end

  defp create_identicon(%{id: id, icon_size: size}) do
    ExAnimalIdenticon.create(id, size: size)
  end

end
