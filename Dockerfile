FROM elixir:1.7.3-alpine

WORKDIR "/opt/app"

RUN mix local.hex --force && mix local.rebar --force

COPY config/* config/
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

COPY . ./

CMD ["sh", "bin/start"]
