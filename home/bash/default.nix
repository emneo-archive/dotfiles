{ ... }:
{
  programs.bash = {
    enable = true;

    initExtra =
      (builtins.readFile ./.bashrc);
  };
}
