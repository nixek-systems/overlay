{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "kube2pulumi";
  version = "0.0.8";

  src = fetchFromGitHub {
    owner = "pulumi";
    repo = "kube2pulumi";
    rev = "v${version}";
    sha256 = "sha256-p51HOgrb7GfsU6MsndDXkErofN9hpw4HPXKnbzG0Nb8=";
  };
  vendorSha256 = "sha256-0ujtuidGHrVe9Abam4mVz/ZvwBisihOzFsSYDEJzivg=";

  # https://github.com/pulumi/kube2pulumi/blob/9809268a81c139373572713549b5560e847eb6e9/.goreleaser.yml
  buildFlagsArray = [ "-ldflags=-X github.com/pulumi/kube2pulumi/pkg/version.Version=v${version}" ];

  doCheck = false;

  meta = with lib; {
    description = "Convert kubernetes yaml into pulumi code";
    homepage = "https://www.pulumi.com/";
    license = licenses.asl20;
    maintainers = with maintainers; [ euank ];
    platforms = platforms.unix;
  };
}
