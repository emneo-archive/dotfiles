from .defaults import widget_defaults
from .overides import (
    Battery,
    Clock,
    CPUGraph,
    GroupBox,
    Memory,
    Prompt,
    QuickExit,
    Separator,
    TaskList,
    Systray
)

from .music import MusicNowPlaying
from .wttr import Wttr

__all__ = (
    "widget_defaults",
    "Battery",
    "Clock",
    "CPUGraph",
    "GroupBox",
    "Memory",
    "Prompt",
    "QuickExit",
    "Separator",
    "MusicNowPlaying",
    "Wttr",
    "TaskList",
    "Systray",
)
