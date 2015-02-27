cd /root
yum update
yum install -y git gcc g++ make automake
git clone http://luajit.org/git/luajit-2.0.git
cd luajit-2.0/
make
make install
ln -sf luajit-2.0.0-beta10 /usr/local/bin/luajit
ln -sf /usr/local/lib/libluajit-5.1.so.2 /usr/lib/
cd /root
git clone https://github.com/yaoweibin/ngx_http_substitutions_filter_module
git clone https://github.com/simpl/ngx_devel_kit.git
git clone https://github.com/chaoslawful/lua-nginx-module.git
git clone https://github.com/monadbobo/limit_req2_nginx_module
wget http://nginx.org/download/nginx-1.7.10.tar.gz
tar zxvf nginx-*.tar.gz
cd nginx-*
export LUAJIT_LIB=/usr/local/lib
export LUAJIT_INC=/usr/local/include/luajit-2.0
./configure --user=www --group=www --prefix=/usr/local/nginx --sbin-path=/usr/sbin/nginx --pid-path=/var/run/nginx.pid --conf-path=/usr/local/nginx/conf/nginx.conf --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-ipv6 --with-http_sub_module --add-module=/root/ngx_http_substitutions_filter_module --add-module=/root/ngx_devel_kit --add-module=/root/lua-nginx-module --add-module=/root/limit_req2_nginx_module
make
make install
