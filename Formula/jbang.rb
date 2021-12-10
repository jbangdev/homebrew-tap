class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.84.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.84.1/jbang-0.84.1.zip"
  sha256 "63758146a2569677aebd7da0e9cb5d7d8c36837cbb697f6b99644d41b0b1d7a0"
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
