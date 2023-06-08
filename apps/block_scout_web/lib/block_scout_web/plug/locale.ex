defmodule BlockScoutWeb.Plug.Locale do
  import Plug.Conn

  def init(default_locale), do: default_locale

  def call(%Plug.Conn{params: %{"locale" => locale}} = conn, _opts) do

  end
end
