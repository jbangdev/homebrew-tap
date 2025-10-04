class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.132.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.132.1/jbang-0.132.1.zip"
  sha256 "93baab61cd5805f4fc9496527b2842af9ae45a5281e67b50d185ca76ec4fe85c"
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
