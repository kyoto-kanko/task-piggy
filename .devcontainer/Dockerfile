FROM ruby:3.3.0
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs
WORKDIR /workspace
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
# dev containerではrootユーザーでの操作はアンチパターンなので、developerユーザーを作成して以降の操作をdeveloperユーザーで行う
RUN groupadd -r developer && useradd --no-log-init -r -g developer developer
RUN chown -R developer:developer /workspace
USER developer
