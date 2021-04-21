{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "pulumi";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "pulumi";
    repo = "pulumi";
    rev = "v${version}";
    sha256 = "sha256-f9GMg+XS/MAdxHmPGpFBa+pt5K5rpC/t6FHbCtNq3Eg=";
  };
  vendorSha256 = "sha256-iIGRweASrrJwQfMEOLcXr0fpqP+p5litvYxHuXBp31w=";

  doCheck = false;

  modRoot = "./pkg";
  subPackages = [ "cmd/pulumi" ];

  preBuild = ''
    pushd ..
    patchShebangs ./scripts
    export PULUMI_VERSION=v${version}
    make generate SHELL=bash
    popd
  '';

  meta = with lib; {
    description = "Modern Infrastructure as Code tool";
    homepage = "https://www.pulumi.com/";
    license = licenses.asl20;
    maintainers = with maintainers; [ euank ];
    platforms = platforms.unix;
  };
}
