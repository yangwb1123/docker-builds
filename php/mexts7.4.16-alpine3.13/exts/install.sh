#!/usr/bin/bash

###
# @Author: yanbuw1911
# @Date: 2021-06-11 14:45:32
 # @LastEditors: yanbuw1911
 # @LastEditTime: 2021-06-11 17:01:00
# @Description: Do not edit
 # @FilePath: /workspace/docker/build/php/mexts7.4.16-alpine3.13/exts/install.sh
###

DOCKER_PHP_EXT_DIR=/usr/src/php/ext

packages="
    bzip2
    bzip2-dev
    zlib-dev
    libpng
    libpng-dev
    libintl
    musl-libintl
    gmp
    gmp-dev
    tidyhtml
    tidyhtml-dev
    libxml2-dev
    libxslt
    libxslt-dev
"

docker_php_exts="
    bcmath
    bz2
    calendar
    exif
    gd
    gettext
    gmp
    mysqli
    pcntl
    pdo_mysql
    shmop
    sockets
    sysvmsg
    sysvsem
    sysvshm
    tidy
    xmlrpc
    xsl
"

function install_exts() {
    cd $1 && 
        for item in $2; do
            tar -zxvf ${item} -C $1 &&
        done
}

sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories &&
    echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >>/etc/apk/repositories &&
    apk add $packages &&
    docker-php-source extract &&
    for ext in $docker_php_exts; do cd "/usr/src/php/ext/${ext}" && docker-php-ext-install -j$(nproc) ${ext} && docker-php-ext-enable ${ext}; done &&
    cd /tmp &&
    curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.7.2.1-1_amd64.apk &&
    curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.7.2.1-1_amd64.apk &&
    apk add --allow-untrusted msodbcsql17_17.7.2.1-1_amd64.apk &&
    apk add --allow-untrusted mssql-tools_17.7.2.1-1_amd64.apk &&
    install_exts "/tmp" "$(ls /tmp | grep tgz | grep psr)" &&
    install_exts "/tmp" "$(ls /tmp | grep tgz | grep -v psr)" &&
    cd ${DOCKER_PHP_EXT_DIR}/odbc &&
    phpize &&
    sed -ri 's@^ *test +"\$PHP_.*" *= *"no" *&& *PHP_.*=yes *$@#&@g' configure &&
    ./configure --with-unixODBC=shared,/usr &&
    docker-php-ext-install -j$(nproc) odbc &&
    cd /tmp &&
    ls | grep instantclient | for i in $(xargs); do unzip $i; done &&
    mkdir /opt/oracle &&
    mv $(ls -F | grep /$ | grep instantclient) /opt/oracle/instantclient &&
    export LD_LIBRARY_PATH="/opt/oracle/instantclient" &&
    ln -s "$LD_LIBRARY_PATH/libclntsh.so.11.1" "$LD_LIBRARY_PATH/libclntsh.so" &&
    ln -s /usr/lib/libnsl.so /usr/lib/libnsl.so.1 &&
    cd ${DOCKER_PHP_EXT_DIR}/pdo_oci &&
    docker-php-ext-configure pdo_oci --with-pdo-oci=shared,instantclient,$LD_LIBRARY_PATH &&
    docker-php-ext-install -j$(nproc) pdo_oci &&
    cd ${DOCKER_PHP_EXT_DIR}/pdo_odbc &&
    docker-php-ext-configure pdo_odbc --with-pdo-odbc=unixODBC,/usr/,share,instantclient,$LD_LIBRARY_PATH &&
    docker-php-ext-install -j$(nproc) pdo_odbc &&
    pecl install imagick && echo "extension=imagick.so" >>/usr/local/etc/php/conf.d/ext-imagick.ini &&
    pecl install msgpack && echo "extension=msgpack.so" >>/usr/local/etc/php/conf.d/ext-msgpack.ini &&
    pecl install event &&
    echo "extension=event.so" >>/usr/local/etc/php/conf.d/docker-php-ext.sockets.ini &&
    rm -f /usr/local/etc/php/conf.d/docker-php-ext-event.ini &&
    cd ${DOCKER_PHP_EXT_DIR}/oci8 &&
    docker-php-ext-configure oci8 --with-oci8=shared,instantclient,$LD_LIBRARY_PATH &&
    docker-php-ext-install -j$(nproc) oci8

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
