EAPI=4
P="archive"
inherit eutils
DESCRIPTION="A simple blog engine"
HOMEPAGE="http://timboudreau.com/blog/read/So_I_decided_to_write_a_little_blog_engine"
SRC_URI="http://hp:8080/builds/job/blog-package/lastSuccessfulBuild/artifact/*zip*/archive.zip -> blog-0.1.1.zip"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86_64"
IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=">=net-libs/nodejs-0.7.4"
src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/archive" "${WORKDIR}/blog-0.1.1"
}
