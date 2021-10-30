class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.81.2"
  url "https://github.com/jbangdev/jbang/archive/v0.82.0.tar.gz"
  sha256 "6cf714ef4deaa6d9428ea2cd13c18944cea61102efb4dbce65f334768d110e06"
  license "MIT"

  bottle :unneeded


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin/jbang.jar"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "--init=cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end