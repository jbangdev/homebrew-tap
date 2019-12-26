class Jbang < Formula
  desc "jbang"
  homepage "https://github.com/maxandersen/jbang"
  url "https://github.com/maxandersen/jbang/releases/download/v0.0.5.9/jbang-0.0.5.9.zip"
  sha256 "7424b34b6fd22e16421794b0c82502ec00b4f323d7caf8f008048900163f7d82"

  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/kscript", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
    bin.install_symlink "#{libexec}/bin/jbang"
  end
end
