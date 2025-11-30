class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.135.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.135.0/jbang-0.135.0.zip"
  sha256 "ce378c5eaabc2de2186cd9884bca933a162e2604d0c06c5d6951e14471f27ba0"
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
