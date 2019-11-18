FROM jboss/wildfly

ENV DB_NAME dm110
ENV DB_PASS docker
ENV DB_USER docker
ENV DB_HOST dm110-postgres
ENV DB_PORT 5432

ENV DS_NAME IBGE_DS
ENV JNDI_NAME java:/IBGE_DS
           
ADD ./modules/postgresql-42.2.8.jar /tmp/postgresql-42.2.8.jar
ADD ./scripts/wildfly-config.cli /tmp/wildfly-config.cli

RUN ${JBOSS_HOME}/bin/jboss-cli.sh --file=/tmp/wildfly-config.cli

RUN ${JBOSS_HOME}/bin/add-user.sh admin dm110 --silent

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-c", "standalone-full.xml", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]