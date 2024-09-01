defmodule ExAnimalIdenticon.Component do
  use Phoenix.Component

  attr :id, :any, required: true
  attr :container_class, :string
  attr :name_class, :string
  attr :icon_class, :string
  attr :name, :string, default: nil
  def avatar(assigns) do
    assigns =
      assigns
      |> assign_new(:identicon, fn -> create_identicon(assigns) end)
      |> assign_new(:container_class, fn -> "rounded bg-base-100 w-48 flex flex-row p-1" end)
      |> assign_new(:name_class, fn -> "self-center pl-1 text-base-content text-xs" end)
    ~H"""
    <div class={@container_class}>
      <.icon {assigns} />
      <div class={@name_class}><%= @name | @identicon.name %></div>
    </div>
    """
  end

  attr :id, :any, required: true
  attr :icon_class, :string
  def icon(assigns) do
    assigns =
      assigns
      |> assign_new(:identicon, fn -> create_identicon(assigns) end)
      |> assign_new(:icon_class, fn -> "border-base-content" end)
    ~H"""
    <div alt={@identicon.name} class={@icon_class}><%= {:safe, @identicon.svg} %></div>
    """
  end

  defp create_identicon(%{id: id}), do: ExAnimalIdenticon.create(id)

end
