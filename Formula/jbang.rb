class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.87.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.87.0/jbang-0.87.0.zip"
  sha256 "86724a0a8dca6ecdfb558f61d6ed2aec092f561de4aa4466173458d33b486f45"
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
