class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.0/termchat-gui-v0.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "72532678c5944e00be57a9d32205f56831014e164b2c69cc421f5db9d8b7fe21"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.0/termchat-gui-v0.24.0-x86_64-apple-darwin.tar.gz"
      sha256 "872037162431fdac2654dae5cdf737af6486cef4bb30249d00f8c90cde23f873"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.0/termchat-gui-v0.24.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9bb22c4415cdb1f48ed7cd99a87ae8cac5e4bcf325fc1b04e5e5426d42e9943"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.24.0/termchat-gui-v0.24.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4f86157e2880665b463ad54e91a343dab396ac97e85abdebfe11e631ac60ca0"
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
