project(
    'io.elementary.wallpapers',
    version: '7.0.0'
)

i18n = import('i18n')
symlink = meson.current_source_dir() / 'meson' / 'symlink.py'
default_wallpaper = 'A Large Body of Water Surrounded By Mountains.jpg'

if get_option('early_access')
    rsvg = find_program('rsvg-convert')
    run_command(
        rsvg, '--format', 'png',
        '--width=5000', '--height=2813',
        '--output', meson.source_root() / 'backgrounds' / 'Early Access.png',
        'early_access.svg',
        check: true
    )

    default_wallpaper = 'Early Access.png'
endif

install_subdir(
    'backgrounds',
    install_dir: get_option('datadir')
)

meson.add_install_script(
    symlink,
    '--src', get_option('datadir') / 'backgrounds' / default_wallpaper,
    '--dest', get_option('datadir') / 'backgrounds' / 'elementaryos-default'
)

subdir('data')
subdir('po')
