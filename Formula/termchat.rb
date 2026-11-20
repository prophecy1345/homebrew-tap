class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.19.0/termchat-v0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "82567d1471a9ab6b3236f40e54b539a3aa3e9f8358cb1c4e6b7041b65bc2d872"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.19.0/termchat-v0.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "db0c26a7c605b3baee6f8be8394cc7658ca512f5c4a98052843dc27e03bdd9e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.19.0/termchat-v0.19.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c5e63d96bf8c0bdffd40928c1e43c23123efa1f7af9111ee075f789767993d8c"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.19.0/termchat-v0.19.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "39837a630c5b29a58d2747ac7daf3b8d579be5a90d5e3544e933b6511313d32a"
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
