class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.0/termchat-gui-v0.28.0-aarch64-apple-darwin.tar.gz"
      sha256 "6aa34283aac4b6896315fde81c26223f31327883cde834d574f115ce6c76f7d8"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.0/termchat-gui-v0.28.0-x86_64-apple-darwin.tar.gz"
      sha256 "a356a2498b597d607187b856bdf3a23ec8e3ddc68b3b8f8fefce9e013b58bfa1"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.0/termchat-gui-v0.28.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35b039673f3707e21343c93ddc73a87822df81e50cbe3bae9ce9b83a4ed193c1"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.28.0/termchat-gui-v0.28.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c1caf0a2340f2cc4ca17688bc04e9c7f07c6f8bef5b8ecf5a55447654dde20c"
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
