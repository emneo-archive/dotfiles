{ ... }:
{
  services.betterlockscreen = {
    enable = true;
    arguments = [ "-u ~/assets/wallpaper.png" ];
  };

  home.file.betterlockscreenrc = {
    source = ./betterlockscreenrc;
    target = ".config/betterlockscreen/betterlockscreenrc";
  };

  #  home.file.lockscreen = {
  #    source = ./../../assets/lockscreen.png;
  #    target = "assets/lockscreen.png";
  #  };
}
