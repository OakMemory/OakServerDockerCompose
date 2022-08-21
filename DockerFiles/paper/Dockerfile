# Build OakPaperHelper
FROM golang:1.19.0-bullseye as buildUtils
RUN apk add git
WORKDIR /
RUN git clone https://github.com/OakMemory/OakPaperHelper.git \
    && cd /OakPaperHelper \
    && go build -v

# Build PaperSpigot 
FROM azul/prime-debian:17 as final

RUN mkdir /paper
COPY --from=buildUtils /OakPaperHelper/OakPaperHelper /bin/oph
COPY launch_paper.sh /paper/launch_paper.sh
RUN chmod +x /bin/oph
RUN apt update \
    && apt install curl -y \
    && /bin/oph -d 1.19.2 \
    && export DOWNLOAD_URL=$(oph -d 1.19.2) \
    && curl -L $DOWNLOAD_URL -o /paper/core.jar

RUN chmod 544 /launch_paper.sh

EXPOSE 25565
VOLUME [ "/data" ]
ENTRYPOINT [ "bash", "/launch_paper.sh" ]
