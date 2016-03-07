apt-get update
apt-get -y install emacs tmux tree build-essential wget curl g++ git
apt-get install python-dev python3-dev python-setuptools python3-setuptools
apt-get install -y python-pip python-virtualenv 


mkdir -p work
mkdir spark
cd spark

tar xzf /vagrant/spark-1.4.1-bin-hadoop1.tgz

add-apt-repository ppa:webupd8team/java
apt-get update


#apt-get install -y oracle-java7-installer
#apt-get install oracle-java7-set-default


#virtualenv -p python2 env
#source env/bin/activate
#pip install ipython
