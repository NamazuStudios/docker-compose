ARG TAG
FROM elementalcomputing/elements-jetty-ws:${TAG}

ENTRYPOINT [ \
    "dockerize", "-timeout", "1m", \
    "-wait", "tcp://mongo:27017", \
    "java", "jettyws" \
]
