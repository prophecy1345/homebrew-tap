class TermchatGui < Formula
  desc "Private, end-to-end encrypted messenger: the desktop app"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.0/termchat-gui-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "03673c54fc50b50b52ce128e51680493a980d001a341b3ab0e6537a847d24c20"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.0/termchat-gui-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "d457b8cf3ecf9604aebbaa9904f9991650123996c9e02c299361f79d61388e56"
    end
  end

  # glibc, not musl: the window needs the system's OpenGL and X11/Wayland.
  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.0/termchat-gui-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dfa87fb6f8acf0f90d5fa12813b382261390d85737885a74de7975802c555695"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.8.0/termchat-gui-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea4894ff5df777d5bd43ca7c2562f2476071da0e3be001778d07e534e297bdd7"
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
