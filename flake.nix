{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs {
          inherit system;
        };
      });
    in
    {

      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            ccls
            llvmPackages_latest.clang-unwrapped
            llvmPackages_latest.llvm
            llvmPackages_latest.openmp
            llvmPackages_latest.lld
            llvmPackages_latest.bintools
            llvmPackages_latest.libcxx
            llvmPackages_latest.compiler-rt
            llvmPackages_latest.libunwind

            meson
            mesonlsp
            ninja
          ];
        };
      });
    };
}
