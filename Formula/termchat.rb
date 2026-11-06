class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.4.1/termchat-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "72a7c77a7036e4eed4212de329827543a9048a40726852675c89142c9fe83fa6"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.4.1/termchat-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "1954609cd06021cb0c5744541500649b95d524371af79a3104b87b99217dc9f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.4.1/termchat-v0.4.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "210481d6d636523e1574cf7288d0e8d4819d2ca92f3289bc23d3c387f53d1016"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.4.1/termchat-v0.4.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "954fdd6cc959397cdd64d6337cff565be28159a28a9d07348336ff990a5e104f"
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
