class Cockup < Formula
  include Language::Python::Virtualenv

  desc "Yet another backup tool for various configurations"
  homepage "https://github.com/huaium/cockup"
  url "https://files.pythonhosted.org/packages/b0/0b/5d298e94fed2a03a499fd82cbd573287881b79617a95c65296d732b1bd81/cockup-0.1.8.tar.gz"
  sha256 "63cdbc24ab3dacf886b1a183c445b26d39c0efed55881a16fef230a790388a25"
  license "MIT"
  head "https://github.com/huaium/cockup.git", branch: "main"

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc/click-8.2.1.tar.gz"
    sha256 "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/ca/6c/3d75c196ac07ac8749600b60b03f4f6094d54e132c4d94ebac6ee0e0add0/termcolor-3.1.0.tar.gz"
    sha256 "6a6dd7fbee581909eeec6a756cff1d7f7c376063b14e4a298dc4980309e55970"
  end

  def install
    virtualenv_install_with_resources

    generate_completions_from_executable(
      bin/"cockup",
      shells:                 [:bash, :zsh, :fish],
      shell_parameter_format: :click,
    )
  end

  test do
    system bin/"cockup", "-h"
  end
end
