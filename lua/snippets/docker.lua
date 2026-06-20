local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local docker_snippets = {
  -- Basic Dockerfile
  s("dockerfile", {
    t({
      "FROM ubuntu:22.04",
      "",
      "WORKDIR /app",
      "",
      "COPY . .",
      "",
      "RUN apt-get update && apt-get install -y \\",
      "    ",
      i(1, "package1 package2"),
      "",
      "EXPOSE ",
      i(2, "8080"),
      "",
      "CMD [\"",
      i(3, "python app.py"),
      "\"]",
    }),
  }),

  -- Multi-stage Dockerfile
  s("dockerfile_multi", {
    t({
      "# Build stage",
      "FROM golang:1.21-alpine AS builder",
      "",
      "WORKDIR /build",
      "COPY . .",
      "RUN go build -o app .",
      "",
      "# Final stage",
      "FROM alpine:latest",
      "",
      "WORKDIR /app",
      "COPY --from=builder /build/app .",
      "",
      "EXPOSE ",
      i(1, "8080"),
      "",
      "CMD [\"./app\"]",
    }),
  }),

  -- Dockerfile with Python
  s("dockerfile_py", {
    t({
      "FROM python:3.11-slim",
      "",
      "WORKDIR /app",
      "",
      "COPY requirements.txt .",
      "RUN pip install --no-cache-dir -r requirements.txt",
      "",
      "COPY . .",
      "",
      "EXPOSE ",
      i(1, "5000"),
      "",
      "CMD [\"python\", \"",
      i(2, "app.py"),
      "\"]",
    }),
  }),

  -- Docker Compose
  s("docker_compose", {
    t({
      "version: '3.8'",
      "",
      "services:",
      "  ",
      i(1, "app"),
      ":",
      "    build: .",
      "    ports:",
      "      - \"",
      i(2, "8080"),
      ":8080\"",
      "    environment:",
      "      - DEBUG=",
      i(3, "true"),
      "    volumes:",
      "      - ./:/app",
      "",
      "  ",
      i(4, "db"),
      ":",
      "    image: postgres:15",
      "    environment:",
      "      POSTGRES_PASSWORD: ",
      i(5, "secret"),
      "    ports:",
      "      - \"5432:5432\"",
    }),
  }),

  -- Docker RUN command
  s("run", {
    t("RUN "),
    i(1, "apt-get install -y package"),
  }),

  -- Docker ENV variables
  s("env", {
    t("ENV "),
    i(1, "VAR_NAME"),
    t("="),
    i(2, "value"),
  }),
}

ls.add_snippets("dockerfile", docker_snippets)
