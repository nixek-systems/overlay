{
  description = "The nixek overlay";

  outputs = { self, nixpkgs }: rec {
    overlay = final: prev: {
      pulumi = final.callPackage ./pkgs/tools/admin/pulumi {};

      pulumi-sdk = final.callPackage ./pkgs/tools/admin/pulumi/sdk.nix {};

      kube2pulumi = final.callPackage ./pkgs/tools/admin/kube2pulumi {};
    };

    packages.x86_64-linux = (import nixpkgs { system = "x86_64-linux"; overlays = [ self.overlay ]; });
  };
}
