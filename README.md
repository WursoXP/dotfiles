# Meu Dotfiles :D

Configurações pessoais do meu arch linux atual

## O que tem aqui?

- Nvim configs
- Configs gerais do sistema (Sway, Waybar, Foot)
- Alguns arquivos para funcionar 2 gits no pc

## Programas Importantes

- editor: nvim
- terminais: foot, kitty
- teclado: ibus
- otimizações: supergfxctl, ppd (ou tlp), asusctl, thermald
- greet: agreety
- compositor: sway
- bar: waybar
- screenshot: hyprshot
- idle: swayidle
- navegadores: zen, firefox
- notificações: swaync
- lock: hyprlock
- files: nemo

## Ctrl-C Ctrl-V

### Variables
```
export QT_QPA_PLATFORMTHEME=qt6ct
```
### Fonts
```
sudo pacman -Syu ttf-liberation ttf-jetbrains-mono-nerd otf-font-awesome noto-fonts-emoji nemo kservice5 kde-cli-tools
```

## Workstation
```
sudo pacman -Syu nvim kitty greetd sway waybar hypershot swayidle firefox swaync hyprlock yay
```
```
yay --noconfirm zen-browser-bin
```
  
## TODO

- sincronizar essas pastas com as do sistema
