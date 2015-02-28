cd /root
yum update
yum install -y git gcc g++ make automake
git clone https://github.com/yaoweibin/ngx_http_substitutions_filter_module
wget http://nginx.org/download/nginx-1.7.10.tar.gz
tar zxvf nginx-*.tar.gz
cd nginx-*
./configure --user=www --group=www --prefix=/usr/local/nginx --sbin-path=/usr/sbin/nginx --pid-path=/var/run/nginx.pid --conf-path=/usr/local/nginx/conf/nginx.conf --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-ipv6 --with-http_sub_module --add-module=/root/ngx_http_substitutions_filter_module
make
make install
