# Meu Dotfiles :D

Configurações pessoais do meu arch linux atual

## O que tem aqui?

- Nvim configs
- Configs gerais do sistema (Sway, Waybar, Foot)
- Alguns arquivos para funcionar 2 gits no pc

## Programas Importantes

- editor: nvim
- terminais: foot, kitty
- teclado: fcitx5
- otimizações: supergfxctl, ppd (ou tlp), asusctl, thermald
- greet: agreety
- compositor: sway
- bar: waybar
- screenshot: simshot (mthuss)
- idle: swayidle
- navegadores: zen, firefox
- notificações: swaync
- lock: hyprlock
- files: yazi

## Ctrl-C Ctrl-V

### Fonts
```
sudo pacman -Syu ttf-liberation ttf-jetbrains-mono-nerd otf-font-awesome noto-fonts-emoji 
```

## Workstation
```
sudo pacman -Syu nvim kitty greetd sway waybar hypershot swayidle firefox swaync hyprlock yay yazi fcitx5
```
```
yay --noconfirm zen-browser-bin
```
```
sudo pacman -Syu less trash-cli fcitx5 imagemagick tectonic mermaid-cli ghostscript lazygit
```
```
sudo pacman -Syu frameworkintegration
```
```
yay darkly-bin
```
## Remover greeter

`sudo pacman -Syu greetd`

```
[terminal]
vt = 1

[initial_session]
command = "sway"
user = "teuusuario"
# se for nvidia adicione isso"
[default_session]
command = "agreety -cmd sway --unsupported-gpu"
user = "teu usuario"
```

## Boot Rapido

`boot/loader/entries/linux-cachyos.conf`

em options remover splash e quiet

`sudo nvim /etc/vconsole.conf`

```
KEYMAP=br-abnt2
XKBLAYOUT=br
XKBMODEL=abnt2
XKBOPTIONS=terminate:ctrl_alt_bksp
```
ou aprende a utilizar o systemd-localed/systemd-firstboot :P

`sudo nvim /etc/mkinitcpio.conf`

`HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block filesystems fsck)`

## Simshot

`https://github.com/mthuss/simshot#`

## Symlinks

`stow -nvt ~ .`

esse comando permite ver os symlinks criados,
recomendações:
    Criar estes caminhos antes de realizar o stow:
    ~/Pictures
    .config/fish
Não recomendo fazer stow do conf do sway.
