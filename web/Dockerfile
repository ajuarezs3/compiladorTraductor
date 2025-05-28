FROM registry.gitlab.com/images8975103/laravel11:1.0.9

COPY custom-php.ini /usr/local/etc/php/conf.d/

RUN apt-get update && \
    apt-get install -y wget gnupg software-properties-common && \
    wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor -o /usr/share/keyrings/adoptium.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y temurin-21-jre && \
    apt-get clean


CMD ["apache2-foreground"]