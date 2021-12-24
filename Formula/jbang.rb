class Jbang < Formula
  desc "Unleash the power of Java"
  homepage "https://jbang.dev"
  version "0.85.0"
  url "https://github.com/jbangdev/jbang/releases/download/v0.85.0/jbang-0.85.0.zip"
  sha256 "8feceb7b75aa82a9d0b0f36b5933dfa45c6cc3cb4b20a284896db65d72c25b91"
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
