defmodule Byzantin.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Byzantin.Repo, []),
      supervisor(Byzantin.Web.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: Byzantin.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
