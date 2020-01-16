class Jbang < Formula
    desc "jbang"
    homepage "https://github.com/maxandersen/jbang"
    url "https://github.com/maxandersen/jbang/releases/download/v0.6.0.5/jbang-0.6.0.5.zip"
    sha256 "228c09a5387215cb042cde12166aeb13095e0cda78cc93072a45e0d756b4cf10"
  
    #depends_on cask:"java"
  
    def install
      libexec.install Dir["*"]
      inreplace "#{libexec}/bin/jbang", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
      bin.install_symlink "#{libexec}/bin/jbang"
    end
  end