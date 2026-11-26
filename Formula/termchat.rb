class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.38.0/termchat-v0.38.0-aarch64-apple-darwin.tar.gz"
      sha256 "1d9a96dd1af65b527d44d192f0b6bfc26275e3f7221621cbcd45319a675bbac8"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.38.0/termchat-v0.38.0-x86_64-apple-darwin.tar.gz"
      sha256 "9551a431f13d0de57a539e1e26f3a2924c3286b46e6f97ec0317dc170d69efee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.38.0/termchat-v0.38.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1b6a23b0460b54e0ba510e578f77a7928725b4e91c29db81c5712a7ecf498ae7"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.38.0/termchat-v0.38.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dc2637b07827b0cae6bca198eb4a053b41657f818e5aeb23990e1373238e4459"
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
