class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.101.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.101.0/jbang-0.101.0.zip"
  sha256 "32ae1b46d26a1e5f7e3084e7c1adc53058d5f75356e4464ab8327ff5e133cb29"
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
