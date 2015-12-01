FROM ubuntu:15.04

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y wget

# Jenkins repository
RUN wget -q https://jenkins-ci.org/debian/jenkins-ci.org.key && apt-key add jenkins-ci.org.key && \
echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list

# Install Jenkins and other dependencies
RUN apt-get update && \
apt-get install -y jenkins python3 virtualenv python3-pip curl git unzip

RUN unzip -o -d /var/lib/jenkins ./jenkins.zip && \
chown -R jenkins:jenkins /var/lib/jenkins/*

ENV JENKINS_HOME /var/lib/jenkins
USER jenkins

EXPOSE 8080

CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war"]