#!/bin/sh

wget -q https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb
sudo mkdir -p /opt/aws/amazon-cloudwatch-agent/bin
sudo bash -c 'cat > /opt/aws/amazon-cloudwatch-agent/bin/config.json << EOF
{
    "agent": {
        "metrics_collection_interval": 60,
        "run_as_user": "cwagent"
    },
    "metrics": {
        "append_dimensions": {
            "InstanceType": "\${aws:InstanceType}"
        },
        "metrics_collected": {
            "collectd": {
                "metrics_aggregation_interval": 60
            },
            "cpu": {
                "measurement": [
                    "cpu_usage_iowait"
                ],
                "metrics_collection_interval": 60,
                "totalcpu": false
            },
            "diskio": {
                "measurement": [
                    "io_time"
                ],
                "metrics_collection_interval": 60,
                "resources": [
                    "*"
                ]
            },
            "mem": {
                "measurement": [
                    "mem_used_percent"
                ],
                "metrics_collection_interval": 60
            }
        }
    }
}
EOF'
cat /opt/aws/amazon-cloudwatch-agent/bin/config.json
