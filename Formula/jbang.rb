class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.77.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.77.0/jbang-0.77.0.zip"
  sha256 "3878d0762f8cf1ebba1c3cc683ea5adfa32638c3f7b1e5a7e08e9ec0edb05a25"
  license "MIT"

  bottle :unneeded


  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/jbang", /^abs_jbang_dir=.*/, "abs_jbang_dir=#{libexec}/bin/jbang.jar"
    bin.install_symlink "#{libexec}/bin/jbang"
  end

  test do
      system "#{bin}/jbang", "--init=cli", "hello.java"
      system "#{bin}/jbang", "hello.java", "Homebrew!"
  end
end