defmodule Byzantin.Repo.Migrations.AddPublishedToPostsPosts do
  use Ecto.Migration

  def change do
    alter table(:posts_posts) do
      add :published, :boolean, default: false
    end
  end
end
