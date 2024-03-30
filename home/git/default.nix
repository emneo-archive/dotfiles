{ ... }:
{
  home.file.git_config = {
    source = ./.gitconfig;
    target = ".gitconfig";
  };
}
