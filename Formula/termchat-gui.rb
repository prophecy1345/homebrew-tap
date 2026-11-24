class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.0/termchat-gui-v0.33.0-aarch64-apple-darwin.tar.gz"
      sha256 "d6c9d2f673d05507113e2ff00bba31c9f443b40fb1622bc2e7ea78839978cad1"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.0/termchat-gui-v0.33.0-x86_64-apple-darwin.tar.gz"
      sha256 "5e80f5a0eb67a8a23d9c4cdc578d322a21cc2fa1623da61913077fe2584c2246"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.0/termchat-gui-v0.33.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7bd6001b1433582e821c864064a54779a26acab7115b8f35771686156cd6b117"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.33.0/termchat-gui-v0.33.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e36a67ef2f458b46b098548c32ac9df64826b55f92e705f2a7dde272250f158"
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
