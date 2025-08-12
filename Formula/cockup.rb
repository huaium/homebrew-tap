class Cockup < Formula
  include Language::Python::Virtualenv

  desc "Yet another backup tool for various configurations"
  homepage "https://github.com/huaium/cockup"
  url "https://github.com/huaium/cockup/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e34bedf2b52179bcead9a323aee9f0a0867301fa40dec7d2c94e24e952b21e8e"
  license "MIT"
  head "https://github.com/huaium/cockup.git", branch: "main"

  depends_on "python@3.12"

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/fe/75/af448d8e52bf1d8fa6a9d089ca6c07ff4453d86c65c145d0a300bb073b9b/rich-14.1.0.tar.gz"
    sha256 "e497a48b844b0320d45007cdebfeaeed8db2a4f4bcf49f15e455cfc4af11eaa8"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc/click-8.2.1.tar.gz"
    sha256 "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"cockup", "-h"
  end
end
