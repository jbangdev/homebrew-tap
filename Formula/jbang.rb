class Jbang < Formula
    desc "jbang"
    homepage "https://github.com/maxandersen/jbang"
    url "https://github.com/maxandersen/jbang/releases/download/v0.0.10.3/jbang-0.0.10.3.zip"
    sha256 "2328f71342b5c9562ee7a17884daa9dca4d35b72d1b2b3a9cddf9f979d5563ec"
  
    #depends_on cask:"java"
  
    def install
      libexec.install Dir["*"]
      inreplace "#{libexec}/bin/jbang", /^jarPath=.*/, "jarPath=#{libexec}/bin/jbang.jar"
      bin.install_symlink "#{libexec}/bin/jbang"
    end
  end