class Mwcat < Formula
  desc "Mister Webhooks console consumer"
  homepage "https://github.com/mister-webhooks/mwcat"
  url "https://github.com/mister-webhooks/mwcat/archive/refs/tags/v0.1.2-pre1.tar.gz"
  sha256 "0eda98ae4ac3041e6ed8f606a21ec4dcca8af6113c2f1eb36bc68297b271f4c9"
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
