class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.83.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.83.1/jbang-0.83.1.zip"
  sha256 "78a144db5fe208f024cd21b70ce7145f67525ad129194df62efc7e1c5c7f0d55"
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