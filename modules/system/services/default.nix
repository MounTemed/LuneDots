{ pkgs, ... }:
{
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    dconf
  ];
}
