# a cheap nock-off
# http://apidock.com/rails/ActiveSupport/Inflector/parameterize
defmodule LearnReact.Inflectors do
  @moduledoc false

  def parameterize(word) do
    Regex.replace(~r/[^a-zA-Z0-9\-_]+/, word, "-")
    |> String.replace(~r/\-{2,}/, "-")
    |> String.downcase
  end
end
