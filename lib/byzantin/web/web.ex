defmodule Byzantin.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use Byzantin.Web, :controller
      use Byzantin.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: Byzantin.Web
      import Plug.Conn
      import Byzantin.Web.Router.Helpers
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/byzantin/web/templates",
                        namespace: Byzantin.Web

      import Phoenix.Controller, only: [view_module: 1]

      import Byzantin.Web.Router.Helpers
      import Byzantin.Web.ErrorHelpers
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
