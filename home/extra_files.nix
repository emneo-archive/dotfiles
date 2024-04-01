{ ... }:
{
  home.file = {
    wallpaper = {
      source = ./../assets/wallpaper.png;
      target = "assets/wallpaper.png";
    };
    backup_script = {
      source = ./backup.sh;
      target = "backup.sh";
    };
  };
}
