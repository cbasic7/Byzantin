defmodule Byzantin.PostsTest do
  use Byzantin.DataCase

  alias Byzantin.Posts

  describe "posts" do
    alias Byzantin.Posts.Post

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title", published: true}
    @invalid_attrs %{body: nil, title: nil}
    @title_too_long_attrs %{body: "some body", title: "aabcdefghijklmnopqrstuvwxyzabcdeofg\
      hijklmnopqrstuvwxyzbcdefghijklmnopqrstuvwxyz"}

    setup do
      post = insert(:post)
      {:ok, post: post}
    end

    test "list_posts/0 returns all posts", %{post: post} do
      assert Posts.list_posts() == [post]
    end

    test "list_post/1 returns published posts" do
      published_post = insert(:post, published: true)
      assert Posts.list_posts(:published) == [published_post]
    end

    test "list_post/1 returns unpublished posts", %{post: post} do
      insert(:post, published: true)
      assert Posts.list_posts(:unpublished) == [post]
    end

    test "get_post!/1 returns the post with given id", %{post: post} do
      assert Posts.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Posts.create_post(@valid_attrs)
      assert post.body == "some body"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@title_too_long_attrs)
    end

    test "update_post/2 with valid data updates the post", %{post: post} do
      assert {:ok, post} = Posts.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.body == "some updated body"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset", %{post: post} do
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, @invalid_attrs)
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post", %{post: post} do
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset", %{post: post} do
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end
end
