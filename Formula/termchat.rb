class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.0/termchat-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "3ba84794ec02c19faae19f325ccbded6a180a896e5742abac725efe39a816a1a"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.0/termchat-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "58302e9be05de0f13e94eb127d60c81eac6a61e63a1aa71d19c9407b1571c682"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.0/termchat-v0.16.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a3b87afedc54f340dc98addb99796cf04ae278e89bd72c1ecd30815d35236242"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.16.0/termchat-v0.16.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d5aaa47809496e0fb82109450b4359bb3513b6ddde1ccac735016d16f4061dc5"
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
