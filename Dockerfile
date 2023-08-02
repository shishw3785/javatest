#FROM harbor-k8s.healthan.net/kubesphere/builder-maven:v3.2.0-nexus as builder
#WORKDIR /work
#COPY . .
#RUN mvn clean && \
#    mvn -Dmaven.test.skip=true clean package

#FROM harbor-k8s.healthan.net/library/java:jr8
#COPY --from=builder /work/target/*.jar /s6services/app/
##COPY ./target/*.jar /s6services/app/
#ADD run /s6services/app/run
#RUN chmod +x /s6services/app/run



FROM openjdk:8-jre
WORKDIR /work
COPY ./target/*.jar .
RUN ls -al
CMD java -jar -XX:MetaspaceSize=512m -XX:MaxMetaspaceSize=512m -Xms512m -Xmx512m -Xmn256m  -XX:SurvivorRatio=8 ./myproject-0.0.1-SNAPSHOT.jar  --server.port=8080 --spring.profiles.active="dev" --log.path="/data/logs/saas/eureka"  
