class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.31.0/termchat-gui-v0.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "77af2b5b563e7c7e657b4ab2db20f6b6a61edd1c42fa145a65fcfd693d385ade"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.31.0/termchat-gui-v0.31.0-x86_64-apple-darwin.tar.gz"
      sha256 "97613b77a3192f71049b7b43e72a1f14aa000966a3c7d108d8ca93f0f385f18a"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.31.0/termchat-gui-v0.31.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f8b5d4064aaf0743f11c2c0cbea492d2ab596d67c3d877d8608863b6d1b69b0"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.31.0/termchat-gui-v0.31.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d6d2acc2919fb6e43e846c2975fbaeead76882877a0b992dadbbf371c6968ce"
    end
  end

  def install
    # lyrebird stays next to the program (ADR-015), out of bin, so it does
    # not clash with the terminal client's.
    if OS.mac?
      prefix.install "termchat.app"
      bin.write_exec_script prefix/"termchat.app/Contents/MacOS/termchat-gui"
    else
      libexec.install "termchat-gui", "lyrebird"
      bin.write_exec_script libexec/"termchat-gui"
    end
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      To find termchat.app in Launchpad and Spotlight:
        ln -sf #{opt_prefix}/termchat.app ~/Applications/
    EOS
  end

  test do
    assert_match "termchat-gui #{version}", shell_output("#{bin}/termchat-gui --version")
  end
end
