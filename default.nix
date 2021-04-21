self: super: rec {

  pulumi = super.callPackage ./pkgs/tools/admin/pulumi {};

  pulumi-sdk = super.callPackage ./pkgs/tools/admin/pulumi/sdk.nix {};

  kube2pulumi = super.callPackage ./pkgs/tools/admin/kube2pulumi {};

}
