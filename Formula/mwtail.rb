class Mwtail < Formula
  desc "Mister Webhooks console consumer"
  homepage "https://github.com/mister-webhooks/mwtail"
  url "https://github.com/mister-webhooks/mwtail/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "d0cf3d1c5252526911afcda901ec5c76c03712a37b55fecebd14fd7331957885"
  license "BSD-2-Clause"

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
