class Jbang < Formula
    desc "jbang"
    homepage "https://github.com/maxandersen/jbang"
    url "https://github.com/maxandersen/jbang/releases/download/v0.6.0.5/jbang-0.6.0.5.zip"
    sha256 "e337cf5053091c893fef81141a79a6beb7d34777a65b25b11a379adc0d6c7203"
  
    #depends_on cask:"java"
  
    def install
      libexec.install Dir["*"]
      inreplace "#{libexec}/bin/jbang", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
      bin.install_symlink "#{libexec}/bin/jbang"
    end
  end