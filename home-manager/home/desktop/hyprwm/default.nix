{
  inputs,
  pkgs,
  systems,
  ...
}:
{
  imports = [
    ./hyprcontrib
    ./hyprland
    ./hyprlock
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${systems}.hyprpaper;
  };
}
