dnf install java-17-openjdk.x86_64 -y

id sonar
if [ $? -ne 0 ]; then
useradd sonar
fi

rm -rf /opt/sonarqube.zip
curl -L -o /opt/sonarqube.zip  https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.4.87374.zip
cd /opt
unzip -o sonarqube.zip 

chown -R sonar:sonar /opt/sonarqube-9.9.4.87374

echo '
[Unit]
Description=Sonarqube

[Service]
User=sonar
WorkingDirectory=/opt/sonarqube-9.9.4.87374/bin/linux-x86-64/
ExecStart=/opt/sonarqube-9.9.4.87374/bin/linux-x86-64/sonar.sh start
Type=forking
[Install]
WantedBy=multi-user.target
' > /etc/systemd/system/sonarqube.service

systemctl daemon-reload

systemctl restart sonarqube

systemctl enable sonarqube
