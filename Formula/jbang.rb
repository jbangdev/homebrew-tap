class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.90.2"
  url "https://github.com/jbangdev/jbang/releases/download/v0.90.2/jbang-0.90.2.zip"
  sha256 "dc1ade9ce09f58d7a861d2a64753e8ba2b735e697e88b90ece64dadc40d2b641"
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
