FROM ruby:3.0.1

# リポジトリを更新し依存モジュールをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
    nodejs

RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN set -x && apt-get update -y -qq && apt-get install -yq nodejs yarn

# ルート直下にl-store-appという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
RUN mkdir /l-store-app
WORKDIR /l-store-app

# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD Gemfile /l-store-app/Gemfile
ADD Gemfile.lock /l-store-app/Gemfile.lock

# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . /l-store-app

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets