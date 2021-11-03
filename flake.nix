{
  description = "The nixek overlay";

  outputs = { self, nixpkgs }: rec {
    overlay = final: prev: {
      pulumi = final.callPackage ./pkgs/tools/admin/pulumi {};
      pulumi-sdk = final.callPackage ./pkgs/tools/admin/pulumi/sdk.nix {};
      kube2pulumi = final.callPackage ./pkgs/tools/admin/kube2pulumi {};
      crd2pulumi = final.callPackage ./pkgs/tools/admin/crd2pulumi {};

      kpt = final.callPackage ./pkgs/applications/networking/cluster/kpt {};
    };

    packages.x86_64-linux = (import nixpkgs { system = "x86_64-linux"; overlays = [ self.overlay ]; });
  };
}
