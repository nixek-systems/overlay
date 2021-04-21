{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "pulumi-sdk";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "pulumi";
    repo = "pulumi";
    rev = "v${version}";
    sha256 = "sha256-f9GMg+XS/MAdxHmPGpFBa+pt5K5rpC/t6FHbCtNq3Eg=";
  };
  vendorSha256 = "sha256-WhkEiZu0EcjeYcH0vpMweeF1Gn84WMt7WZXvgMfKrbA=";

  doCheck = false;

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
