class Jbang < Formula
  desc "jbang"
  homepage "https://github.com/maxandersen/jbang"
  url "https://github.com/maxandersen/jbang/releases/download/v0.0.5.8/jbang-0.0.5.8.zip"
  sha256 "cddd317b6e6b2ea37c78563a10addbedaad4712230fea55cc0189da9233dd1e9"

  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/kscript", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
    bin.install_symlink "#{libexec}/bin/jbang"
  end
end
