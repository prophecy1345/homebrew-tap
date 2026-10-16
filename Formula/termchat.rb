class Termchat < Formula
  desc "Private, text-only, end-to-end encrypted messenger for the terminal"
  homepage "https://github.com/prophecy1345/termchat"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.7/termchat-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "0f793ffb6f91c19c70bdd2cfd8855c02ecafb80dbeae6332a0edab307754f512"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.7/termchat-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "bcd32dd2bed4b8beace6fe8449ceb27eb14a4e42ce464fd9723570d6ce16a80a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.7/termchat-v0.1.7-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4f46d37dc561e91d34d9501cb94ee4e12315a0e18d8ea1ca10bf4808c6d667a9"
    end
    on_intel do
      url "https://github.com/prophecy1345/termchat/releases/download/v0.1.7/termchat-v0.1.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fdcecb43e7a195397844fa2245473d522a658af4c9e371570ed4ba2381dfd7be"
    end
  end

  def install
    bin.install "termchat"
  end

  test do
    assert_match "termchat #{version}", shell_output("#{bin}/termchat --version")
  end
end
