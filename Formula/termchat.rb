class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.4/termchat-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "2834b54f13748097abeb306efdc9b023ed9dc32d37a396e91786619fdced7437"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.4/termchat-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "55fafd7813d3b6dc65095870caa92efa1219e07269a5c68306e157cda16bd536"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.4/termchat-v0.1.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e5407a48403b144db324b59e6dafc88ad93439282ed317536f0b43e4809985c4"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.4/termchat-v0.1.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0bcd8c48b49e3bf72b42c68230a0905de937663fa92cc78b8694c95a0e204cc3"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
