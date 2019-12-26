class Jbang < Formula
  desc "jbang"
  homepage "https://github.com/maxandersen/jbang"
  url "https://github.com/maxandersen/jbang/releases/download/v0.0.6/jbang-0.0.6.zip"
  sha256 "4f21d300aa9eacc6478b71aa04a126446baf580a0990724ad850073ddbb74145"

  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/kscript", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
    bin.install_symlink "#{libexec}/bin/jbang"
  end
end
