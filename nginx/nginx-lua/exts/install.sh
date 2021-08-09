#!/bin/bash

apt_pkgs="
gcc
make
curl
libpcre3-dev
libssl-dev
"

apt update -y && apt upgrade -y && apt install ${apt_pkgs} -y

Zlib_DOWNLOAD_URL="http://zlib.net/zlib-1.2.11.tar.gz"
LuaJIT_DOWNLOAD_URL="http://luajit.org/download/LuaJIT-2.0.5.tar.gz"
Nginx_DOWNLOAD_URL="http://nginx.org/download/nginx-1.21.1.tar.gz"
NgxDevKit_DOWNLOAD_URL="https://codeload.github.com/vision5/ngx_devel_kit/tar.gz/refs/tags/v0.3.1"
LuaNgxModule_DOWNLOAD_URL="https://codeload.github.com/openresty/lua-nginx-module/tar.gz/refs/tags/v0.10.20"
LuaCjson_DOWNLOAD_URL="https://kyne.com.au/~mark/software/download/lua-cjson-2.1.0.tar.gz"

myArray=(
    ${Zlib_DOWNLOAD_URL} 
    ${LuaJIT_DOWNLOAD_URL} 
    ${Nginx_DOWNLOAD_URL} 
    ${NgxDevKit_DOWNLOAD_URL} 
    ${LuaNgxModule_DOWNLOAD_URL}
    ${LuaCjson_DOWNLOAD_URL}
)

for item in "${myArray[@]}"; do
    curl -O ${item} && tar -zxvf $(echo ${item} | awk -F "/" '{print $NF}') -C /opt/
done

cd /opt/zlib-1.2.11 && ./configure && make -j$(nproc) && make install

cd /opt/LuaJIT-2.0.5 && make -j$(nproc) && make install && export LUAJIT_LIB=/usr/local/lib/ && export LUAJIT_INC=/usr/local/include/luajit-2.0/

cp /usr/local/include/luajit-2.0/* /usr/local/include/ && cd /opt/lua-cjson-2.1.0 && make -j$(nproc) && cp /opt/lua-cjson-2.1.0/cjson.so /usr/local/lib/lua/5.1

cd /opt/nginx-1.21.1 && ./configure --with-compat --with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_mp4_module --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-mail --with-mail_ssl_module --with-stream --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_module --with-cc-opt='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic -fPIC' --with-ld-opt='-Wl,-z,relro -Wl,-z,now -pie' --add-module=/opt/ngx_devel_kit-0.3.1 --add-module=/opt/lua-nginx-module-0.10.20 && make -j$(nproc) && make install && ldconfig && ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/nginx
