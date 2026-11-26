class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.38.0/termchat-gui-v0.38.0-aarch64-apple-darwin.tar.gz"
      sha256 "861c1e0a2989d3e7d4435a1db15060d04cd33006c90c275a70a30e28cdfc3e41"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.38.0/termchat-gui-v0.38.0-x86_64-apple-darwin.tar.gz"
      sha256 "92ae7669704423c0f5fc08211845f59c8565e2989356fcc907a981ac5a12c1ce"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.38.0/termchat-gui-v0.38.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2683c35849c4fe736e06a84832ef377eb1a1cb92fdfa573567ad585d54fb113"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.38.0/termchat-gui-v0.38.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f6dbc5e8a89a44b3bf75c5f1fb01b4e8259f847fbc62d6405c86c35889c0378"
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
      pkgshare.install "LICENSE.Hack.txt"
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
