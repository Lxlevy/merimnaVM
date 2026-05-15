# merimnaVM

A containerized desktop environment accessible via web browser, inspired by [BlobeVM](https://github.com/Blobby-Boi/BlobeVM) and powered by KasmVNC & Docker.

## Features

-  **Web-Based Desktop** - Access your desktop from any browser
-  **Docker Containerized** - Easy deployment and portability
-  **Fast & Lightweight** - Optimized performance
-  **Audio Support** - Full audio streaming
-  **Highly Customizable** - Choose your desktop environment and apps
-  **Multiple Desktop Environments** - KDE Plasma, XFCE4, GNOME, and more

## Installation

### Prerequisites

- Git installed
- Docker installed and running
- Python 3 with pip
- At least 2GB of free disk space

### Quick Start (GitHub Codespaces)

1. Start a new blank Codespace on GitHub
2. Run the following commands:

```bash
curl -O https://raw.githubusercontent.com/lxlevy/merimnaVM/main/install.sh
chmod +x install.sh
./install.sh
```

3. Follow the interactive installer to select your desktop environment and apps
4. Once installation completes, go to the "Ports" tab and open port 3000
5. Enjoy your web-based desktop!

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/lxlevy/merimnaVM.git
cd merimnaVM
```

2. Install dependencies:
```bash
pip install textual
```

3. Run the installer:
```bash
python3 installer.py
```

4. Build the Docker image:
```bash
docker build -t merimnavm . --no-cache
```

5. Run the container:
```bash
docker run -d --name=merimnaVM -e PUID=1000 -e PGID=1000 --security-opt seccomp=unconfined -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE=merimnaVM -p 3000:3000 --shm-size="2gb" -v $(pwd)/Save:/config --restart unless-stopped merimnavm
```

6. Access your desktop at `http://localhost:3000`

## Available Desktop Environments

- **KDE Plasma** - Feature-rich, customizable (Heavy)
- **XFCE4** - Lightweight and responsive (Lightweight)
- **i3** - Minimal tiling window manager (Very Lightweight)
- **GNOME 42** - Modern and polished (Very Heavy)
- **Cinnamon** - Traditional and comfortable (Medium)
- **LXQT** - Lightweight Qt-based (Very Lightweight)

## Available Applications

### Programming
- OpenJDK 8 & 17 - Java development
- VSCodium - Code editor
- Git - Distributed version control system
- Python3 - Python coding language

### Additional Apps
- VLC - Media player
- LibreOffice - Office suite
- Synaptic - Package manager

## Configuration

Edit `options.json` to customize which apps are installed:

```json
{
  "programming": [0, 1, 2],
  "utilities": [0, 1, 2],
  "enablekvm": true,
  "DE": "KDE Plasma (Heavy)"
}
```

## Keyboard Shortcuts

- **Alt+Tab** - Switch windows
- **Super Key** - Open application menu
- **Ctrl+Alt+T** - Open terminal (varies by DE)

## Troubleshooting

### Port 3000 not accessible
- Ensure Docker is running
- Check if port 3000 is already in use: `lsof -i :3000`
- Try a different port: `-p 8080:3000`

### Docker build fails
- Update Docker: `docker --version`
- Clear Docker cache: `docker system prune`
- Try building again with `--no-cache` flag

### Performance issues
- Increase shared memory: `--shm-size="4gb"`
- Close unnecessary applications
- Use a lighter desktop environment

### Connection issues
- Check your network connection
- Verify the container is running: `docker ps`
- Check logs: `docker logs merimnaVM`

## System Requirements

- **Minimum**: 2GB RAM, 2GB disk space
- **Recommended**: 4GB RAM, 10GB disk space
- **Optimal**: 8GB+ RAM, 20GB+ disk space

## License

This project is inspired by [BlobeVM](https://github.com/Blobby-Boi/BlobeVM) and uses components from Linuxserver.io.

## Disclaimer

This tool is for personal use and educational purposes. Users are responsible for complying with their organization's acceptable use policies and local laws.

## Credits

- Based on [BlobeVM](https://github.com/Blobby-Boi/BlobeVM)
- Powered by [KasmVNC](https://www.kasmweb.com/kasmvnc)
- Desktop images from [Linuxserver.io](https://www.linuxserver.io/)
