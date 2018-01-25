# Hadoop

## Puertos

| Nombre  | Puerto Anfritión | Puerto Invitado|
| ------------- | ------------- | ------------- | 
| ssh  | 2222  | 22 |
| jupyter  | 8889  | 8889 |

## Acceso Mac

```
ssh cloudera@localhost -p 2222

sftp -P 2222 cloudera@localhost
```

### Python

```
cd
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
chmod a+x Miniconda2-latest-Linux-x86_64.sh
./Miniconda2-latest-Linux-x86_64.sh
```

### Python 3
```
conda create -n py36 python=3.6

source activate py36
source deactivate
```

### Clave ssh

```
cd
ssh-keygen -t rsa -b 4096 -C "dvillaj@gmail.com"
cat .ssh/id_rsa.pub
```

### Git
```
git config --global user.name "Daniel Villanueva"
git config --global user.email "dvillaj@gmail.com"
```

### GetDataWS


```
git clone https://github.com/dvillaj/GetDataWS.git
```


### Twitter

https://github.com/dvillaj/cdh-twitter-example

```
sudo mkdir -p /usr/lib/flume-ng/plugins.d/twitter-streaming/lib/
sudo mkdir -p /var/lib/flume-ng/plugins.d/twitter-streaming/lib/

sudo cp $HOME/Hadoop/twitter/jar/flume-sources-1.0-SNAPSHOT.jar /usr/lib/flume-ng/plugins.d/twitter-streaming/lib
sudo cp $HOME/Hadoop/twitter/jar/flume-sources-1.0-SNAPSHOT.jar /var/lib/flume-ng/plugins.d/twitter-streaming/lib

sudo cp $HOME/Hadoop/twitter/jar/hive-serdes-1.0-SNAPSHOT.jar /usr/lib/hive/lib/
```

### Kafka

https://kafka.apache.org/quickstart
```
cd
wget http://apache.rediris.es/kafka/1.0.0/kafka_2.11-1.0.0.tgz
tar -xzf kafka_2.11-1.0.0.tgz
cd cd kafka_2.11-1.0.0

bin/kafka-server-start.sh config/server.properties &

```

### Análisis de sentimiento

```
sudo yum install telnet
```

### Impala

https://www.cloudera.com/downloads/connectors/impala/odbc/2-5-41.html

### Spark

```
sudo ln -s /usr/lib/hive/conf/hive-site.xml    /usr/lib/spark/conf/hive-site.xml
sudo cp /etc/spark/conf/log4j.properties.template /etc/spark/conf/log4j.properties
```



### Jupyter

```
pip install jupyter
pip install test_helper
pip install matplotlib

jupyter notebook --generate-config
cp $HOME/Hadoop/spark/jupyter_notebook_config.py $HOME/.jupyter
```

### Mongo

echo "[mongodb-org-3.4]
name=MongoDB 3.4 Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/
gpgcheck=0
enabled=1" | sudo tee /etc/yum.repos.d/mongodb-org-3.4.repo

sudo yum install -y mongodb-org