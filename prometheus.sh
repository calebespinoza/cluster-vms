#!/bin/bash
current_hostname=$(hostname)

if [[ "$current_hostname" == "server-vm1" ]]; then
    # echo "Hostname matched!!!"
    sudo cp /vagrant/prometheus.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl start prometheus.service
    sudo systemctl enable prometheus.service
    is_active=$(sudo systemctl is-active prometheus.service)
    if [[ "$is_active" == "active" ]]; then
        echo "Prometheus service started"
    else
        echo "Prometheus service is not started"
    fi
fi

sudo cp /vagrant/node-exporter.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl start node-exporter.service
sudo systemctl enable node-exporter.service

is_active=$(sudo systemctl is-active node-exporter.service)
if [[ "$is_active" == "active" ]]; then
    echo "Node Exporter service started"
else
    echo "Node Exporter service is not started"
fi