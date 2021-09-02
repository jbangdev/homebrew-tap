class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.79.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.79.0/jbang-0.79.0.zip"
  sha256 "e0916a2aa5e90e011b81a0410ef8ad70043f9fb34b24b4465e7bcdbc9c3d5a08"
  license "MIT"

  bottle :unneeded


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin/jbang.jar"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "--init=cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end