class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.95.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.95.0/jbang-0.95.0.zip"
  sha256 "9013de85ba59860a9803e7c3c7e525bde503a54ed9f0d6d29b7dae967b406655"
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
