class Mwtail < Formula
  desc "Mister Webhooks console consumer"
  homepage "https://github.com/mister-webhooks/mwtail"
  url "https://github.com/mister-webhooks/mwtail/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "d0cf3d1c5252526911afcda901ec5c76c03712a37b55fecebd14fd7331957885"
  license "BSD-2-Clause"

  bottle do
    root_url "https://github.com/mister-webhooks/homebrew-tools/releases/download/mwtail-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1ada6e8b71c9b577e1d68bbd587e872db1433cdbbee81a26fcc35f6cc4a9c168"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "86344cac3a49ebae6950c2bbe0d46b7af6f4f9810101ff3e8d4664f221c0d2d6"
    sha256 cellar: :any_skip_relocation, ventura:       "4135ebb399c29cb66031591942936a59df8b9339bce6522f699d2fdabe589c1e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cc1e22a7e28d7d4e9fe5df083b2310ae800f3666471cda11920015d8014deb1b"
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
