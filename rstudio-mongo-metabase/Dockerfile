FROM rocker/rstudio

LABEL maintainer="<crazycapivara@gmail.com>"

RUN apt-get update && apt-get install -y libssl-dev libsasl2-dev
#apt-get install zlib1g-dev

RUN install2.r mongolite remotes httr \
	&& installGithub.r metacran/cranlogs

ADD ./scripts /home/rstudio/scripts

