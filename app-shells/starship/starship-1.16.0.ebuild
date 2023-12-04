# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler@1.0.2
	ahash@0.8.3
	aho-corasick@1.0.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.3.2
	anstyle@1.0.1
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@1.0.1
	anyhow@1.0.71
	arc-swap@1.6.0
	arrayvec@0.7.4
	async-broadcast@0.5.1
	async-channel@1.8.0
	async-executor@1.5.1
	async-fs@1.6.0
	async-io@1.13.0
	async-lock@2.7.0
	async-process@1.7.0
	async-recursion@1.0.4
	async-task@4.4.0
	async-trait@0.1.68
	atomic-waker@1.1.1
	autocfg@1.1.0
	base64@0.13.1
	bitflags@1.3.2
	bitflags@2.3.3
	block@0.1.6
	block-buffer@0.9.0
	block-buffer@0.10.4
	blocking@1.3.1
	bstr@1.5.0
	btoi@0.4.3
	bumpalo@3.13.0
	byteorder@1.4.3
	bytesize@1.2.0
	cc@1.0.79
	cfg-if@1.0.0
	chrono@0.4.26
	clap@4.3.19
	clap_builder@4.3.19
	clap_complete@4.3.2
	clap_derive@4.3.12
	clap_lex@0.5.0
	clru@0.6.1
	cmake@0.1.50
	colorchoice@1.0.0
	concurrent-queue@2.2.0
	const-random@0.1.15
	const-random-macro@0.1.15
	const_format@0.2.31
	const_format_proc_macros@0.2.31
	core-foundation@0.9.3
	core-foundation-sys@0.8.4
	cpufeatures@0.2.8
	crc32fast@1.3.2
	crossbeam@0.8.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-queue@0.3.8
	crossbeam-utils@0.8.16
	crunchy@0.2.2
	crypto-common@0.1.6
	deelevate@0.2.0
	derivative@2.2.0
	difflib@0.4.0
	digest@0.9.0
	digest@0.10.7
	dirs@4.0.0
	dirs-next@2.0.0
	dirs-sys@0.3.7
	dirs-sys-next@0.1.2
	dlv-list@0.5.0
	downcast@0.11.0
	dunce@1.0.4
	dyn-clone@1.0.11
	either@1.8.1
	encoding_rs@0.8.32
	enumflags2@0.7.7
	enumflags2_derive@0.7.7
	equivalent@1.0.0
	errno@0.2.8
	errno@0.3.1
	errno-dragonfly@0.1.2
	event-listener@2.5.3
	fastrand@1.9.0
	fastrand@2.0.0
	filedescriptor@0.8.2
	filetime@0.2.21
	flate2@1.0.26
	float-cmp@0.9.0
	fnv@1.0.7
	form_urlencoded@1.2.0
	fragile@2.0.0
	futures-core@0.3.28
	futures-io@0.3.28
	futures-lite@1.13.0
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	generic-array@0.14.7
	gethostname@0.4.3
	getrandom@0.2.10
	gix@0.50.1
	gix-actor@0.24.1
	gix-attributes@0.16.0
	gix-bitmap@0.2.6
	gix-chunk@0.4.4
	gix-command@0.2.8
	gix-commitgraph@0.18.1
	gix-config@0.26.1
	gix-config-value@0.12.5
	gix-credentials@0.17.1
	gix-date@0.7.1
	gix-diff@0.33.1
	gix-discover@0.22.1
	gix-features@0.31.1
	gix-features@0.32.1
	gix-filter@0.2.0
	gix-fs@0.3.0
	gix-fs@0.4.1
	gix-glob@0.10.1
	gix-hash@0.11.4
	gix-hashtable@0.2.4
	gix-ignore@0.5.1
	gix-index@0.21.1
	gix-lock@7.0.1
	gix-mailmap@0.16.1
	gix-negotiate@0.5.1
	gix-object@0.33.1
	gix-odb@0.50.1
	gix-pack@0.40.2
	gix-packetline-blocking@0.16.4
	gix-path@0.8.4
	gix-prompt@0.5.4
	gix-quote@0.4.6
	gix-ref@0.33.2
	gix-refspec@0.14.1
	gix-revision@0.18.1
	gix-revwalk@0.4.1
	gix-sec@0.8.4
	gix-tempfile@7.0.0
	gix-trace@0.1.3
	gix-traverse@0.30.1
	gix-url@0.21.1
	gix-utils@0.1.5
	gix-validate@0.7.7
	gix-worktree@0.23.0
	guess_host_triple@0.1.3
	hashbrown@0.12.3
	hashbrown@0.13.2
	hashbrown@0.14.0
	heck@0.4.1
	hermit-abi@0.3.1
	hex@0.4.3
	home@0.5.5
	iana-time-zone@0.1.57
	iana-time-zone-haiku@0.1.2
	idna@0.4.0
	imara-diff@0.1.5
	indexmap@1.9.3
	indexmap@2.0.0
	instant@0.1.12
	io-close@0.3.7
	io-lifetimes@1.0.11
	is-docker@0.2.0
	is-terminal@0.4.8
	is-wsl@0.4.0
	is_debug@1.0.1
	itertools@0.10.5
	itoa@1.0.6
	js-sys@0.3.64
	jwalk@0.8.1
	kstring@2.0.0
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.147
	libz-ng-sys@1.1.9
	libz-sys@1.1.9
	linked-hash-map@0.5.6
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.3
	lock_api@0.4.10
	log@0.4.19
	mac-notification-sys@0.5.6
	mach2@0.4.1
	malloc_buf@0.0.6
	memchr@2.5.0
	memmap2@0.7.1
	memmem@0.1.1
	memoffset@0.7.1
	memoffset@0.9.0
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mockall@0.11.4
	mockall_derive@0.11.4
	nix@0.26.2
	nom@5.1.3
	nom@7.1.3
	normalize-line-endings@0.3.0
	notify-rust@4.8.0
	nu-ansi-term@0.49.0
	num-derive@0.3.3
	num-traits@0.2.15
	num_cpus@1.16.0
	num_threads@0.1.6
	objc@0.2.7
	objc-foundation@0.1.1
	objc_id@0.1.1
	once_cell@1.18.0
	opaque-debug@0.3.0
	open@5.0.0
	ordered-float@2.10.0
	ordered-multimap@0.6.0
	ordered-stream@0.2.0
	os_info@3.7.0
	parking@2.1.0
	parking_lot@0.12.1
	parking_lot_core@0.9.8
	path-slash@0.2.1
	pathdiff@0.2.1
	pathsearch@0.2.0
	percent-encoding@2.3.0
	pest@2.7.1
	pest_derive@2.7.1
	pest_generator@2.7.1
	pest_meta@2.7.1
	phf@0.11.2
	phf_codegen@0.11.2
	phf_generator@0.11.2
	phf_shared@0.11.2
	pin-project-lite@0.2.9
	pin-utils@0.1.0
	pkg-config@0.3.27
	polling@2.8.0
	ppv-lite86@0.2.17
	predicates@2.1.5
	predicates-core@1.0.6
	predicates-tree@1.0.9
	proc-macro-crate@1.3.1
	proc-macro-hack@0.5.20+deprecated
	proc-macro2@1.0.63
	process_control@4.0.3
	prodash@25.0.0
	quick-xml@0.23.1
	quick-xml@0.30.0
	quote@1.0.29
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon@1.7.0
	rayon-core@1.11.0
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	regex@1.9.1
	regex-automata@0.1.10
	regex-automata@0.3.1
	regex-syntax@0.7.3
	rust-ini@0.19.0
	rustix@0.37.21
	rustix@0.38.4
	ryu@1.0.13
	same-file@1.0.6
	schemars@0.8.12
	schemars_derive@0.8.12
	scopeguard@1.1.0
	semver@0.11.0
	semver@1.0.18
	semver-parser@0.10.2
	serde@1.0.178
	serde_derive@1.0.178
	serde_derive_internals@0.26.0
	serde_json@1.0.104
	serde_repr@0.1.12
	serde_spanned@0.6.3
	sha1@0.10.5
	sha1-asm@0.5.1
	sha1_smol@1.0.0
	sha2@0.9.9
	sha2@0.10.7
	shadow-rs@0.23.0
	shared_library@0.1.9
	shell-words@1.1.0
	signal-hook@0.1.17
	signal-hook@0.3.15
	signal-hook-registry@1.4.1
	siphasher@0.3.10
	slab@0.4.8
	smallvec@1.10.0
	socket2@0.4.9
	starship-battery@0.8.1
	static_assertions@1.1.0
	strsim@0.10.0
	syn@1.0.109
	syn@2.0.25
	systemstat@0.2.3
	tauri-winrt-notification@0.1.1
	tempfile@3.7.0
	terminal_size@0.2.6
	terminfo@0.7.5
	termios@0.3.3
	termtree@0.4.1
	termwiz@0.15.0
	thiserror@1.0.40
	thiserror-impl@1.0.40
	time@0.3.22
	time-core@0.1.1
	time-macros@0.2.9
	tiny-keccak@2.0.2
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	toml@0.5.11
	toml@0.7.6
	toml_datetime@0.6.3
	toml_edit@0.19.14
	tracing@0.1.37
	tracing-attributes@0.1.26
	tracing-core@0.1.31
	typenum@1.16.0
	ucd-trie@0.1.5
	uds_windows@1.0.2
	uluru@3.0.0
	unicase@2.6.0
	unicode-bidi@0.3.13
	unicode-bom@2.0.2
	unicode-ident@1.0.9
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.10
	unicode-xid@0.2.4
	uom@0.34.0
	url@2.4.0
	urlencoding@2.1.3
	utf8parse@0.2.1
	vcpkg@0.2.15
	version_check@0.9.4
	versions@5.0.0
	vtparse@0.6.2
	waker-fn@1.1.0
	walkdir@2.3.3
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	which@4.4.0
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.39.0
	windows@0.48.0
	windows-sys@0.48.0
	windows-targets@0.48.1
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.39.0
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.39.0
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.39.0
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.39.0
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.39.0
	windows_x86_64_msvc@0.48.0
	winnow@0.5.0
	winres@0.1.12
	xdg-home@1.0.0
	yaml-rust@0.4.5
	zbus@3.14.1
	zbus_macros@3.14.1
	zbus_names@2.6.0
	zvariant@3.15.0
	zvariant_derive@3.15.0
	zvariant_utils@1.0.1
"

inherit cargo

DESCRIPTION="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
HOMEPAGE="https://starship.rs/"
SRC_URI="
	https://github.com/starship/starship/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CC0-1.0 ISC MIT MIT-0 MPL-2.0 Unicode-DFS-2016 Unlicense WTFPL-2 ZLIB"

SLOT="0"
KEYWORDS="amd64 ~arm64"

BDEPEND="dev-util/cmake
	>=virtual/rust-1.65"

PATCHES=(
	# https://bugs.gentoo.org/866133
	"${FILESDIR}"/${PN}-1.16.0-no-strip.patch
)

QA_FLAGS_IGNORED="usr/bin/starship"

src_configure() {
	export PKG_CONFIG_ALLOW_CROSS=1
	export OPENSSL_NO_VENDOR=true

	cargo_src_configure
}

src_install() {
	cargo_src_install
	dodoc README.md CHANGELOG.md
}

pkg_postinst() {
	local v
	for v in ${REPLACING_VERSIONS}; do
		if ver_test "${v}" -lt "1.9.0"; then
			einfo "Note that vicmd_symbol config option was renamed to vimcmd_symbol in version 1.9"
		fi
	done
}
