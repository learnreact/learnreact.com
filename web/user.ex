defmodule User do
  def is_chan(user) do
    user && user.github_id == 658360
  end
end
