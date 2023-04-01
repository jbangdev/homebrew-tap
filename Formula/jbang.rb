class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.106.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.106.0/jbang-0.106.0.zip"
  sha256 "50d2cda70fc8e38c65a57a4744bcee9ef34cf55b10b46d8479bc28f4dcf7b2f1"
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
