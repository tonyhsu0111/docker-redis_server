FROM nginx:1.21.1-alpine
#FROM nginx:1.15.12

RUN apk update && \
    apk --no-cache add bash tzdata curl ca-certificates s6 ssmtp mysql-client

#RUN apk update && \
#    apk --no-cache add bash tzdata curl ca-certificates s6 ssmtp mysql-client nginx-mod-http-#headers-more

ADD conf/cron/root /etc/crontabs/root

RUN chown -R root:root /etc/crontabs/root \
# 修改文件的权限，必须为 600，否则不认
 && chmod 600 /etc/crontabs/root

#Time
ENV TW=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TW /etc/localtime && echo $TW > /etc/timezone  

COPY entrypoint.sh /
RUN chmod 777 ./entrypoint.sh

EXPOSE 80
ENTRYPOINT ["./entrypoint.sh"]
#CMD ["nginx","-g","daemon off;"]
