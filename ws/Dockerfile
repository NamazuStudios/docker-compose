ARG TAG
FROM elementalcomputing/elements-jetty-ws:${TAG}

COPY logback.xml $ELEMENTS_CLASSPATH/logback.xml
COPY elements.properties $ELEMENTS_CONF/elements.properties

ENTRYPOINT [ \
    "dockerize", "-timeout", "1m", \
    "-wait", "tcp://mongo:27017", \
    "java", "jettyws" \
]
