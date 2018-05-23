FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /dockerized-akteam
COPY . .
RUN bundle install
RUN rails db:migrate 
ENTRYPOINT ["rails"]
CMD ["server"]