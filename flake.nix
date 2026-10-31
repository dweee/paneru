{
  description = "A sliding, tiling window manager for MacOS";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts/024633cd702b10285db5cb19b40ad48d2399ba60";
    import-tree.url = "github:vic/import-tree/eb1b52eaecc57f7c136d07ae8a93e724dfecac46";
    nixpkgs.url = "github:nixos/nixpkgs/1c89083e451e891152365b799595cf7790a43325";
    crane.url = "github:ipetkov/crane/e675a36b7377bebe41d548388a2501cbb16d380d";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/ff0e21a414d4547183396da1b44a66f2577b65e9";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { lib, self, ... }:
      {
        imports = [ (inputs.import-tree ./nix) ];
        systems = [ "aarch64-darwin" ];
        flake = {
          overlays.default = final: prev: {
            paneru = self.packages.aarch64-darwin.default;
          };
        };
        perSystem =
          { config, pkgs, ... }:

          {

            # Run `nix fmt .` to format all nix files in the repo.
            # `nixfmt-tree` allows passing a directory to format all files within it.
            formatter = pkgs.nixfmt-tree;

          };
      }
    );
}
