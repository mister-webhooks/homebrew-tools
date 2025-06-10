class Mwcat < Formula
  desc "Mister Webhooks console consumer"
  homepage "https://github.com/mister-webhooks/mwcat"
  url "https://github.com/mister-webhooks/mwcat/archive/refs/tags/v0.1.2-pre2.tar.gz"
  sha256 "a6845c69a978140352c512d407b4c2e0408eade1896f221332613b39f75a9ff7"
  license "BSD-2-Clause"

  bottle do
    root_url "https://github.com/mister-webhooks/homebrew-tools/releases/download/mwcat-0.1.2-pre1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dbd9f546ccc43546129aec7697dff92351737877db8c15e5b35e112553ccc1f0"
    sha256 cellar: :any_skip_relocation, ventura:       "185e6579dcec5e1934955009b6f7682868141863febe536e713fe966adb4e84a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e81b34c7f5eab47397942b19e44234af772f8ce6ddc9b7a4fae88faf4746cf1c"
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
