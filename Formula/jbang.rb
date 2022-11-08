class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.100.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.100.0/jbang-0.100.0.zip"
  sha256 "183355035e01f3dad8eacc5db18257aee11a88d3a390f64e3f0aae6a36239a3e"
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
