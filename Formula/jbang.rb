class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.98.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.98.0/jbang-0.98.0.zip"
  sha256 "1ca481aa9afea46dffafb82b7907f8118877cda2183e8a1859beb39dbd8a93e7"
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
