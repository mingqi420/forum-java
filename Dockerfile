#docker run -itd --name eladmin -p 8000:8000 -v f:/docker/eladmin/config/:/usr/local/config/ -v f:/docker/eladmin/file:/home/eladmin/file -v f:/docker/eladmin/avatar:/home/eladmin/avatar eladmin:v1
# 基础镜像使用java
FROM java:8
# 作者
MAINTAINER limingqi <limingqi_420@163.com>
# VOLUME 指定了临时文件目录为/tmp。
# 其效果是在主机 /var/lib/docker 目录下创建了一个临时文件，并链接到容器的/tmp
#VOLUME /tmp
# 将jar包添加到容器中并更名为app.jar
#ADD demo-0.0.1-SNAPSHOT.jar app.jar
WORKDIR /usr/local/forum
ARG JAR_FILE=forum-starter/target/forum-java.jar
COPY ${JAR_FILE} app.jar
COPY forum-starter/src/main/resources/ config/
EXPOSE 8080
# 运行jar包
RUN bash -c 'touch app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]
