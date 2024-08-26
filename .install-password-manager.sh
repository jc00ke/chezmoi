#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type /opt/1Password/op-ssh-sign >/dev/null 2>&1 && type op >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    # commands to install password-manager-binary on Darwin
    ;;
Linux)
    # commands to install password-manager-binary on Linux
    sudo apt install -y curl gnupg2
    wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb
    sudo dpkg -i 1password-latest.deb && rm 1password-latest.deb

    wget https://downloads.1password.com/linux/debian/amd64/stable/1password-cli-amd64-latest.deb
    sudo dpkg -i 1password-cli-amd64-latest.deb && rm 1password-cli-amd64-latest.deb
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
