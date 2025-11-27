class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.134.3"
  url "https://github.com/jbangdev/jbang/releases/download/v0.134.3/jbang-0.134.3.zip"
  sha256 "64696f05c4b746f7f855f6574eab0fe7534e7a4460fc1aec290a2cbdc8c7f131"
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
