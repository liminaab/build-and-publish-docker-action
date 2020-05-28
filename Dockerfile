FROM docker:19.03.2
LABEL "maintainer"="Andreas Fürst"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]