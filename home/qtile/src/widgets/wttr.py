"""wttr widget"""
from typing import List
import subprocess

from libqtile import qtile
from libqtile.widget import base


def get_stdout(cmd: List[str]) -> str:
    try:
        sub = subprocess.run(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            timeout=10
        )
    except (TimeoutError, FileNotFoundError):
        return ""
    if sub.stderr is not None:
        return ""
    return sub.stdout.decode("utf-8").strip()


class Wttr(base.InLoopPollText):
    def __init__(self, **config):
        super().__init__("", update_interval=60, qtile=qtile, **config)
        self.name = "Weather: "

    def poll(self) -> str:
        current_wttr = get_stdout(["curl", "https://wttr.in/toulouse?format=2"])
        if not current_wttr:
            return "wttr..."
        return current_wttr
