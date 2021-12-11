class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.84.2"
  url "https://github.com/jbangdev/jbang/releases/download/v0.84.2/jbang-0.84.2.zip"
  sha256 "4b53cd9cc77cdc6408e5ae80838392f6f2a1808d884af1b4c66bcdfbd2a2b1da"
  license "MIT"


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "--init=cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end
