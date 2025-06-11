class Mwtail < Formula
  desc "Mister Webhooks console consumer"
  homepage "https://github.com/mister-webhooks/mwtail"
  url "https://github.com/mister-webhooks/mwtail/archive/refs/tags/v0.3.0-pre0.tar.gz"
  sha256 "6d827f26401612816c189729f051a64606553de3daefc8bf3b2adbe9a17f86d0"
  license "BSD-2-Clause"

  bottle do
    root_url "https://github.com/mister-webhooks/homebrew-tools/releases/download/mwtail-0.3.0-pre0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2b7308cf1bb05ed7622700a9f22f9f90e49aeeafcfcc1685b283629c129a8d3e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5f5191542c92c03114b83132b955f093a3b6d3155968595dc8aa578598395a44"
    sha256 cellar: :any_skip_relocation, ventura:       "861ecb4d7bcaee89c39077559dbe39fafe851cda30fbe5a135f1d780c80ab9bc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "25c8d18e944c2285e1b6eb2b5061828a076d8cc12f5ce4fb5a577a929e061a0b"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./mwtail"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system bin/"mwtail", "-help"
  end
end
