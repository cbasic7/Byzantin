defmodule Posts.Factory do
  use ExMachina.Ecto, repo: Byzantin.Repo

  def post_factory do
    %Byzantin.Posts.Post{
      title: "Example Title",
      body: "Example Body"
    }
  end
end
