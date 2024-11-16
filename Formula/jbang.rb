class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.121.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.121.0/jbang-0.121.0.zip"
  sha256 "4ffa57f26c713cde084b728a64b1c79b74465e6b8e043175e3b6c364377613c8"
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
