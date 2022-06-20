FROM debian:bullseye

#Install kismet
RUN sed -i -e "s/ main[[:space:]]*\$/ main contrib non-free/" /etc/apt/sources.list
RUN apt update
RUN apt install -y firmware-ralink firmware-misc-nonfree
RUN apt install -y wget gnupg2 usbutils wireless-tools iproute2 kmod vim

RUN wget https://www.kismetwireless.net/repos/kismet-release.gpg.key
RUN apt-key add kismet-release.gpg.key
RUN echo 'deb https://www.kismetwireless.net/repos/apt/release/bullseye bullseye main' | tee /etc/apt/sources.list.d/kismet.list
RUN apt update && apt install -y kismet gpsd

EXPOSE 2501

WORKDIR /Drive/kismet_files
CMD kismet
