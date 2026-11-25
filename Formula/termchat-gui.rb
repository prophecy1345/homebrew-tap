class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.0/termchat-gui-v0.34.0-aarch64-apple-darwin.tar.gz"
      sha256 "7c1e3fc1b483e1965e7ef4ebd9502de89fd7fd3411a94c75bd1509c12ee2f8b4"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.0/termchat-gui-v0.34.0-x86_64-apple-darwin.tar.gz"
      sha256 "23917b91d93c93046d713f69b47386bce9c3c84bebc6f78e61104863e2da1988"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.0/termchat-gui-v0.34.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b757d8ba8e0fc357632249f5f0e0d32bbfadeddec9fb0673b63abc72be60b805"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.34.0/termchat-gui-v0.34.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "38ce0b673523cd0e6c2f835741aa6d0b4f939524c154748ecec11dbebabcd99a"
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
