class Cockup < Formula
  desc "Yet another backup tool for various configurations"
  homepage "https://github.com/huaium/cockup"
  if Hardware::CPU.arm?
    url "https://github.com/huaium/cockup/releases/download/v0.2.1/cockup-v0.2.1-aarch64-apple-darwin.tar.gz"
    sha256 "f2f3ac49d5762dddf981675591bef8f195b98babbbfd3854d053493f2e192559"
  else
    url "https://github.com/huaium/cockup/releases/download/v0.2.1/cockup-v0.2.1-x86_64-apple-darwin.tar.gz"
    sha256 "5febff9fda8b471bc223c8cf0d3b25886224b27f29098513a6ffa57debe2b14d"
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
