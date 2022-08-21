# Build OakPaperHelper
FROM golang:1.19.0-alpine as buildUtils
RUN mv /etc/apt/sources.list /etc/apt/sources.list.old \
    && echo deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free > /etc/apt/sources.list \
    && apt install git
WORKDIR /
RUN git clone https://github.com/OakMemory/OakPaperHelper.git
RUN cd /OakPaperHelper && go build

# Build PaperSpigot 
FROM azul/prime-debian as final

RUN mv /etc/apt/sources.list /etc/apt/sources.list.old \
    && echo deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free > /etc/apt/sources.list \
    && apt update \
    && apt install curl 
COPY --from=buildUtils /OakPaperHelper/OakPaperHelper /usr/bin/oph
COPY launch_paper.sh /launch_paper.sh
RUN chmod +x /usr/bin/oph
RUN mkdir /paper \
    && curl -L $(oph -d 1.19.2) -o /paper/core.jar

RUN chmod 544 /launch_paper.sh

VOLUME [ "/data" ]
ENTRYPOINT [ "bash", "/launch_paper.sh" ]
