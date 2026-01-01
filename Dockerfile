FROM ruby:3.1

# Install nodejs and build tools for Jekyll dependencies (like Sass)
RUN apt-get update -qq && apt-get install -y \
  build-essential libpq-dev nodejs

# Set working directory
WORKDIR /home/app

# Install gems
COPY Gemfile* ./
RUN bundle install

# Copy the rest of the site
COPY . .

# Expose port for Jekyll server
EXPOSE 4000

# Serve the site
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload"]
