FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential

# Add app files into docker image
RUN mkdir -p /app
WORKDIR /app
COPY . /app

# Add bundle entry point to handle bundle cache
COPY ./scripts/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Bundle installs with binstubs to our custom /bundle/bin volume path. Let system use those stubs.
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
