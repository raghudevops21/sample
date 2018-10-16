TOMCAT_HOST=172.17.0.2
TOMCAT_USER=user
TOMCAT_PWD=user
TOMCAT_HOME=/usr/local/tomcat
#
WAR_FILE_PATH=/home/raghu/.jenkins/workspace/job1/target

echo "Bringing tomcat server down for deployment..."
sleep 3

$TOMCAT_HOME/bin/shutdown.sh 1>/dev/null 2>&1

echo "deploying ecom application..."
sleep 4
sshpass -p "user" scp $WAR_FILE_PATH/ecom.war user@172.17.0.2:/usr/local/tomcat/webapps

echo "starting tomcat server..."
$TOMCAT_HOME/bin/startup.sh 1>/dev/null 2>&1

echo "deployment is successful!!"
