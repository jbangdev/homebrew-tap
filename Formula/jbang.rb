class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.129.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.129.0/jbang-0.129.0.zip"
  sha256 "e9b9000bf490065329f8279e13ef47d1d57f1ef16ecd7c3dc62e070c530417f3"
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
