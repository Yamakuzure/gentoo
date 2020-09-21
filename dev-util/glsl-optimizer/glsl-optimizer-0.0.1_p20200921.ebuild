# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

MY_COMMIT="d78c3d2f249aa870368ad320905bc954c47704f6"

DESCRIPTION="C++ library to optimize GLSL shaders"
HOMEPAGE="https://github.com/aras-p/glsl-optimizer"
SRC_URI="https://github.com/aras-p/${PN}/archive/${MY_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE=""

REQUIRED_USE=""

RESTRICT="test"

RDEPEND=""
DEPEND=""
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/${PN}-add_project_name.patch
	"${FILESDIR}"/${PN}-do_not_prestrip.patch
)

src_unpack() {
	default
	mv "${WORKDIR}/${PN}-${MY_COMMIT}" "${S}"
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_SKIP_RPATH=ON
	)
	cmake_src_configure
}

src_install() {
	exeinto "${PREFIX}/usr/bin"
	doexe "${S}_build"/glsl_compiler
	doexe "${S}_build"/glslopt
	doexe "${S}_build"/glsl_test

	dolib.so "${S}_build"/libglcpp-library.so
	dolib.so "${S}_build"/libglsl_optimizer.so
	dolib.so "${S}_build"/libmesa.so

	doheader "${S}"/src/glsl/glsl_optimizer.h
}
