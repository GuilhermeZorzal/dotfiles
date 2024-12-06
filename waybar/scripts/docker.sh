
#!/bin/bash

# Check if playerctl is available
check_docker() {
    if systemctl is-active --quiet docker; then
        # kitty -e "sudo service docker start"
        printf '{"text":"", "class":"running", "tooltip":"Docker service is running"}\n'
        exit 0
    else
        # kitty -e "sudo service docker stop"
        printf '{"text":"", "class":"stopped", "tooltip":"Docker service is stopped"}\n'
        exit 1
    fi
}
check_docker
