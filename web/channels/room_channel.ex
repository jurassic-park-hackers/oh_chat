defmodule OhChat.RoomChannel do
  use Phoenix.Channel
  alias OhChat.Repo
  alias OhChat.User

  def join("room", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("message:new", payload, socket) do
    user = Repo.get(User, socket.assigns.user_id)
    broadcast! socket, "message:new", %{
      user: user.name,
      message: payload["message"]
    }
    {:noreply, socket}
  end
end
