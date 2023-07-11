FROM maven
COPY ./maven-hello-world /root/maven-hello-world
WORKDIR /root/maven-hello-world
RUN mvn clean install

FROM registry.redhat.io/jboss-webserver-3/webserver31-tomcat8-openshift:1.3 
COPY --from=0  /root/maven-hello-world/target/hello-world-maven.war /deployments/
