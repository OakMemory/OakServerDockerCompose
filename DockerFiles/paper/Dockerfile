# Build OakPaperHelper
FROM golang:1.19.0-alpine as buildUtils
RUN apk add git
WORKDIR /
RUN git clone https://github.com/OakMemory/OakPaperHelper.git
RUN cd /OakPaperHelper && go build

# Build PaperSpigot 
FROM azul/prime-debian:17 as final

RUN apt update && apt install curl 
COPY --from=buildUtils /OakPaperHelper/OakPaperHelper /usr/bin/oph
COPY launch_paper.sh /launch_paper.sh
RUN chmod +x /usr/bin/oph
RUN mkdir /paper \
    && curl -L $(/usr/bin/oph -d 1.19.2) -o /paper/core.jar

RUN chmod 544 /launch_paper.sh

EXPOSE 25565
VOLUME [ "/data" ]
ENTRYPOINT [ "bash", "/launch_paper.sh" ]
