{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    flake-compat.url = "github:edolstra/flake-compat";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      perSystem =
        { pkgs, ... }:
        let
          # This app needed Emacs to run `make`
          build = {
            type = "app";
            program = pkgs.writeShellApplication {
              name = "build-script";
              runtimeInputs = [
                pkgs.emacs-nox
                pkgs.gnumake
              ];

              text = ''
                make
              '';
            };
          };
          clean = {
            type = "app";
            program = pkgs.writeShellApplication {
              name = "clean-script";
              runtimeInputs = [
                pkgs.emacs-nox
                pkgs.gnumake
              ];

              text = ''
                make clean
              '';
            };
          };
        in
        {
          treefmt = {
            projectRootFile = "flake.nix";
            programs.nixfmt.enable = true;
            programs.actionlint.enable = true;
          };

          apps = {
            inherit build clean;
            default = build;
          };

          devShells.default = pkgs.mkShell {
            packages = [
              pkgs.nil
              pkgs.emacs-nox
            ];

            shellHook = ''
              export PS1="\n[nix-shell\w]$ "
            '';
          };
        };
    };
}
