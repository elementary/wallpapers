project(
    'io.elementary.wallpapers',
    'c', 'vala',
    version: '5.5.0'
)

i18n = import('i18n')

install_subdir(
    'backgrounds',
    install_dir: get_option('datadir')
)

glib_dep = dependency('glib-2.0')
gexiv2_dep = dependency('gexiv2')

subdir('data')
subdir('po')
subdir('src')
