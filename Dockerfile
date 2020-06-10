FROM docker:19.03.2

LABEL name="Build and publish docker action"
LABEL maintainer="Andreas Fürst"
LABEL version="1.0.0"

LABEL com.github.actions.name="Build and publish docker action"
LABEL com.github.actions.description="Build and publish docker action"
LABEL com.github.actions.icon="box"
LABEL com.github.actions.color="blue"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]