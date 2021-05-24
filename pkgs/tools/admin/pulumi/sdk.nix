{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "pulumi-sdk";
  version = "3.2.1";

  src = fetchFromGitHub {
    owner = "pulumi";
    repo = "pulumi";
    rev = "v${version}";
    sha256 = "sha256-Bv1kdlm1u021DCsXVHV7PL27mHAObJlz0txS6za1w20=";
  };
  vendorSha256 = "sha256-WhkEiZu0EcjeYcH0vpMweeF1Gn84WMt7WZXvgMfKrbA=";


  doCheck = false;
  buildFlagsArray = [ "-ldflags=-X github.com/pulumi/pulumi/pkg/v3/version.Version=v${version}" ];
  modRoot = "./sdk";
  subPackages = [ "nodejs/cmd/pulumi-language-nodejs" ];

  meta = with lib; {
    description = "Modern Infrastructure as Code tool";
    homepage = "https://www.pulumi.com/";
    license = licenses.asl20;
    maintainers = with maintainers; [ euank ];
    platforms = platforms.unix;
  };
}
