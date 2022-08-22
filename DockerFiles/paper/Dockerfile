# Build OakPaperHelper
FROM golang:1.19.0-bullseye as buildUtils
RUN apt update && apt install git
WORKDIR /
RUN git clone https://github.com/OakMemory/OakPaperHelper.git \
    && cd /OakPaperHelper \
    && go build -v

# Build AuthlibInjector
FROM gradle:jdk17-focal as buildAuthlibInjector

ARG AUTHLIB_VERSION=v1.2.1
ARG AUTHLIB_REPO=https://github.com/OakMemory/AuthlibInjector

COPY build_authlib.sh /usr/bin/build_authlib.sh
WORKDIR /
RUN chmod +x /usr/bin/build_authlib.sh
RUN apt update && apt install git -y
RUN build_authlib.sh $AUTHLIB_VERSION $AUTHLIB_REPO


# Build PaperSpigot Image
FROM azul/prime-debian:17 as final

RUN mkdir /paper
COPY --from=buildUtils /OakPaperHelper/OakPaperHelper /bin/oph
COPY --from=buildAuthlibInjector /authlib.jar /paper/authlib.jar
COPY launch.sh /paper/launch.sh
RUN chmod +x /bin/oph
RUN apt update \
    && apt install curl -y

RUN curl -L $(oph -d 1.19.2) -o /paper/paper.jar
RUN chmod 544 /paper/launch.sh

ENV MAX_MEM='1024M'
ENV JVM_ARGS=-XX:-UseG1GC
ENV USE_AUTHLIB_INJECT='false'
ENV USE_AUTHLIB_SERVER=''
EXPOSE 25565
VOLUME [ "/data" ]
ENTRYPOINT [ "bash","/paper/launch.sh" ]
