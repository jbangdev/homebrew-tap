class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.125.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.125.1/jbang-0.125.1.zip"
  sha256 "746fb90b246d2a5d0546a376a14ffa48eb4d79d7312c47a003a9b3e0f9435b99"
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
