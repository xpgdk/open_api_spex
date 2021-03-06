defmodule OpenApiSpexTest.UserControllerAnnotated do
  @moduledoc tags: ["User"]

  use OpenApiSpex.Controller
  alias OpenApiSpex.Header
  alias OpenApiSpexTest.Schemas.{NotFound, Unauthorized, User}

  @doc """
  Update a user

  Full description for this endpoint...
  """
  @doc parameters: [
         id: [in: :path, type: :string, required: true]
       ]
  @doc request_body: {"Request body to update a User", "application/json", User, required: true}
  @doc responses: [
         ok: {
           "User response",
           "application/json",
           User,
           headers: %{"token" => %Header{description: "Access token"}}
         },
         unauthorized: Unauthorized.response(),
         not_found: NotFound.response()
       ]
  def update(_conn, _params), do: :ok

  @doc """
  Show a user

  Fuller description for this endpoint...
  """
  @doc operation_id: "show_user"
  @doc parameters: [
         id: [in: :path, type: :string, required: true]
       ]
  @doc responses: [
         ok: {"User response", "application/json", User}
       ]
  def show(_conn, _params), do: :ok
end
