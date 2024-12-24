#! /bin/bash
echo testing

#Defined Vars

REMOTE_FILE_URL="https://cdn.vintagestory.at/gamefiles/unstable/vs_client_linux-x64_1.20.0-rc.5.tar.gz"  # URL of the remote file
REMOTE_FILE_DOWNLOAD="/home/$USER/Downloads/vs_client.tar.gz"      # Local path to save the file
VS_FLATPAK_DIR="var/lib/flatpak/app/at.vintagestory.VintageStory/current/active/files/extra/vintagestory/"


if [ -d "$VS_FLATPAK_DIR" ]; then
        echo "please input your password when asked to delete the required files, make sure you backup everything vs related"

        echo "deleting vs data"
        sudo rm -rf VS_FLATPAK_DIR

        wget "$REMOTE_FILE_URL" -O "$REMOTE_FILE_DOWNLOAD"

        echo "now extracting the tar in its place"
        sudo tar -xvzf /home/$USER/Downloads/vs_client.tar.gz -C /var/lib/flatpak/app/at.vintagestory.VintageStory/current/active/files/extra/

        echo "vs should now be installed! enjoy~"
else
        echo "vs is not installed via flatpak"
fi
