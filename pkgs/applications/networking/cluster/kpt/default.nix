{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "kpt";
  version = "1.0.0-beta.7";

  src = fetchFromGitHub {
    owner = "GoogleContainerTools";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-k10TCz6M4ylakDa4zYvdTKrKhPGvW4U30xaLAly0dtA=";
  };

  vendorSha256 = "sha256-wZgUp/NKF62y7GfOIS19SkZmyvtTq2mIGnIJW3c9K9s=";

  subPackages = [ "." ];

  ldflags = [ "-s" "-w" "-X github.com/GoogleContainerTools/kpt/run.version=${version}" ];

  meta = with lib; {
    description = "A toolkit to help you manage, manipulate, customize, and apply Kubernetes Resource configuration data files";
    homepage = "https://googlecontainertools.github.io/kpt/";
    license = licenses.asl20;
    maintainers = with maintainers; [ euank ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
