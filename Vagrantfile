# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 8888, host: 8888

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  # install base packages
  config.vm.provision "shell",  inline: <<-SHELL
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install -y python-dev
    sudo apt-get install -y python-pip
    sudo pip install --upgrade ipython[all]
    sudo mkdir -p /vagrant/notebook
  SHELL

  

  # unpack and install spark
  $SCRIPT=<<-SHELL  
    cd
    tar xzf /vagrant/spark-1.4.1-bin-hadoop1.tgz
    mv spark-1.4.1-bin-hadoop1 spark-hadoop
    echo "export SPARK_HOME=/home/vagrant/spark-hadoop" >> /home/vagrant/.bashrc
    echo "export PATH=$PATH:/home/vagrant/spark-hadoop/bin" >> /home/vagrant/.bashrc
  SHELL
  config.vm.provision "shell", inline: $SCRIPT, privileged: false


  

  # install java (silent)  
  $SCRIPT=<<-SHELL
      echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
      echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
      sudo apt-get -y install oracle-java7-installer 
  SHELL
  config.vm.provision "shell", inline: $SCRIPT


  

  
  # setup ipython profile
  $SCRIPT=<<-SHELL
    ipython profile create spark
    cp /vagrant/ipython-profile/ipython_notebook_config.py /home/vagrant/.ipython/profile_spark
    cp /vagrant/ipython-profile/00-pyspark-setup.py /home/vagrant/.ipython/profile_spark/startup
    ipython notebook --profile=spark --notebook-dir=/vagrant/notebook --no-browser --ip=0.0.0.0 &
  SHELL
  config.vm.provision "shell", run: "always", inline: $SCRIPT, privileged: false

  
end
