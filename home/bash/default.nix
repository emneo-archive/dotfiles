{ ... }:
{
  home.file = {
    bash_config = {
      source = ./.bashrc;
      target = ".bashrc";
    };
    bash_profile_config = {
      source = ./.bash_profile;
      target = ".bash_profile";
    };
  };
}
