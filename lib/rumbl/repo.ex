defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl
  @moduledoc """
  In memory repository
  """
  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "José", username: "joseviala", password: "elixir"},
      %Rumbl.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
      %Rumbl.User{id: "3", name: "Chris", username: "chrismccard", password: "phx"}
    ]
  end

  def get(module, id) do
    Enum.find all(module), fn u -> u.id==id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn(k, v) -> Map.get(map, k)==v end)
    end
  end
end
