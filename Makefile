NSISFLAGS  = -DVERSION="$(shell cat ../pingus/VERSION)" -DPINGUSDIR="pingus"

all:
	rm -rf pingus/

	mkdir pingus/
	git --git-dir=../pingus/.git archive master | tar -x -C pingus/

	mkdir pingus/windows-installer
	git archive master | tar -x --exclude=lib  -C pingus/windows-installer

	cp -vi ../pingus/build-win32/pingus.exe pingus/
	cp -vi lib/*.dll pingus/

	./generate_install_nsh.sh

	makensis -NOCD $(NSISFLAGS) pingus.nsi 

.PHONY: all

# EOF #
