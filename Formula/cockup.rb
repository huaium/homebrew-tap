class Cockup < Formula
  desc "Yet another backup tool for various configurations"
  homepage "https://github.com/huaium/cockup"
  version "0.2.0"
  license "MIT"
  revision 1

  depends_on :macos

  on_arm do
    url "https://github.com/huaium/cockup/releases/download/v0.2.0/cockup-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "ab9484446a1229082f82ba405feb6cd628368e1b6eb9a25b9c91eb1e7c42c32e"
  end

  on_intel do
    url "https://github.com/huaium/cockup/releases/download/v0.2.0/cockup-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "d31c15c55bebb61cf6ede557d32e184f4e0db4e570410579997b22dd9c4ef3f9"
  end

  def install
    bin.install "cockup"
    generate_completions_from_executable(bin/"cockup", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cockup --version")
    assert_match "complete", shell_output("#{bin}/cockup completions bash")
  end
end
