class Cockup < Formula
  desc "Yet another backup tool for various configurations"
  homepage "https://github.com/huaium/cockup"
  version = "0.2.3"

  if Hardware::CPU.arm?
    url "https://github.com/huaium/cockup/releases/download/v#{version}/cockup-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "260d7f3b3d42cb65b61cf4fa83bc94652d9ba849c6270e7c077f854bdb2a60a4"
  else
    url "https://github.com/huaium/cockup/releases/download/v#{version}/cockup-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "eb95a2f3e32991e3c92e9ac7bf58f34c53e8ae5dc061d2e25a9133f00a354952"
  end

  license "MIT"

  depends_on :macos

  def install
    bin.install "cockup"
    generate_completions_from_executable(bin/"cockup", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cockup --version")
    assert_match "complete", shell_output("#{bin}/cockup completions bash")
  end
end
