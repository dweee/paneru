{
  description = "A sliding, tiling window manager for MacOS";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts/ea2630b7470978622c7689a1ff75d2b389175399";
    import-tree.url = "github:vic/import-tree/eb1b52eaecc57f7c136d07ae8a93e724dfecac46";
    nixpkgs.url = "github:nixos/nixpkgs/0bb2eedc20e4739f29e8045034f2828ad7054f8f";
    crane.url = "github:ipetkov/crane/8782adaf7e415975d2737b41ccca93b08a8f7d9f";
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
