FROM tutum/jboss:as7
MAINTAINER marthjod@gmail.com

ADD resources/users.properties /jboss-as-7.1.1.Final/standalone/configuration/
ADD resources/roles.properties /jboss-as-7.1.1.Final/standalone/configuration/
ADD resources/standalone.xml /jboss-as-7.1.1.Final/standalone/configuration/

COPY resources/mysql-connector-java-bin.jar /jboss-as-7.1.1.Final/standalone/deployments/
COPY resources/jeux-ear-0.0.1-SNAPSHOT.ear /jboss-as-7.1.1.Final/standalone/deployments/

