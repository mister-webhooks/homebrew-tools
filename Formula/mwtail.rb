class Mwtail < Formula
  desc "Mister Webhooks console consumer"
  homepage "https://github.com/mister-webhooks/mwtail"
  url "https://github.com/mister-webhooks/mwtail/archive/refs/tags/v0.4.0-pre0.tar.gz"
  sha256 "b918486de2da70c214d63c3fbc218909585bdaaa0b3539ca9ea6a0137e2a7b28"
  license "BSD-2-Clause"

  bottle do
    root_url "https://github.com/mister-webhooks/homebrew-tools/releases/download/mwtail-0.4.0-pre0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2f1f6548bc09883ee8e72f8cd951a7a86b1822c85468a2e904e6f46e05b2ab17"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "3a43e4e8b572f7ebcfddde0066e5e2b817d28e898216c42bb207b8f764624b2a"
    sha256 cellar: :any_skip_relocation, ventura:       "c2f53363430217c1c916791bcc7d5f5a1b673f9ad512e05edc8f3e5f5055e18d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d5b02e10c6887ffe483cf6d4d98e093065e29020529519e7d692026302896c28"
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
