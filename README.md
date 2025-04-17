<div align="center">
    <h1>HyprDots</h1>
</div>

This project shows how to make Linux look good with Hyprland and NixOS, using only Nix for a reproducible setup anyone can copy.

> [!WARNING]
> This repository is under development!

<div align="center">
    <h1>Review</h1>
    <h4></h4>
</div>

![This image did not load](./.github/assets/screenshot/main.png)

<div align="center">
    <h2>Overview</h2>
    <h4></h4>
</div>

<details>
<summary>Installation Guide</summary>

1. **Identify the target disk**:

   ```bash
   lsblk
   ```

   Note the disk (e.g., `/dev/nvme0n1`). Double-check to avoid data loss.

2. **Obtain a disko layout**:
   Clone a repository with a `disko.nix` file or create your own:

   ```bash
   git clone https://github.com/LinuxFamily/LuneDots
   ```

   Ensure `disko.nix` matches your disk and partition needs.

3. **Format the disk**:
   Run `disko` to partition and format the disk (this erases all data):

   ```bash
   sudo nix run github:nix-community/disko -- --mode disko ./LuneDots/path/to/disko.nix --arg device '"/dev/nvme0n1"'
   ```

4. **Generate hardware configuration**:
   Create a `hardware-configuration.nix` file:

   ```bash
   sudo nixos-generate-config --no-filesystems --root .
   ```

5. **Set up host configuration**:
   Copy the generated file to your host directory:

   ```bash
   mkdir -p ./LuneDots/hosts/io
   cp ./etc/nixos/hardware-configuration.nix ./LuneDots/hosts/io/
   ```

6. **Install NixOS**:
   Install the system to `/mnt` using the flake:

   ```bash
   nixos-install --root /mnt --flake ./LuneDots#io
   ```

   Set a root password with `passwd` or configure SSH keys if prompted.

7. **Reboot**:
   Unmount filesystems and reboot:
   ```bash
   umount -R /mnt
   reboot
   ```
   </details>

<details>
<summary>Technologies</summary>

- **Hyprland**: Dynamic tiling Wayland compositor that looks great.
  [github.com/hypwm/hyprland](https://github.com/hypwm/hyprland)
- **Hyprpaper**: Wallpaper tool for Hyprland.
  [github.com/hyprwm/hyprpaper](https://github.com/hyprwm/hyprpaper)
- **Hyprlock**: Hyprland's simple, yet multi-threaded and GPU-accelerated screen locking utility.
  [github.com/hyprwm/hyprlock](https://github.com/hyprwm/hyprlock)
- **Hyprcontrib**: grimblast - A Hyprland version of Grimshot.
  [github.com/hyprwm/contrib](https://github.com/hyprwm/contrib)
- **Agsv2**: CLI for Astal+TypeScript frameworks.
  [github.com/Aylur/ags/tree/v3](https://github.com/Aylur/ags/tree/v3)
- **Ghostty**: Fast, modern terminal emulator.
  [github.com/ghostty-org/ghostty](https://github.com/ghostty-org/ghostty)
- **Zen-Browser**: Firefox fork for a nicer browsing experience.
  [github.com/zen-browser/desktop](https://github.com/zen-browser/desktop)
- **Zed-editor**: Fast Rust-based IDE with cool features.
[github.com/zed-industries/zed](https://github.com/zed-industries/zed)

  </details>
<div align="center">
    <h2> Thanks! </h2>
    <h4></h4>
</div>
