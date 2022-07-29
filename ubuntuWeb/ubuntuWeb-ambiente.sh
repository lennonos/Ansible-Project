#Downloads e repositorios
    sudo apt -y install software-properties-common
    sudo add-apt-repository ppa:ondrej/php
    sudo apt update
    sudo wget https://docs.flexform.com.br/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
    sudo wget  https://docs.flexform.com.br/oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm
    sudo wget  https://docs.flexform.com.br/oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm


#Pacotes necessarios
    sudo apt -y install apache2
    sudo apt -y install php7.4 php7.4-xml  php7.4-cli php7.4-common php7.4-fpm php7.4-json php7.4-opcache php7.4-readline libapache2-mod-php7.4 php-pear php7.4-dev php7.4-gd
    sudo apt -y install alien
    
#Instalação dos pacote rpm
    sudo alien -i oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
    sudo alien -i oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm
    sudo alien -i oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm

#Instalação do Libaio1
    sudo apt -y  install libaio1

#Configuração
    sudo echo "/usr/lib/oracle/12.2/client64/lib/" >> /etc/ld.so.conf.d/oracle.conf
    sudo ldconfig
    export ORACLE_HOME=/usr/lib/oracle/12.2/client64/

# Instalação oci8
    sudo pecl download oci8-2.2.0
    sudo tar zxvf oci8-2.2.0.tgz
    cd oci8-2.2.0/
    phpize
     ./configure --with-oci8=instantclient,/usr/lib/oracle/12.2/client64/lib
    ## Se ele pedir o caminho do oracle, entre com o endereço /usr/lib/oracle/12.2/client64/lib
    sudo make install
    sudo echo "extension=oci8.so" > /etc/php/7.4/mods-available/oci8.ini
    cd /etc/php/7.4/apache2/conf.d
    sudo ln -s /etc/php/7.4/mods-available/oci8.ini oci8.ini

# Instalação PDO_OCI
    wget https://docs.flexform.com.br/php-src-PHP-7.4.30.zip
    unzip php-src-PHP-7.4.30.zip
    cd php-src-PHP-7.4.30/ext/pdo_oci/
    sudo phpize
    ./configure --with-pdo-oci=instantclient,/usr/lib/oracle/12.2/client64/lib
    sudo make install
    sudo echo "extension=pdo_oci.so" > /etc/php/7.4/mods-available/pdo_oci.ini
    cd /etc/php/7.4/apache2/conf.d
    sudo ln -s /etc/php/7.4/mods-available/pdo_oci.ini pdo_oci.ini
    sudo systemctl restart apache2