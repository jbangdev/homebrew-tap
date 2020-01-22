class Jbang < Formula
    desc "jbang"
    homepage "https://github.com/maxandersen/jbang"
    url "https://github.com/maxandersen/jbang/releases/download/v0.11.1/jbang-0.11.1.zip"
    sha256 "cf20230b265e7adb89231dba1195c3c1924f45026a3d809ed330fb25b133199a"
  
    #depends_on cask:"java"
  
    def install
      libexec.install Dir["*"]
      inreplace "#{libexec}/bin/jbang", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
      bin.install_symlink "#{libexec}/bin/jbang"
    end
  end