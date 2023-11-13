# Specify a base image
FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client netcat

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the main application
COPY . ./

# Copy the entrypoint script into the container at /usr/bin/
COPY entrypoint.sh /usr/bin/
# Modify permissions to execute the script
RUN chmod +x /usr/bin/entrypoint.sh

# Set the entrypoint to run the script
ENTRYPOINT ["entrypoint.sh"]

# Expose the port the server runs on
EXPOSE 3000

# Start the app
CMD ["rails", "server", "-b", "0.0.0.0"]
