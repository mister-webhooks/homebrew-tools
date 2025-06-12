class Mwtail < Formula
  desc "Mister Webhooks console consumer"
  homepage "https://github.com/mister-webhooks/mwtail"
  url "https://github.com/mister-webhooks/mwtail/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "6300a825ca3bb5de14f116de3ec4ad600f7b9a6825c4b3ae8f8b8780638e2670"
  license "BSD-2-Clause"

  bottle do
    root_url "https://github.com/mister-webhooks/homebrew-tools/releases/download/mwtail-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1608ee869c21001649ac7af6f07cceca630c0122ab998a722929c114deedfe02"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "908b947ee1fa61b481d5a363a414fcdb381f7079873a95dfa2a8eaf54eaa79b8"
    sha256 cellar: :any_skip_relocation, ventura:       "09fc1e3be32e8acd4db135ec95bf9b16d5573b9f960dcc5ddfdad8ebef3c7a3c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1128b42ca644489f4a102918749938a0a18f37b5be4026cc5b3926469540b311"
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
