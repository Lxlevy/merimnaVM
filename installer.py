from textual.app import App, ComposeResult
from textual.screen import Screen
from textual.containers import Horizontal, Vertical
from textual.widgets import Footer, Header, SelectionList, Label, Button, Markdown, Select, Static, Switch

### JSON Exporter ###

def savejson(json):
    with open('options.json', 'w') as f:
        f.write(str(json).replace("'", '"').replace("True", "true").replace("False", "false"))

#####################

Head="""
# merimnaVM Installer

> merimnaVM (powered by KasmVNC & Docker)

merimnaVM is a VM that...
* runs entirely in a web browser
* lightweight and fast
* has audio support
* can possibly bypass network restrictions
* highly customizable
"""
InstallHead="""
# merimnaVM Installer
"""     

LINES = ["KDE Plasma (Heavy)", "XFCE4 (Lightweight)", "I3 (Very Lightweight)", "GNOME 42 (Very Heavy)", "Cinnamon", "LXQT"]

class InstallScreen(Screen):
    CSS_PATH = "installer.tcss"

    def compose(self) -> ComposeResult:
        yield Header()
        yield Markdown(InstallHead)
        yield Horizontal (
        Vertical (
         Label("Programming & Development"),
         SelectionList[int]( 
            ("Python 3", 0, True),
            ("OpenJDK 8 (jre)", 1, True),
            ("OpenJDK 17 (jre)", 2, True),
            ("VSCodium", 3, True),
            ("Git", 4, True),
            ("Node.js", 5),
            id="programming"
        ),),
        Vertical (
         Label("Utilities"),
         SelectionList[int]( 
            ("VLC Media Player", 0),
            ("LibreOffice", 1),
            ("Synaptic Package Manager", 2),
            id="utilities"
        ),),
        )

        yield Vertical (
         Horizontal(
            Label("\nDesktop Environement :"),
            Select(id="de", value="KDE Plasma (Heavy)", options=((line, line) for line in LINES)),
        ),)
        yield Horizontal (
            Button.error("Back", id="back"),
            Button.warning("Install NOW", id="in"),
        )
    def on_button_pressed(self, event: Button.Pressed) -> None:
        if event.button.id == "back":
            app.pop_screen()
        if event.button.id == "in":
            data = {"programming": self.query_one("#programming").selected, "utilities": self.query_one("#utilities").selected, "enablekvm": True, "DE": self.query_one("#de").value}
            savejson(data)
            app.exit()

class InstallApp(App):
    CSS_PATH = "installer.tcss"

    def compose(self) -> ComposeResult:
        yield Header()
        yield Markdown(Head)
        
        yield Vertical (
            Button.success("Install", id="install"),
        )
    def on_button_pressed(self, event: Button.Pressed) -> None:
        if event.button.id == "cancel":
            print("")
        if event.button.id == "install":
            self.push_screen(InstallScreen())
            
if __name__ == "__main__":
    app = InstallApp()
    app.run()
