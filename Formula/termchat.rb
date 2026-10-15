class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.2/termchat-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "ab32c12395feb7f902159a10a641bb1829bcd2870592a81706d342473c33ea6a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.2/termchat-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "6cc6b6bcf30eef542280cd83834da1ac8a7ad2e58e43960c1a8b245957cfd7da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.2/termchat-v0.1.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b659409494ed61a08098ff6d64c19269efd28372b0a4202983ec77ce454e6a47"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.2/termchat-v0.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d3c4fe0c9cff2b7ea9ec352e81b4024269e14343b84e16b2d1a3c0ea5462afd7"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
