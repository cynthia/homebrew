require 'formula'

class Pike <Formula
  @url='http://pike.ida.liu.se/pub/pike/all/7.8.352/Pike-v7.8.352.tar.gz'
  @homepage='http://pike.ida.liu.se/'
  @md5='22201fdc6391ac5c6374d7d6238ddd15'

  def install
    # Any level of optimization provided by homebrew triggers a inline assembly error.
    # Temporary workaround to prevent this until a good solution comes up.
    #
    # TODO: Figure out why safe C flags also trigger the same error.

    ENV['CC'] = ''
    ENV['CXX'] = ''
    ENV['LD'] = ''

    ENV['CFLAGS'] = ''
    ENV['CXXFLAGS'] = ''
        
    inreplace 'Makefile', '#CONFIGUREARGS=', "CONFIGUREARGS=--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end
end
