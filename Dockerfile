FROM ruby:2.7.0-slim-buster


ENV RAILS_ENV=development \
    RAILS_LOG_TO_STDOUT=true \
    RAILS_SERVE_STATIC_FILES=true

RUN apt-get update -qq && apt-get install -y \
  nodejs \
  postgresql-client \
  build-essential \
  libpq-dev


WORKDIR /app


COPY Gemfile Gemfile.lock ./
RUN bundle install


COPY . .

#RUN service postgresql start && \
#    psql --command "CREATE USER ecommerce_protein_user WITH SUPERUSER PASSWORD 'pass159000';" && \
#    createdb -O ecommerce_protein_user ecommerce_protein_development

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
