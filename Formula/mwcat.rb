class Mwcat < Formula
  desc "Mister Webhooks console consumer"
  homepage "https://github.com/mister-webhooks/mwcat"
  url "https://github.com/mister-webhooks/mwcat/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6f98a58f9156eeff1b2a1b2e9a055f65b1bbceeaad4a757a394243ad6203ae6e"
  license "BSD-2-Clause"

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
