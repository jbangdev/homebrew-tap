class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.85.1"
  url "https://github.com/jbangdev/jbang/releases/download/v0.85.1/jbang-0.85.1.zip"
  sha256 "b59cae3adf4b17c2f15180ad55b6f40007acfcf602ce2dc6940c5a9dfb9de5c6"
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
