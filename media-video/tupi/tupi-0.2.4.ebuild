# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/openni/openni-9999.ebuild,v 1.2 2011/10/31 09:16:53 frostwork Exp $

EAPI=5

inherit eutils git-2 multilib

MY_PN="tupi"
DESCRIPTION="Tupi 2d animation software"
HOMEPAGE="https://github.com/xtingray/${MY_PN}"
EGIT_REPO_URI="git://github.com/xtingray/${MY_PN}.git"
EGIT_COMMIT="v0.2-git04"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="animation"
IUSE="-libav -debug"

COMMON_DEPEND=">=dev-qt/qtsvg-4.7:4 dev-qt/qt-mobility[multimedia] media-libs/libtheora >=dev-qt/qtgui-4.7:4 >=dev-qt/qtcore-4.7:4 dev-lang/ruby sys-libs/zlib dev-libs/quazip[qt4] libav? ( media-video/libav ) !libav? ( >=media-video/ffmpeg-2.8 )"

DEPEND=""

RDEPEND=${COMMON_DEPEND}

QMAKE_CFLAGS="${CFLAGS} -I/usr/include/quazip -I/usr/include/qt4 -I/usr/include/qt4/QtMultimediaKit -I/usr/include/qt4/QtMobility/"
QMAKE_CXXFLAGS="${CXXFLAGS} -I/usr/include/quazip -I/usr/include/qt4 -I/usr/include/qt4/QtMultimediaKit -I/usr/include/qt4/QtMobility/"

COMPDIR="${WORKDIR}/${PF}"
DOCS=${COMPDIR}/doc

INCLUDEPATH="/usr/include /usr/include/quazip /usr/include/qt4 /usr/include/qt4/QtMultimediaKit /usr/include/qt4/QtMobility/"

INSTALL_ROOT="${D}"

src_prepare() {
	echo "INCLUDE: ${INCLUDEPATH}"
	# Test for libQtMobility looks in /usr/lib64 not qtdir - we will fix this for the compiler, but not here
	echo "Removing ${COMPDIR}/configure.tests/mobility as workaround"
	rm -Rf  ${COMPDIR}/configure.tests/mobility

	echo "Removing ${COMPDIR}/configure.tests/quazip as workaround"
	rm -Rf  ${COMPDIR}/configure.tests/quazip

	# Fix compatibility with ffmpeg 2.8+
	sed 's/URL_WRONLY/AVIO_FLAG_WRITE/' ${COMPDIR}/src/plugins/export/ffmpegplugin/tffmpegmoviegenerator.cpp | sed 's/ CodecID/AVCodecID/' > ${T}/tffmpegmoviegenerator.cpp
	mv ${T}/tffmpegmoviegenerator.cpp ${COMPDIR}/src/plugins/export/ffmpegplugin/tffmpegmoviegenerator.cpp

	sed 's/URL_WRONLY/AVIO_FLAG_WRITE/' ${COMPDIR}/src/plugins/export/ffmpegplugin/tffmpegmoviegenerator.old.cpp | sed 's/ CodecID/AVCodecID/' > ${T}/tffmpegmoviegenerator.old.cpp
	mv ${T}/tffmpegmoviegenerator.old.cpp ${COMPDIR}/src/plugins/export/ffmpegplugin/tffmpegmoviegenerator.old.cpp

	sed 's/URL_WRONLY/AVIO_FLAG_WRITE/' ${COMPDIR}/src/plugins/export/ffmpegplugin/tffmpegmoviegenerator.new.cpp | sed 's/ CodecID/AVCodecID/' > ${T}/tffmpegmoviegenerator.new.cpp
	mv ${T}/tffmpegmoviegenerator.new.cpp ${COMPDIR}/src/plugins/export/ffmpegplugin/tffmpegmoviegenerator.new.cpp
}

src_configure() {
	echo "Compiler flags: ${CPPFLAGS}"
	local myconf=""

	if use libav; then
		echo "Using libav"
	else
		myconf="${myconf} --without-libav"
	fi

	if use debug; then
		echo "Including debug info"
	else
		myconf="${myconf} --without-debug"
	fi

	econf ${myconf}

	HDIRS=`find ${COMPDIR} -name *.h | xargs dirname | uniq | sort | xargs echo `
	INCLUDEPATH="${INCLUDEPATH} ${HDIRS}"

	HINC=`find ${COMPDIR} -name *.h | xargs dirname | uniq | awk -v pwd="-I" '{print pwd$1}' | xargs echo`
	QMAKE_CFLAGS="${QMAKE_CFLAGS} ${HINC}"
	QMAKE_CXXFLAGS="${QMAKE_CXXFLAGS} ${HINC}"

	for i in $(find $COMPDIR -name '*.pro'); do
		echo "Update $i"
		echo "INCLUDEPATH=\"${INCLUDEPATH}\"" >> ${i}
		echo "QMAKE_CFLAGS=\"${QMAKE_CFLAGS}\"" >> ${i}
		echo "QMAKE_CXXFLAGS=\"${QMAKE_CXXFLAGS}\"" >> ${i}
		echo "QUAZIP_DIR=\"/usr/include/quazip\"" >> ${i}
#		echo "QMAKE_AR=\"-v\"" >> ${i}
		echo "INSTALL_ROOT=${D}" >> ${i}
		echo "LIBS += -L/usr/lib64 -L/usr/lib64/qt4 -lquazip -lz" >> ${i}
	done
	echo "QUAZIP_DIR=\"/usr/include/quazip\"" >> ${COMPDIR}/src/shell/shell_config.pri
}

src_compile() {
	emake
}

src_install() {
	MISSING_DIR=${D}share/doc/tupi
	echo "Creating ${MISSING_DIR}"
	mkdir -p ${D}share/doc/tupi
	mkdir -p ${D}usr/
        INSTALL_ROOT="${D%/}/usr"
	emake INSTALL_ROOT="${D%/usr}" DESTDIR="${D}usr/" install
	einstalldocs
#}

#pkg_preinst() {
	mkdir ${D}/usr
	mv ${D}/lib ${D}/usr/
	mv ${D}/bin ${D}/usr/
	rmdir ${D}/tupi
	rm -Rf ${D}/share/doc
	mkdir -p ${D}/usr/lib/tupi
	mkdir -p ${D}/usr/share/tupi
	mv ${D}/data ${D}/usr/share/tupi/
	mv ${D}/pixmaps ${D}/usr/share/tupi/
	mv ${D}/plugins ${D}/usr/lib/tupi/
	mv ${D}/themes ${D}/usr/share/tupi/
	mkdir -p ${D}/usr/share/man
	mv ${D}/man1 ${D}/usr/share/man/
	mkdir -p ${D}/etc/skel
	mv ${D}/applications/tupi.desktop ${D}/etc/skel
	rmdir ${D}/applications
}

#pkg_postinst() {
#}
