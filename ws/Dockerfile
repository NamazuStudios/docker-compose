ARG TAG
FROM elementalcomputing/elements-jetty-ws:${TAG}

RUN mkdir /var/log/elements && \
    chown -R elements:elements /var/log/elements

ENTRYPOINT [ \
    "dockerize", "-timeout", "1m", \
    "-wait", "tcp://mongo:27017", \
    "java", "jettyws" \
]
