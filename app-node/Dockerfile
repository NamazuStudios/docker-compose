ARG TAG
FROM distribution.getelements.dev/elements-app-node:${TAG}

COPY logback.xml $ELEMENTS_CLASSPATH/logback.xml
COPY elements.properties $ELEMENTS_CONF/elements.properties

ENTRYPOINT [ \
    "dockerize", "-timeout", "1m", \
    "-wait", "tcp://redis:6379", \
    "-wait", "tcp://mongo:27017", \
    "java", "appnode" \
]
