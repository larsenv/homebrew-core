class WiimmsSzsTools < Formula
  desc "Wiimms SZS Toolset is a set of command-line tools to manipulate Wii files"
  homepage "https://szs.wiimm.de/"
  url "https://download.wiimm.de/source/wiimms-szs-tools/wiimms-szs-tools.source-2.19a.txz"
  license "GPL-2.0-or-later"

  head do
    url "https://github.com/Wiimm/wiimms-szs-tools.git"
  end
  depends_on "libpng" => :build
  uses_from_macos "ncurses"

  def install
    cd "project" do
      system_command "/usr/bin/sed",
                     args: [
                       "-i", ".bak",
                       "-e", "s|INSTALL_PATH=.*|INSTALL_PATH=#{prefix}|g",
                       "setup.sh"
                     ]
      system "make"
      system "/bin/sh", "install.sh", "--no-sudo"
    end
  end

  test do
    system "wszst", "TEST"
  end
end
