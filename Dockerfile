FROM httpd

RUN apt-get update -qq && apt-get install -y \
  git \
  curl

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

VOLUME /srv/git

RUN git config --system http.receivepack true

COPY notify_api_about_new_push /usr/local/bin
RUN chmod +x /usr/local/bin/notify_api_about_new_push
