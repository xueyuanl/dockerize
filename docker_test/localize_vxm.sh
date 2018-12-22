echo "Backup remote database..."
echo "Please enter the vxm password..."
ssh root@192.168.104.203 "pg_dumpall -U postgres > ~/alldump.sql" # may have synchronization problem.

echo "Scp remote files to local..."
echo "Please enter the vxm password..."
scp -r root@192.168.104.203:'/var/lib/vmware-marvin/trust \
							   /etc/vmware-marvin/ssl \
							   /etc/vmware-marvin/password.key \
							   /var/lib/vmware-marvin/runtime.properties \
							   ~/alldump.sql' .

mv ./trust ./tomcat
mv ./ssl ./tomcat
mv password.key ./tomcat
mv runtime.properties ./tomcat
mv ./alldump.sql ./psql



