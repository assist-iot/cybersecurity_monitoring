# Cybersecurity Monitoring

Cybersecurity Monitoring enabler provides security awareness and visibility and infrastructure monitoring. It is divided in two services: Incident Detection and Incident Response.

## Incident Detection

Incident Detection is the first phase of Cybersecurity Monitoring Enabler from ASSIST-IoT project. The Incident Detection, get monitoring awareness from all the events received from the monitored endpoints: authentication errors, software/malware installation, real time file monitoring (looking for unauthorized modifications), network attacks, privilege escalation, or others that can be configured. Incident detection monitoring also normalizes all the info received to prepare it for the next phase. 

## Incident Response

Incident response is the second phase of Cybersecurity Monitoring Enabler from ASSIST-IoT project. The Incident response get all the alerts from the Incident detection and creates a security case to perform a treatment and mitigation process. Information received can be enriched from other sources related to the original alert. Once the information is ready, with the incident response tool is possible to orchestrate different kind of actions, such as automated responses like introducing a condition such as a firewall drop rule in the monitored endpoint. Other orchestrated actions are possible such us notifications to third party applications like ticketing systems, email or instant messaging applications. 

# Incident Detection deployment

- [x] Must have docker and docker-compose installed.

### Go to the folder.
````
cd cybersecurity-monitoring/SIEM/docker
````
##### On the path over the docker-compose.yml file excecute on the terminal.

```
docker-compose up -d
```
# Incident Response deployment

- [x] Must have docker and docker-compose installed.

### Go to the folder.
````
cd cybersecurity-monitoring/SOAR/docker
````
##### On the path over the docker-compose.yml file excecute on the terminal.

```
docker-compose up -d
```

# For more info on Cybersecurity Monitoring enabler see wiki page. [here](https://assist-iot-enablers-documentation.readthedocs.io/en/latest/verticals/cybersecurity/cybersecurity_monitoring_enabler.html)


