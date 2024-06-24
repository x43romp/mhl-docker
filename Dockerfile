FROM ubuntu AS installer
RUN apt update;
RUN apt install git make libssl-dev libxml2-dev gcc -y;
RUN git clone https://github.com/pomfort/mhl-tool.git /root/mhl-tool
WORKDIR /root/mhl-tool/dev_envs/Ubuntu_12.04_x64
RUN make release

RUN cp /root/mhl-tool/bin/Ubuntu_12.04_x64/Release/mhl /usr/bin

ENTRYPOINT [ "mhl" ]