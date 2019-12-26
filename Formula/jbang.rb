class JBang < Formula
  desc "jbang"
  homepage "https://github.com/maxandersen/jbang"
  url "https://github.com/maxandersen/jbang/releases/download/v0.0.4.2/jbang-0.0.4.2.zip"
  sha256 "3de5df7b0e1760bb5a56bfc7a8068d6d930cd3f80a20205d9c6efb969c07ba29"

  def install
    libexec.install Dir["*"]
    inreplace "#{libexec}/bin/kscript", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
    bin.install_symlink "#{libexec}/bin/jbang"
  end
end
