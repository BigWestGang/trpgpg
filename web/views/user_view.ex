defmodule Trpg.UserView do
  use Trpg.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Trpg.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Trpg.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      twitter_id: user.twitter_id,
      avator: user.avator}
  end
end
