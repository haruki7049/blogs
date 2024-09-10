{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        lib = pkgs.lib;
        stdenv = pkgs.stdenv;
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        zig = pkgs.zig_0_13;
        blogs = stdenv.mkDerivation {
          pname = "blogs";
          version = "dev";

          src = lib.cleanSource ./.;

          nativeBuildInputs = [
            zig.hook
          ];
        };
      in
      {
        formatter = treefmtEval.config.build.wrapper;

        checks = {
          formatting = treefmtEval.config.build.check self;
        };

        devShells.default = pkgs.mkShell {
          packages = [
            # Nix
            pkgs.nil

            # Ziglang
            zig
            pkgs.zls
          ];

          shellHook = ''
            export PS1="\n[nix-shell\w]$ "
          '';
        };
      }
    );
}
