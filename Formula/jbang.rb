class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.114.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.114.0/jbang-0.114.0.zip"
  sha256 "660c7eb2eda888897f20aa5c5927ccfed924f3b86d5f2a2477a7b0235cdc94bb"
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
