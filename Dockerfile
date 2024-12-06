FROM maven
COPY ./app /root/app
WORKDIR /root/app
RUN mvn clean install

FROM tomcat 
COPY --from=0  /root/app/target/hello-world-maven.war /usr/local/tomcat/webapps/ROOT.war