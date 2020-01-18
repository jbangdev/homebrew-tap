class Jbang < Formula
    desc "jbang"
    homepage "https://github.com/maxandersen/jbang"
    url "https://github.com/maxandersen/jbang/releases/download/v0.6.4.3/jbang-0.6.4.3.zip"
    sha256 "26be40a2c574e4a59f3a9f462a5cfbcce5ddb2f415a4209a689acc80c3b0f4e6"
  
    #depends_on cask:"java"
  
    def install
      libexec.install Dir["*"]
      inreplace "#{libexec}/bin/jbang", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
      bin.install_symlink "#{libexec}/bin/jbang"
    end
  end