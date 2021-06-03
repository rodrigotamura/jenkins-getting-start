FROM jenkins/jenkins

USER root
RUN apt-get update && apt-get -y install lsb-release
RUN apt -y install lsb-release apt-transport-https ca-certificates
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb http://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN apt-get update && apt-get -y install php7.4 php-mbstring php-xml php-bcmath php-mysql php-redis

RUN curl -sS http://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer