class Xflow < Formula
  desc "Fast voice dictation for developers, from the terminal"
  homepage "https://github.com/itsmrad/xflow"
  url "https://github.com/itsmrad/xflow/releases/download/v0.2.1-beta/xflow-0.2.1-beta-universal-apple-darwin.tar.gz"
  sha256 "2144bd39feebe70f0203592ff39e3e44039d0f44f66e6194354d8b755967504b"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "xflow", "xflowd"
    doc.install "README.md", "CHANGELOG.md", "SCOWL-LICENSE.txt", "BPE-LICENSE.txt"
  end

  def caveats
    <<~EOS
      Finish setup by running:
        xflow
      Setup asks macOS for Accessibility and Microphone for xflowd (and for Input
      Monitoring only if your shortcut key can't be heard without it), starts the
      background service and ends with a "hold Fn and say something" test.

      macOS may ask for those permissions again after `brew upgrade xflow`, because
      the installed path changes with each version. The .pkg installer keeps them.
      Before `brew uninstall xflow`, run `xflow service uninstall`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xflow --version")
    assert_match version.to_s, shell_output("#{bin}/xflowd --version")
  end
end
