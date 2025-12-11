class Cockup < Formula
  include Language::Python::Virtualenv

  desc "Yet another backup tool for various configurations"
  homepage "https://github.com/huaium/cockup"
  url "https://files.pythonhosted.org/packages/83/f9/3310050eb39fc97e367df355260069be68e5952d135cabb784d5cd45a2c2/cockup-0.1.9.tar.gz"
  sha256 "887a010d784a9a1b59f909996959ac94625d1489e0b8f910c92ec0f25ada7cf9"
  license "MIT"
  head "https://github.com/huaium/cockup.git", branch: "main"

  depends_on "python@3.13"

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
