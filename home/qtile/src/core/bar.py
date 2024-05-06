from libqtile import bar, widget

from utils import Color
from widgets import (
    Battery,
    Clock,
    CPUGraph,
    GroupBox,
    Memory,
    Prompt,
    QuickExit,
    Separator,
    MusicNowPlaying,
    Wttr,
    Systray,
)


class Bar(bar.Bar):
    def __init__(self, id_):
        self.id = id_
        super().__init__(
            widgets=self._build_widgets(),
            size=24,
            background=Color.BG_DARK,
            margin=[0, 0, 8, 0]
        )

    def _build_widgets(self):
        widgets_copy = [
          GroupBox(),
          widget.Spacer(length=bar.STRETCH),
          Prompt(),
          Wttr(),
          MusicNowPlaying(),
          Battery(),
          Memory(),
          CPUGraph(),
          Separator(),
          widget.Volume(),
          Clock(),
          Separator(),
          QuickExit(),
        ]

        if self.id == 0:
            widgets_copy.insert(13, Systray())
        return widgets_copy

