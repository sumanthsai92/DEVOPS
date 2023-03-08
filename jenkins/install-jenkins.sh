sudo hostnamectl set-hostname "jenkins.cloudbinary.io"
echo "`hostname -I | awk '{ print $1 }'` `hostname`" >> /etc/hosts
apt-get update
apt-get install git wget unzip curl tree -y
apt-get install openjdk-11-jdk -y
cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"
echo "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/" >> /etc/environment
source /etc/environment
apt-get install maven -y
cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"
echo "MAVEN_HOME=/usr/share/maven" >> /etc/environment
source /etc/environment
cd /opt
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/' > /etc/apt/sources.list.d/jenkins.list
apt-get update
apt-get install jenkins -y

