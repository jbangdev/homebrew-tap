class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.125.0"
  url "https://github.com/jbangdev/jbang/archive/refs/tags/v0.125.1.tar.gz"
  sha256 "ae8e1caca8a7b217bd3e54fc0b928a380e460c448bcd7c73cdaf5c334a4f2e4d"
  license "MIT"


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "init", "-t", "cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end
