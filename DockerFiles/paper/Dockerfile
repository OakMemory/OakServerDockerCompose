# Build OakPaperHelper
FROM golang:1.19.0-alpine as buildUtils
RUN apk add git
WORKDIR /
RUN git clone https://github.com/OakMemory/OakPaperHelper.git
RUN cd /OakPaperHelper && go build -v

# Build PaperSpigot 
FROM azul/prime-debian:17 as final

RUN mkdir /paper
COPY --from=buildUtils /OakPaperHelper/OakPaperHelper /paper
COPY launch_paper.sh /paper/launch_paper.sh
RUN apt update && apt install curl
RUN ls -al /paper/ && curl -L $(/paper/OakPaperHelper -d 1.19.2) -o /paper/core.jar

RUN chmod 544 /launch_paper.sh

EXPOSE 25565
VOLUME [ "/data" ]
ENTRYPOINT [ "bash", "/launch_paper.sh" ]
