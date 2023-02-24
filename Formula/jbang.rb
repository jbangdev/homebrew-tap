class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.104.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.104.0/jbang-0.104.0.zip"
  sha256 "cb5fd26a7f49e7d2f306e8f514b0fbf56effc6b295280e1f2f6b69bba236c6b7"
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
