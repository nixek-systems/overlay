{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "pulumi";
  version = "3.2.1";

  src = fetchFromGitHub {
    owner = "pulumi";
    repo = "pulumi";
    rev = "v${version}";
    sha256 = "sha256-Bv1kdlm1u021DCsXVHV7PL27mHAObJlz0txS6za1w20=";
  };
  vendorSha256 = "sha256-GeDcorNNhRykkAV+Fo8EIhjar1h0X8zxmh0iCNKTYFw=";

  buildFlagsArray = [ "-ldflags=-X github.com/pulumi/pulumi/pkg/v3/version.Version=v${version}" ];

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
