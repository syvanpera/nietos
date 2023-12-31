{ pkgs, eachDefaultSystem }:

{
  mkEnv = { name ? "", toolchains ? [], packages ? [], shellHook ? "" }:
    eachDefaultSystem (system: {
      devShells.default = pkgs.mkShell {
        name = name;
        packages = toolchains ++ packages;
        inherit shellHook;
      };
    });

  toolchains = import ./toolchains { inherit pkgs; };
}
