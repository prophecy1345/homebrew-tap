class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.2/termchat-v0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "8e5ca29ac05ec920acee10292c98db3f2c8b3dc770956e0b28810382048614f1"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.2/termchat-v0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "630e3979afe98e4b88446e7840b3d31ef8dfddd618195ab0f079953722ec4fbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.2/termchat-v0.9.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "08017f5426bf60abb19e66f040f34952c568c6f91326d1d9ac9848fb9ebd2d9b"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.9.2/termchat-v0.9.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3c0c76223df453e575ba9059f67784c0d30026d9e6212e7c583ec09215c92449"
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
