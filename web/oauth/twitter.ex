defmodule Twitter do

  def authorize_url(token) do
    ExTwitter.authenticate_url(token.oauth_token)
  end

  def get_token! do
    ExTwitter.request_token("http://localhost:4000/auth/callback")
  end

  def get_access_token(oauth_verifier, oauth_token) do
    ExTwitter.access_token(oauth_verifier, oauth_token)
  end

  def get_user(user_id, screen_name) do
    ExTwitter.user(user_id, screen_name)
  end

end