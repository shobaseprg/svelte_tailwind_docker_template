FROM node:17-alpine

COPY ./.alias /root

RUN apk update && apk upgrade && \
  apk add --no-cache bash openssh \
  && cat /root/.alias >> /root/.bashrc

CMD ["bash"]
