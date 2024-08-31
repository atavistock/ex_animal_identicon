defmodule ExAnimalIdenticon.Component do
  use Phoenix.Component

  attr :id, :any, required: true
  def full_avatar(assigns) do
    assigns = assign(assigns, :identicon, ExAnimalIdenticon.create(id))
    ~H"""
    <div class="rounded bg-base-100 w-48 flex flex-row p-1">
      <.icon {assigns} />
      <div class="self-center pl-1 text-base-content text-xs"><%= @@identicon.name %></div>
    </div>
    """
  end

  attr :id, :any, required: true
  def icon(assigns) do
    assigns = assign_new(assigns, :identicon, ExAnimalIdenticon.create(id))
    ~H"""
    <div alt={@player.name} class="border-base-content"><%= {:safe, @player.identicon.svg} %></div>
    """
  end
end
