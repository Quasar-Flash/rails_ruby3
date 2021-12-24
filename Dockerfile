FROM ruby:3.0-slim-buster

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV GEM_HOME=/usr/local/lib/ruby/gems/3.0.0

# Locale
RUN apt-get update -qq && apt-get install -y apt-utils locales && update-locale LANG=C.UTF-8 LC_ALL=C.UTF-8

# Basic tools
RUN apt-get install -qq -y --no-install-recommends \
	build-essential libpq-dev curl apt-transport-https imagemagick \
	libsqlite3-dev git shared-mime-info libffi-dev deborphan libreadline-dev

RUN gem uninstall -aIx
RUN gem install bundler

ADD clean.sh ./clean.sh
RUN chmod +x clean.sh && ./clean.sh
RUN apt remove --purge deborphan -qq -y && apt autoremove -qq -y && apt autoclean -qq -y
RUN rm ./clean.sh
RUN	rm -rf /var/lib/apt/lists/*

CMD ["irb"]
