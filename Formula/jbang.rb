class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.108.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.108.0/jbang-0.108.0.zip"
  sha256 "c950046fa7d8b17e440197768f96cab1752a2e549f5ec96389fbf4d1f95dba5b"
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
