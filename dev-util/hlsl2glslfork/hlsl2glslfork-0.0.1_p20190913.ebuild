# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

MY_COMMIT="14dd189562ea32979ff9b1ac9b047c744393f7bf"

DESCRIPTION="DX9 style HLSL in, GLSL / GLSL ES out."
HOMEPAGE="https://github.com/aras-p/hlsl2glslfork"
SRC_URI="https://github.com/aras-p/${PN}/archive/${MY_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE=""

REQUIRED_USE=""

RESTRICT="test"

RDEPEND="
	dev-libs/libbsd
	media-libs/freeglut
	media-libs/glew:=
	media-libs/libglvnd
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXxf86vm
"
DEPEND="
	${RDEPEND}
"
BDEPEND="
	sys-devel/bison
	sys-devel/flex
"

PATCHES=(
	"${FILESDIR}"/${PN}-fix-bison_and_flex_calls.patch
	"${FILESDIR}"/${PN}-fix-hlslang_y.patch
	"${FILESDIR}"/${PN}-fix-hlsl2glsltest.patch
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

src_compile() {
	ninja -C "${S}_build" hlslang/MachineIndependent/hlslang_tab.cpp || die "Creating hlslang_tab failed"
	ninja -C "${S}_build" hlslang/MachineIndependent/Gen_hlslang.cpp || die "Creating Gen_hlslang failed"
	cmake_src_compile
}

src_install() {
	exeinto "${PREFIX}/usr/bin"
	doexe "${S}_build"/hlsl2glsltest

	dolib.so "${S}_build"/libhlsl2glsl.so

	doheader "${S}"/include/hlsl2glsl.h
}
