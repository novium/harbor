FROM elixir:1.8
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y inotify-tools

WORKDIR /usr/harbor/assets
COPY ./assets/package.json ./package.json
COPY ./deps/phoenix/package.json ../deps/phoenix/package.json
COPY ./deps/phoenix_html/package.json ../deps/phoenix_html/package.json
RUN npm install

WORKDIR /usr/harbor
COPY ./mix.exs ./mix.exs
RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix hex.info
RUN mix deps.get