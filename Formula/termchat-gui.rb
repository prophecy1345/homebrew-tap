class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.2/termchat-gui-v0.17.2-aarch64-apple-darwin.tar.gz"
      sha256 "694af90f0aed80488ed8a5afb5cf519cb9e38231bdf748818e81efcd8f125c81"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.2/termchat-gui-v0.17.2-x86_64-apple-darwin.tar.gz"
      sha256 "a8360fc4625274a6bfd3bf5bb24ad14ea1a6cd8403957e034a3ac3b660345f34"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.2/termchat-gui-v0.17.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ed00d2fa9fc58630611840802611b708feebfaea899f66458c4ccaebafa37dd"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.17.2/termchat-gui-v0.17.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dca382eabf0666fa6739d9e44c09f09871e3425de54c93ba20ba16d7df991077"
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
