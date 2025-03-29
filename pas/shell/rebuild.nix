{ pkgs }:

pkgs.writeShellApplication {
  name = "rebuild";
  text = /*bash*/ ''
    pushd "$HOME"/nixos-config

    echo "== Git diff =="
    git diff -U0 --color=always | less -R
    echo -e "\n== Git add =="
    git add ./* || true
    echo -e "\n== Switching to Nixos with Configuration in ~/nixos-config/ =="
    sudo nixos-rebuild switch --flake . 2>&1 | tee nixos-last-switch.log
    echo -e "\n== Committing to git =="
    gen=$(nixos-rebuild list-generations | grep current | awk '{ print $1,$3,$4,$5,$6 }')
    git commit -am "$gen"

    popd
  '';
}
