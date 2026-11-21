class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.21.0/termchat-gui-v0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "beb833c317a871f19e3363b3614bb054948fa0f3b8e240d2693c5277a7878872"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.21.0/termchat-gui-v0.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "36d1fb23722c4fc7cdb2e89ac4ad2e234e9293c655b699ab96fad3a163f12d52"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.21.0/termchat-gui-v0.21.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a5b5c25c3978d924c9c24fa6b7835f76e7ac1f1bcc072e4b400fe904b852497d"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.21.0/termchat-gui-v0.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7735011ec46ac1d38a3ed96bab2199898cc1df540eecff9dffd6287ec643f62f"
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
