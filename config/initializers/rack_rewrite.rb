Rails.application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
  r301      '/courses/2014-getting-started',   '/courses/2014-react-basics'
end