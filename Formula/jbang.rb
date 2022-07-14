class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.96.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.96.0/jbang-0.96.0.zip"
  sha256 "783a702bc5e7dff042a9c05c0520c4fe40afcb0536cb6a4b809637f935070475"
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
