defmodule OssSwipe.EndUserController do
  use OssSwipe.Web, :controller

  alias OssSwipe.EndUser

  def index(conn, _params) do
    end_users = Repo.all(EndUser)
    render(conn, "index.html", end_users: end_users)
  end

  def new(conn, _params) do
    changeset = EndUser.changeset(%EndUser{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"end_user" => user_params}) do
    changeset = EndUser.changeset(%EndUser{}, user_params)

    case Repo.insert(changeset) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "EndUser created successfully.")
        |> redirect(to: end_user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    end_user = Repo.get!(EndUser, id)
    render(conn, "show.html", end_user: end_user)
  end

  def edit(conn, %{"id" => id}) do
    end_user = Repo.get!(EndUser, id)
    changeset = EndUser.changeset(end_user)
    render(conn, "edit.html", end_user: end_user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "end_user" => user_params}) do
    end_user = Repo.get!(EndUser, id)
    changeset = EndUser.changeset(end_user, user_params)

    case Repo.update(changeset) do
      {:ok, end_user} ->
        conn
        |> put_flash(:info, "EndUser updated successfully.")
        |> redirect(to: end_user_path(conn, :show, end_user))
      {:error, changeset} ->
        render(conn, "edit.html", end_user: end_user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    end_user = Repo.get!(EndUser, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(end_user)

    conn
    |> put_flash(:info, "EndUser deleted successfully.")
    |> redirect(to: end_user_path(conn, :index))
  end
end
