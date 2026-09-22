class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.142.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.142.0/jbang-0.142.0.zip"
  sha256 "8bee0bd035344cc46322aff7117ec475d48cefe37f2a79ff2c6ee3db577bb070"
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
