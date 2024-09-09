{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = [
    # NodeJS
    pkgs.nodejs

    # Nix
    pkgs.nil
  ];

  shellHook = ''
    export PS1="\n[nix-shell\w]$ "
  '';
}
