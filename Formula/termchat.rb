class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.0/termchat-v0.33.0-aarch64-apple-darwin.tar.gz"
      sha256 "7569140fc73872b09c14a8b0ce6f1be7a3edba31cdcf728691b72214621354cf"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.0/termchat-v0.33.0-x86_64-apple-darwin.tar.gz"
      sha256 "f1772983c27d58e626f27d2fe5c3ea9d3027f3a3c6893a096251028b7434a9df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.0/termchat-v0.33.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7f4edaad2fc57bc87aee9785b784472b282137e99c76d6a60e5abd1a767617c7"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.0/termchat-v0.33.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d9f61052d847406a045d3f97d5cb1000fa2adf2324975e80f84e800f50b06aa8"
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
