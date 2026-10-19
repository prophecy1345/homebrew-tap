class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.1/termchat-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "040fb6c624cd230372b103b15a35196a389788ce3e86070a2d6441965bdd59af"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.1/termchat-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "c1be759d8b4e36b01b0bbf75f736b0adb710bd93294243a65b9a2c70b4a1428c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.1/termchat-v0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cf99946c51e3712e9517364dbd7a54fd9dc58b49d5685eb19a96a262899ec700"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.3.1/termchat-v0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8e4ee3a4349af0524e7750da225609fe8b151698ba856f9bf31ea7ff29077043"
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
