class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.103.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.103.1/jbang-0.103.1.zip"
  sha256 "f91a5b43f6ae5486bbe57e443ee6632e79d0746e3210a9bdb66bb0efcfcd658d"
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
