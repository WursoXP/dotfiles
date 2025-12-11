if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x LS_COLORS "di=01;36:ln=01;35:ex=01;32:bd=01;34:cd=01;34:pi=01;33:so=01;33:su=01;31:sg=01;31:tw=01;34:ow=01;34:mi=01;31:or=01;31:ca=01;37:mh=00:cl=01;37:st=01;37"

    set $RestoEsquerda jobs direnv bun node python rustc java php pulumi ruby go gcloud kubectl distrobox toolbox terraform aws nix_shell crystal elixir zig

    set --universal tide_context_always_display true
    set --universal tide_context_color_default 4ecc8f
    set --universal tide_context_hostname_parts 1
    set --universal tide_character_color 43cc8f
    set --universal tide_left_prompt_items context pwd git newline character $RestoEsquerda
    set --universal tide_right_prompt_items status time
end
