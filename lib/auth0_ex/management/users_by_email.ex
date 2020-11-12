defmodule Auth0Ex.Management.UsersByEmail do
  @moduledoc """
  A module representing users on Auth0
  """

  use Auth0Ex.Api, for: :mgmt
  @path "users-by-email"


  @doc """
  Gets a list of users that match the given email address

      iex> Auth0Ex.Management.UsersByEmail.get(%{email: "example@email.com", fields: "user_id,email,last_login", include_fields: true})
  """
  def search(params) when is_map(params) do
    do_get("#{@path}", params)
  end

  @doc false
  defp default_params do
    case Application.get_env(:auth0_ex, :v2_search) do
      true ->
        %{}

      _ ->
        %{search_engine: "v3"}
    end
  end
end
