class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.90.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.90.1/jbang-0.90.1.zip"
  sha256 "fa0a01f5977dadf43c095b704eaf1a1600b0e8f6bbf27cf9332ded49c4633929"
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
