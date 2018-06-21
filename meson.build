project('io.elementary.wallpapers')

wallpapers = [
    'Ashim DSilva.jpg',
    'Carmine De Fazio.jpg',
    'elementaryos-default',
    'Jay Ruzesky.jpg',
    'Jonas Nilsson Lee.jpg',
    'leigh-kendell-581.jpg',
    'Mr. Lee.jpg',
    'Pablo Garcia Saldana.jpg',
    'Photo by SpaceX.jpg',
    'Rob Bye.jpg',
    'Ryan Schroeder.jpg',
    'Sunset by the Pier.jpg'
]

exif = find_program('exif')

foreach wallpaper : wallpapers
    install_data(
        wallpaper,
        install_dir: join_paths(get_option('datadir'), 'backgrounds')
    )
endforeach

foreach wallpaper : wallpapers
    test (
        'Validate exif data',
        exif,
        args: ['--tag=Artist', '--no-fixup', '-m', join_paths(meson.source_root(), wallpaper)]
    )
endforeach
