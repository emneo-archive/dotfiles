{ ... }:
{
  home.file.tmux_config = {
    source = ./tmux.conf;
    target = ".config/tmux/tmux.conf";
  };
}
