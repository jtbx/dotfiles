## dotfiles

My NixOS configuration and home-manager dotfiles.

The NixOS configuration can be found in nixos/
and my home-manager configs are in home-manager/.

### Hierarchy

```
/etc/nixos +
           |- configuration.nix
           |- boot-configuration.nix
           |- hardware-configuration.nix
           |- packages.nix

/home/jeremy +
             |- .config +
                        |- home-manager +
                                        |- flake.nix
                                        |- flake.lock
                                        |- home.nix
                                        |- packages.nix
                                        |- dotfiles +
                                                    |- default.nix
                                                    |- dunst.nix
                                                    |- foot.nix
                                                    |- fuzzel.nix
                                                    |- fzf.nix
                                                    |- gtk.nix
                                                    |- hyprland.nix
                                                    |- qt.nix
                                                    |- waybar.nix
                                                    |- zsh.nix
```

configuration.nix imports boot-configuration.nix, hardware-configuration.nix, and packages.nix.

home.nix imports packages.nix and dotfiles/default.nix, which imports all of the other files in dotfiles/.
