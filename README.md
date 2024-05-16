# elementary Wallpapers
[![Translation status](https://l10n.elementary.io/widget/desktop/wallpapers-extra/svg-badge.svg)](https://l10n.elementary.io/engage/desktop/)

Wallpapers for elementary OS

## Building, Testing, and Installation

You'll need the following dependencies:

 - exif
 - meson

Run `meson build` to configure the build environment. Change to the build directory and run `ninja test` to build and run automated tests

    meson build --prefix=/usr
    cd build
    ninja test

To install, use `ninja install`

    ninja install
