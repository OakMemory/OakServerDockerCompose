# Build OakPaperHelper
FROM golang:1.19.0-bullseye as buildUtils
RUN apt update && apt install git
WORKDIR /
RUN git clone https://github.com/OakMemory/OakPaperHelper.git \
    && cd /OakPaperHelper \
    && go build -v

# Build PaperSpigot 
FROM azul/prime-debian:17 as final

RUN mkdir /paper
COPY --from=buildUtils /OakPaperHelper/OakPaperHelper /bin/oph
COPY launch.sh /paper/launch.sh
RUN chmod +x /bin/oph
RUN apt update \
    && apt install curl git -y

RUN curl -L $(oph -d 1.19.2) -o /paper/paper.jar
RUN chmod 544 /paper/launch.sh

EXPOSE 25565
VOLUME [ "/data" ]
ENTRYPOINT [ "bash", "/paper/launch.sh" ]
