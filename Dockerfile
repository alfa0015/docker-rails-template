FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
COPY ["Gemfile", "Gemfile.lock", "/usr/src/"]
WORKDIR /usr/src
RUN bundle install
COPY [".", "/usr/src/"]
EXPOSE 3000
CMD ["bundle", "exec", "puma"]