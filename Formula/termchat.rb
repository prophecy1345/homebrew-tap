class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.1/termchat-v0.24.1-aarch64-apple-darwin.tar.gz"
      sha256 "991510bf68e08a2be04678e92c8ece2c4b1641460bb3527c8a52053b591f2c3a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.1/termchat-v0.24.1-x86_64-apple-darwin.tar.gz"
      sha256 "afbf5f2b9e77c0923b423b36fa097fe78cc276fbfcaf28173ea26dc28d95f64b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.1/termchat-v0.24.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "afded90142e4ce64c512b0838a3b1b2955336a158dfa646e1b9df26a8211d61c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.1/termchat-v0.24.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c37b93ad27914e9dbb94b6592a9707e312bb6bf6100273f53a322ccca975f687"
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
