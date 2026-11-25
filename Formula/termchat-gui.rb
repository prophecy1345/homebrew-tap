class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.0/termchat-gui-v0.36.0-aarch64-apple-darwin.tar.gz"
      sha256 "3c25e86e65057afdae2c8cf83d715ded1b4616e9cb455fab27791ab1e5cb6857"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.0/termchat-gui-v0.36.0-x86_64-apple-darwin.tar.gz"
      sha256 "404126bfe0c93f2bc89e84d976730a5a4d6233bf93f452b7b1ec32c3dd0bd15f"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.0/termchat-gui-v0.36.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "189722c16d6953dd808f1e30d10c8d53307efd59c058c0ed00eb9110d9c99ec6"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.36.0/termchat-gui-v0.36.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c62de484f34ac3dcf074b7ffe3c17dad860e26edb6acb5891b077ca4bd1ef7c"
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
