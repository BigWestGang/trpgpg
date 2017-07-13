defmodule Trpg.AuthController do
  use Trpg.Web, :controller

  def index(conn, _params) do
    token = Twitter.get_token!
    {:ok, authenticate_url} = Twitter.authorize_url(token)
    redirect conn, external: authenticate_url
  end

  def callback(conn, %{"oauth_token" => token, "oauth_verifier" => verifier}) do
    case Twitter.get_access_token(verifier, token) do
      {:ok, access_token} ->
        case Twitter.get_user(access_token.user_id, access_token.screen_name) do
          user_info ->
            user_params = createParams(user_info)
            result = save(user_params)
        end
      {:error, reason} ->
        result =
          case {:error, reason} do
            reason -> :id
          end
    end

    conn
      |> put_session(:id, result.id)
      |> redirect(to: "/")
  end

  def createParams(params) do
    %{
      name: params.screen_name,
      twitter_id: params.id,
      avator: params.profile_image_url_https
    }
  end

  def save(user_params) do
    case Repo.get_by(Trpg.User, user_params) do
      nil ->
        Repo.insert(Map.merge(%Trpg.User{}, user_params))
      user ->
        update_param = Repo.get!(Trpg.User, user.id)
        update_param = Ecto.Changeset.change(update_param, user_params)
        case Repo.update(update_param) do
          {:ok, struct} ->
            struct
          {:error, changeset} ->
            changeset
        end
    end
  end
end