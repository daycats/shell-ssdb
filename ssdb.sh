# ssdb install
yum -y install wget unzip gcc gcc-c++ autoconf

cd /tmp
wget --no-check-certificate https://github.com/ideawu/ssdb/archive/master.zip  -O ssdb.zip
unzip ssdb.zip
cd ssdb-master/deps/jemalloc-4.1.0/
./autogen.sh && make
cd ../../
make && make install
/usr/local/ssdb/ssdb-server -d /usr/local/ssdb/ssdb.conf
echo "/usr/local/ssdb/ssdb-server -d -s restart /usr/local/ssdb/ssdb.conf" >> /etc/rc.local
cd /tmp
