# Hadoop

## Puertos

| Nombre  | Puerto Anfritión | Puerto Invitado|
| ------------- | ------------- | ------------- | 
| ssh  | 2222  | 22 |
| jupyter  | 8889  | 8889 |
| MongoDB  | 27017 | 27017 |


## Python

```
cd
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
chmod a+x Miniconda2-latest-Linux-x86_64.sh
./Miniconda2-latest-Linux-x86_64.sh

source $HOME/.bashrc

pip install tweepy
pip install PrettyTable
pip install pprintpp
pip install pandas

```

## Dependencias

```
cd
git clone https://github.com/dvillaj/TwitterData.git
git clone https://github.com/dvillaj/GetDataWS.git

echo 'export PATH=$PATH:$HOME/GetDataWS/' >> /home/cloudera/.bashrc
source $HOME/.bashrc
```

## Acceso Mac

```
ssh cloudera@localhost -p 2222

sftp -P 2222 cloudera@localhost
```


## Python 3
```
cd
conda create -n py36 python=3.6

source activate py36
source deactivate
```

## Clave ssh

```
cd
ssh-keygen -t rsa -b 4096 -C "dvillaj@gmail.com"
cat .ssh/id_rsa.pub
```

## Git

```
git config --global user.name "Daniel Villanueva"
git config --global user.email "dvillaj@gmail.com"
```


## Twitter

https://github.com/dvillaj/cdh-twitter-example

```
sudo mkdir -p /usr/lib/flume-ng/plugins.d/twitter-streaming/lib/
sudo mkdir -p /var/lib/flume-ng/plugins.d/twitter-streaming/lib/

sudo cp $HOME/Hadoop/twitter/jar/flume-sources-1.0-SNAPSHOT.jar /usr/lib/flume-ng/plugins.d/twitter-streaming/lib
sudo cp $HOME/Hadoop/twitter/jar/flume-sources-1.0-SNAPSHOT.jar /var/lib/flume-ng/plugins.d/twitter-streaming/lib

sudo cp $HOME/Hadoop/twitter/jar/hive-serdes-1.0-SNAPSHOT.jar /usr/lib/hive/lib/
```

## Kafka

https://kafka.apache.org/quickstart
```
cd
wget http://apache.rediris.es/kafka/1.0.0/kafka_2.11-1.0.0.tgz
tar -xzf kafka_2.11-1.0.0.tgz

echo 'export KAFKA_HOME=$HOME/kafka_2.11-1.0.0' >> $HOME/.bashrc
echo 'export PATH=$KAFKA_HOME/bin:$PATH' >> $HOME/.bashrc
source $HOME/.bashrc
```

### Comandos habituales

| Operación  | Comando |
| ------------- | ------------- | 
| Iniciar el servidor | kafka-server-start.sh $KAFKA_HOME/config/server.properties
| Crear un tópico | kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
| Borrar un tópico | kafka-topics.sh --delete --zookeeper localhost:2181 --topic test
| Listar los tópicos | kafka-topics.sh --list --zookeeper localhost:2181
| Ejemplo de productor | kafka-console-producer.sh --broker-list localhost:9092 --topic test
| Ejemplo de consumidor | kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning 

## Telnet

```
sudo yum install telnet
```

## Cliente ODBC Impala

https://www.cloudera.com/downloads/connectors/impala/odbc/2-5-41.html

## Spark

```
sudo ln -s /usr/lib/hive/conf/hive-site.xml    /usr/lib/spark/conf/hive-site.xml
sudo cp /etc/spark/conf/log4j.properties.template /etc/spark/conf/log4j.properties
```

## Jupyter

```
pip install jupyter
pip install test_helper
pip install matplotlib

jupyter notebook --generate-

cp $HOME/Hadoop/spark/jupyter_notebook_config.py $HOME/.jupyter
```

## Mongo

```
sudo nano /etc/yum.repos.d/mongodb-org-3.4.repo

[mongodb-org-3.4]
name=MongoDB 3.4 Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/
gpgcheck=0
enabled=1
```


```
sudo yum install -y mongodb-org

sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
sudo service mongod restart

pip install pymongo
```

### Cliente Mongo

https://robomongo.org/

## Sublime Text


### Paquetes
- SFTP
- Generic Config
- MarkDown Preview
-

### Preferencias
```
{
    "always_show_minimap_viewport": true,
    "bold_folder_labels": true,
    "color_scheme": "Packages/Color Scheme - Default/Monokai.tmTheme",
    "draw_minimap_border": true,
    "fade_fold_buttons": false,
    "font_size": 11,
    "highlight_line": true,
    "highlight_modified_tabs": true,
    "ignored_packages": ["Vintage"],
    "show_encoding": true,
    "tab_size": 4,
    "theme": "Default.sublime-theme",
    "translate_tabs_to_spaces": true,
    "default_line_ending": "unix"
}
```

### Configuración SFTP
```
{
    "type": "sftp", 
    "save_before_upload": true,
    "upload_on_save": true,
    "sync_down_on_open": false,
    "sync_skip_deletes": false,
    "sync_same_age": true,
    "confirm_downloads": false,
    "confirm_sync": true,
    "confirm_overwrite_newer": false,
    "host": "localhost",
    "user": "cloudera",
    "password": "cloudera",
    "port": "2222",
    "remote_path": "/home/cloudera/Hadoop/",
    "ignore_regexes": [
        "\\.sublime-(project|workspace)", "sftp-config(-alt\\d?)?\\.json",
        "sftp-settings\\.json", "/venv/", "\\.svn/", "\\.hg/", "\\.git/",
        "\\.bzr", "_darcs", "CVS", "\\.DS_Store", "Thumbs\\.db", "desktop\\.ini"
    ],
    "connect_timeout": 30,
}
```