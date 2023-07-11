FROM maven
COPY ./app /root/app
WORKDIR /root/app
RUN mvn clean install

FROM registry.redhat.io/jboss-webserver-3/webserver31-tomcat8-openshift:1.3 
COPY --from=0  /root/app/target/hello-world-maven.war /deployments/ROOT.war
