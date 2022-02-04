class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.88.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.88.0/jbang-0.88.0.zip"
  sha256 "8657d0d4dfcaa8ea5d4409528fa6d6bca1feeee99f388bd84cb0bd9c1da661e0"
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
