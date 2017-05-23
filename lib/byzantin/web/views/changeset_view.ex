defmodule Byzantin.Web.ChangesetView do
  use Byzantin.Web, :view

  def render("error.json", _) do
    %{errors: "An error occured."}
  end
end
