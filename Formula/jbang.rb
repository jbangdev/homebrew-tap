class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.119.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.119.0/jbang-0.119.0.zip"
  sha256 "31876cc1ac9c5ecc531fe8c3abf255e78faf93c11ceb0a7f4cc819f8ada7f4c6"
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
