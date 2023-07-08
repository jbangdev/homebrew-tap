class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.109.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.109.0/jbang-0.109.0.zip"
  sha256 "50cd3a82b85017e98c8e589c4b3a4e5c98dbfe49d2e6f3623f3c8864cafd1637"
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
