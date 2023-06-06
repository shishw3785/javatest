FROM harbor-k8s.healthan.net/kubesphere/builder-maven:v3.2.0-nexus as builder
WORKDIR /work
COPY . .
RUN mvn clean && \
    mvn -Dmaven.test.skip=true clean package

FROM harbor-k8s.healthan.net/library/java:jr8
COPY --from=builder /work/target/*.jar /s6services/app/
#COPY ./target/*.jar /s6services/app/
ADD run /s6services/app/run
RUN chmod +x /s6services/app/run