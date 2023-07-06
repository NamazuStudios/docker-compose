ARG TAG
FROM distribution.getelements.dev/elements-setup:${TAG}

COPY id_bogo.pub $ELEMENTS_CONF/authorized_keys
COPY logback.xml $ELEMENTS_CLASSPATH/logback.xml
COPY elements.properties $ELEMENTS_CONF/elements.properties

RUN $ELEMENTS_BIN/hostkeys.sh
RUN chmod 644 $ELEMENTS_CONF/authorized_keys
