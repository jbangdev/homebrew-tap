class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.99.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.99.1/jbang-0.99.1.zip"
  sha256 "ae6bf4f2acc8b588dc869cb96c18ae1109f4928321d515ee3d3e8f9b4ea3a933"
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
