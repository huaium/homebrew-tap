class Cockup < Formula
  desc "Yet another backup tool for various configurations"
  homepage "https://github.com/huaium/cockup"
  url "https://static.crates.io/crates/cockup/cockup-0.2.0.crate"
  sha256 "ee30a9bba757c10bc6f9e77a572d947d0549e73eb76f34538040e584b4a31eb9"
  license "MIT"
  head "https://github.com/huaium/cockup.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"cockup", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cockup --version")
    assert_match "complete", shell_output("#{bin}/cockup completions bash")
  end
end
