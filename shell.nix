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
}
