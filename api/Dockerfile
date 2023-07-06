ARG TAG
FROM distribution.getelements.dev/elements-jetty-ws:${TAG}

COPY logback.xml $ELEMENTS_CLASSPATH/logback.xml
COPY elements.properties $ELEMENTS_CONF/elements.properties

ENTRYPOINT [ \
    "dockerize", "-timeout", "1m", \
    "-wait", "tcp://redis:6379", \
    "-wait", "tcp://mongo:27017", \
    "java", "dev.getelements.elements.rest.RestAPIMain" \
]
