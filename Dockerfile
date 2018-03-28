FROM httpd

RUN apt-get update -qq && apt-get install -y \
  git

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

VOLUME /srv/git

RUN git config --system http.receivepack true
