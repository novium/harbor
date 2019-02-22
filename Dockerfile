FROM elixir:1.8
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y inotify-tools

WORKDIR /usr/harbor
COPY ./mix.exs ./mix.exs
RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix hex.info \
    && mix archive.install --force hex phx_new 1.4.1

WORKDIR /usr/harbor