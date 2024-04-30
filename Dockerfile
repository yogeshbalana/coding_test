# ruby-version
FROM ruby:2.7

# Set the working directory in the container
WORKDIR /template-app

# copy Gemfile from template-app to add dependency
COPY template-app/Gemfile* ./

# Install dependencies using Bundler
RUN bundle install

# Copy the rest of your application code to the container
COPY template-app/ .

# Specify the command to run your application
CMD ["bundle", "exec", "ruby", "questionnaire.rb"]


