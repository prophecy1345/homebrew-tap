class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.22.0/termchat-gui-v0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "f01fb820a590ca4e2211a789ffd4f26ec9eaa8d8d2eec80a3018bbdebd8134b3"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.22.0/termchat-gui-v0.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "54ba402355804dd339c29e1e7e0b7222122a7f82241a1a0ae301272f01987b60"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.22.0/termchat-gui-v0.22.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86e250a184be55594a20a304f2fc767b30dc12e6db7ea350d8de4e62d03b4e89"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.22.0/termchat-gui-v0.22.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b169a75e70403695fc815e6cb2da2566e58237d100040430ae957221e5e657d3"
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
