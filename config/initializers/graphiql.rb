GraphiQL::Rails.config.header_editor_enabled = true

# config/initializers/graphiql.rb
if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = -> (context) { "Bearer #{context.cookies['_graphql_token']}" }
end

