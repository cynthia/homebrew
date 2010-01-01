require 'formula'

class Pike <Formula
  @url='http://pike.ida.liu.se/pub/pike/all/7.8.352/Pike-v7.8.352.tar.gz'
  @homepage='http://pike.ida.liu.se/'
  @md5='22201fdc6391ac5c6374d7d6238ddd15'

  def install
    # Any level of optimization provided by homebrew triggers a inline assembly error.
    # Temporary workaround to prevent this until a good solution comes up.
    #
    # I still do not understand /why/ this works, and safe C flags do not.

    hack_optimized_flags = ''   # TODO: Optimization flags that don't burn

    ENV['CC'] = ''
    ENV['CXX'] = ''
    ENV['LD'] = ''

    ENV['CFLAGS'] =  hack_optimized_flags
    ENV['CXXFLAGS'] = ENV['CFLAGS']
    
    ENV.deparallelize if MACOS_VERSION >= 10.6
        
    inreplace 'Makefile', '#CONFIGUREARGS=', "CONFIGUREARGS=--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end
end
