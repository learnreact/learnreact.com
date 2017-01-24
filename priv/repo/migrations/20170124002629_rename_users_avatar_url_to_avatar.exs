defmodule LearnReact.Repo.Migrations.RenameUsersAvatarUrlToAvatar do
  use Ecto.Migration

  def change do
    rename table(:users), :avatar_url, to: :avatar
  end
end
