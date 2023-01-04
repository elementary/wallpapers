project(
    'io.elementary.wallpapers',
    version: '7.0.0'
)

i18n = import('i18n')
symlink = meson.current_source_dir() / 'meson' / 'symlink.py'

install_subdir(
    'backgrounds',
    install_dir: get_option('datadir')
)

meson.add_install_script(
    symlink,
    '--src', get_option('datadir') / 'backgrounds' / 'Photo of Valley.jpg',
    '--dest', get_option('datadir') / 'backgrounds' / 'elementaryos-default'
)

subdir('data')
subdir('po')
