EAPI=5
inherit git-2
# inherit user

DESCRIPTION="Memory Efficient Serialization Library"
HOMEPAGE="http://google.github.io/flatbuffers/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/google/flatbuffers.git"
#EGIT_BRANCH="v1.0.0"
EGIT_BRANCH="5bb80bec3738aa8bd5d9b872bed1fdcc37726957"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/cmake"

RDEPEND=""

src_compile() {
    ebegin "Building flatbuffers"
    cd ${WORKDIR}/flatbuffers-${PV}
    cmake -G "Unix Makefiles"
    make
    eend ${?}
}

src_install() {
    ebegin "Installing flatc"
    dobin ${WORKDIR}/flatbuffers-${PV}/flatc
    eend ${?}
}
