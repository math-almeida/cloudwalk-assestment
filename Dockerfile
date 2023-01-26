FROM ruby:3.1.0

RUN apt-get update -qq && apt-get install -y libpq-dev
WORKDIR /cloudwalk-assestment
COPY Gemfile /cloudwalk-assestment/Gemfile
COPY Gemfile.lock /cloudwalk-assestment/Gemfile.lock
RUN gem install bundler -v '2.2.27'
RUN bundle install
EXPOSE 3000
COPY . /cloudwalk-assestment

CMD ["rails", "server", "-b", "0.0.0.0"]
