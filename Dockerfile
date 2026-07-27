FROM alpine/git AS upstream

WORKDIR /src

RUN git clone https://github.com/DEEIX-AI/DEEIX-Chat.git .

FROM ghcr.io/deeix-ai/deeix-chat

COPY --from=upstream /src/config.sqlite.example.yaml /app/config.yaml

RUN mkdir -p /app/storage

RUN mkdir -p /app/data
