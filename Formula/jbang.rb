class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.105.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.105.1/jbang-0.105.1.zip"
  sha256 "ea16b8470242ba6f4f2bfe1b3758fa1b1793ce7bdae722ee191cc4d9143f8b4e"
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
