ARG TAG
FROM elementalcomputing/elements-jetty-ws:${TAG}

USER root:root
RUN mkdir /var/log/elements && \
    chown -R elements:elements /var/log/elements

USER $ELEMENTS_UID:$ELEMENTS_GID

ENTRYPOINT [ \
    "dockerize", "-timeout", "15m", \
    "-wait", "tcp://mongo:27017", \
    "java", "jettyws" \
]
