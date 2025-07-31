class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.128.7"
  url "https://github.com/jbangdev/jbang/releases/download/v0.128.7/jbang-0.128.7.zip"
  sha256 "bd2fb359d7f94c5e0c745a21664d777dd8dda5a78bc2daa696868a7f623fd647"
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
