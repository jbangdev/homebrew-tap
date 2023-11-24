class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.113.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.113.0/jbang-0.113.0.zip"
  sha256 "f176f5c3521affbde8b11c12f1f36ae827d17b7717e416b4fdcf0fe70fa8c235"
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
