{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "crd2pulumi";
  version = "1.0.7";

  src = fetchFromGitHub {
    owner = "pulumi";
    repo = "crd2pulumi";
    rev = "v${version}";
    sha256 = "sha256-58p7/W+47nTjJHIq3KmeB4+jLmgvDtM7UA+NZHB5j8c=";
  };
  vendorSha256 = "sha256-baTGg8kydp9FxxsGiP7SCQGhgODs+4fH7dkS74TaJXY=";

  buildFlagsArray = [ "-ldflags=-X github.com/pulumi/crd2pulumi/gen.Version=v${version}" ];

  doCheck = false;

  meta = with lib; {
    description = "Generate typed CustomResources from a Kubernetes CustomResourceDefinition";
    homepage = "https://www.pulumi.com/";
    license = licenses.asl20;
    maintainers = with maintainers; [ euank ];
    platforms = platforms.unix;
  };
}
