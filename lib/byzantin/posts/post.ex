defmodule Byzantin.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Byzantin.Posts.Post


  schema "posts_posts" do
    field :body, :string
    field :title, :string
    field :published, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body, :published])
    |> validate_required([:title, :body])
    |> validate_length(:title, max: 50)
  end
end
