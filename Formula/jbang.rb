class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.130.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.130.0/jbang-0.130.0.zip"
  sha256 "2cb544187e14165151d3b3b023dcb12816d5518b28fe953aa660f1d756805219"
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
