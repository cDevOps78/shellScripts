
rm -rf  /opt/sonar-scanner.zip 
curl -L -o /opt/sonar-scanner.zip  https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.0.2966-linux.zip

cd /opt 

unzip -o /opt/sonar-scanner.zip

# /opt/sonar-scanner-cli-5.0.0.2966-linux/bin/sonar-scanner
