"""Music widget"""
from typing import List
import subprocess

from libqtile import qtile
from libqtile.widget import base


def get_stdout(cmd: List[str]) -> str:
    try:
        sub = subprocess.run(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            timeout=2
        )
    except (TimeoutError, FileNotFoundError):
        return ""
    if sub.stderr is not None:
        return ""
    return sub.stdout.decode("utf-8").strip()


class MusicNowPlaying(base.InLoopPollText):
    def __init__(self, **config):
        super().__init__("", update_interval=5, qtile=qtile, **config)
        self.name = "Now playing"

    def poll(self) -> str:
        is_playing = get_stdout(["playerctl", "status"])
        if is_playing != "Playing":
            return ""
        artist = get_stdout(["playerctl", "metadata", "artist"])
        title = get_stdout(["playerctl", "metadata", "title"])
        if artist == "" or title == "":
            return ""
        return f"𝄞 {artist} - {title}"
