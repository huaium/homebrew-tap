class Cockup < Formula
  desc "Yet another backup tool for various configurations"
  homepage "https://github.com/huaium/cockup"
  if Hardware::CPU.arm?
    url "https://github.com/huaium/cockup/releases/download/v0.2.2/cockup-v0.2.2-aarch64-apple-darwin.tar.gz"
    sha256 "f1f66f8f2a1d5b6346dacf1b8bdea11f2f79d983b8c224072e7be4a62eefe9fe"
  else
    url "https://github.com/huaium/cockup/releases/download/v0.2.2/cockup-v0.2.2-x86_64-apple-darwin.tar.gz"
    sha256 "05ca8030d22a62ecd4eda255861bf472a5db6bf592379f4098197e5508ce8b40"
  end

  version "0.2.2"
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
