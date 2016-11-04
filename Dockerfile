FROM ruby:2.3.1-alpine

MAINTAINER Carlos Andrés Oquendo <andres1905@gmail.com>

ENV PACT_MOCK_SERVICE "0.10.2"

RUN gem install pact-mock_service -v $PACT_MOCK_SERVICE && \
    ln -s /usr/local/lib/ruby/gems/2.3.0/pact-mock_service-$PACT_MOCK_SERVICE/bin/pact-mock-service /usr/local/bin

EXPOSE 1234

VOLUME ["/var/log/pact", "/var/contracts"];

ENTRYPOINT ["pact-mock-service", "--pact-specification-version", "2.0.0", "-l", "/var/log/pact/pact-mock-service.log", "-h", "0.0.0.0", "-d", "/var/contracts"]

CMD ["-p", "1234"]
