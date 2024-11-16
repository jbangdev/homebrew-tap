class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.120.4"
  url "https://github.com/jbangdev/jbang/releases/download/v0.120.4/jbang-0.120.4.zip"
  sha256 "0c9234d1fecacae814490ff1b4e71152a3c5adce2756f9f2a386b64b81a2da21"
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
