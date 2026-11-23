class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.27.0/termchat-v0.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "5aa2139271c6c297cb186103bf886e8ad9178f5dbb8ba346f71b11fffc462353"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.27.0/termchat-v0.27.0-x86_64-apple-darwin.tar.gz"
      sha256 "c71c694ba7ebce364866598e9f27589f833ba2b0d98a6495d351858762aba714"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.27.0/termchat-v0.27.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "15d72291179eb685efaa6e89d6cbafa65dc922b876a18bac56c4d80d04c259f2"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.27.0/termchat-v0.27.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3402ff0afc735601ac9575f439eb5f1e897d736f26074b80adc8b947e028ba73"
    end
  end

  def install
    # lyrebird, for Tor bridges (ADR-015): termchat looks for it next to itself.
    bin.install "termchat", "lyrebird"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
