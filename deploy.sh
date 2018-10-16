TOMCAT_HOST=172.17.0.2
TOMCAT_USER=user
TOMCAT_PWD=user
TOMCAT_HOME=/usr/local/tomcat
#
WAR_FILE_PATH=/home/raghu/.jenkins/workspace/job1/target/ecom.war

echo "Bringing tomcat server down for deployment..."
sleep 3

$TOMCAT_HOME/bin/shutdown.sh 1>/dev/null 2>&1

if [ -f $WAR_FILE_PATH ]; then
    echo "deploying ecom application..."
    sleep 4
    sshpass -p $TOMCAT_PWD ssh $TOMCAT_USER@$TOMCAT_HOST
    scp $WAR_FILE_PATH $TOMCAT_USER@$TOMCAT_HOST:$TOMCAT_HOME/webapps
else
   echo "war file doesn't exist! Please check the build"
fi

echo "starting tomcat server..."
$TOMCAT_HOME/bin/startup.sh 1>/dev/null 2>&1

echo "deployment is successful!!"
    
