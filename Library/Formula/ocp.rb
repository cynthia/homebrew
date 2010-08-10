require 'formula'

class Ocp <Formula
  head 'git://github.com/cynthia/ocp-osx.git', :branch => 'master'
  homepage 'http://www.cubic.org/player/'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--without-x11", "--without-sdl", "--prefix=#{prefix}"
    system "make", "install"
  end

  def caveats; <<-EOS
X11 and SDL support is disabled due to temporary limitation. This will be sorted out.
    EOS
  end
end
