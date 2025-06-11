class Mwtail < Formula
  desc "Mister Webhooks console consumer"
  homepage "https://github.com/mister-webhooks/mwtail"
  url "https://github.com/mister-webhooks/mwtail/archive/refs/tags/v0.3.0-pre0.tar.gz"
  sha256 "6d827f26401612816c189729f051a64606553de3daefc8bf3b2adbe9a17f86d0"
  license "BSD-2-Clause"

  bottle do
    root_url "https://github.com/mister-webhooks/homebrew-tools/releases/download/mwcat-0.2.0-pre0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9bea5184030e35b9a2e5519049531292d4664881210073ce97c17a1b191e989a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "397a881658109998516c0905c443a136d6e7df73bcbad1804254a25aa9f8a1dd"
    sha256 cellar: :any_skip_relocation, ventura:       "48d3c21e84fe9fc5e98124f70b14a6a552e681291bbe03b4b89ec719f0aa00d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "50cfdee6d06cdeee3477e5292eb9e13020db6f55cbb7f5f25917695edf900cfa"
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
