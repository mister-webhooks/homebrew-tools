class Mwcat < Formula
  desc "Mister Webhooks console consumer"
  homepage "https://github.com/mister-webhooks/mwcat"
  url "https://github.com/mister-webhooks/mwcat/archive/refs/tags/v0.2.0-pre0.tar.gz"
  sha256 "74c2321f41247cd7a34cd37b3239629c4f94277a4d6403449a9ad0630f8931d4"
  license "BSD-2-Clause"

  bottle do
    root_url "https://github.com/mister-webhooks/homebrew-tools/releases/download/mwcat-0.1.2-pre2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dc55e930d2ad38321ec4fff221cfbba3ca0ae2b1cb9ec29de8fbb8a6372f77cf"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "8e4f166d8aee77b97667ece27146a5d83b8026cbe0856ebe3284e57ac1da8d62"
    sha256 cellar: :any_skip_relocation, ventura:       "94a6e372a78bfe0855201382791b9176c4c887836df90be8b5ba1f3adb6f9db5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "261c9415088e30bc60f947184b37e234e66d6ee286a16e3a95824c812210b045"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./mwcat"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system bin/"mwcat", "-help"
  end
end
