FROM ruby:2.7.2
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -qq -y build-essential nodejs yarn \
    libpq-dev \
    postgresql-client \
    vim \
    python3-pip
WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install --jobs 20 --retry 5
RUN yarn install --check-files
run rm -f /usr/src/tmp/pids/server.pid
COPY . .
