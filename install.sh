git clone https://github.com/lxlevy/merimnaVM
cd merimnaVM
pip install textual
sleep 2
python3 installer.py
docker build -t merimnavm . --no-cache
cd ..

sudo apt update
sudo apt install -y jq

mkdir Save
cp -r merimnaVM/root/config/* Save

json_file="merimnaVM/options.json"
if jq ".enablekvm" "$json_file" | grep -q true; then
    docker run -d --name=merimnaVM -e PUID=1000 -e PGID=1000 --device=/dev/kvm --security-opt seccomp=unconfined -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE=merimnaVM -p 3000:3000 --shm-size="2gb" -v $(pwd)/Save:/config --restart unless-stopped merimnavm
else
    docker run -d --name=merimnaVM -e PUID=1000 -e PGID=1000 --security-opt seccomp=unconfined -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE=merimnaVM -p 3000:3000 --shm-size="2gb" -v $(pwd)/Save:/config --restart unless-stopped merimnavm
fi
clear
echo "merimnaVM has been installed. please check your port tab."
echo "contributors: Lxlevy"
