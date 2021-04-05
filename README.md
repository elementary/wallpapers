# elementary Wallpapers
Wallpapers for elementary OS

## General wallpaper guidelines

Check out existing wallpapers to see what we're into. For starters, we typically prefer simple, pleasing photographs of nature with a shallow depth of field. Wallpapers that are less busy, have a single focal point, and are generally more out of focus near the edges are more likely to be chosen. 

Also keep in mind the desktop environment: elementary OS has a transparent panel at the top, so wallpapers with lower-contrast top areas will look best. If the area under the panel is too high-contrast, it automatically get masked with a dark translucent overlay. We also use a small white dock at the bottom, and icons hang over the top edge of the dock. Wallpapers with less-busy, lower contrast areas near the bottom will look better.

* Wallpapers should look good in Pantheon on elementary OS
* Not too distracting if a non-maximized window is open
* No text or logos
* No people
* Avoid grainy images
* We prefer photographic wallpapers, but digital/abstract isn't 100% out of the question
* We prefer not to have photos with a single domesticated animal as a focus point
* Wallpapers should be at least 3200×1800px

### For Reference

elementary OS desktop, with the adaptive light and dark panel based on the wallpaper:

| Light Wallpaper                           | Dark Wallpaper                           |
| ----------------------------------------- | ---------------------------------------- |
| ![Light](https://i.imgur.com/xpjjOxJ.png) | ![Dark](https://i.imgur.com/CzFvBj2.png) |

You should avoid busy parts of the wallpaper in the top panel and bottom dock areas.

## To submit a wallpaper

1. Make sure your wallpaper is openly-licensed and okay for commercial use (see below)
2. Fork the project and add the wallpaper
3. Add license info to the `debian/copyright` file
4. Add artist exif metadata using command `exiftool -artist="Ashim D'Silva" backgrounds/Ashim\ DSilva.jpg`
5. Add accent color exif metadata using command `exiftool -config exif.cfg -AccentColor=orange backgrounds/Ashim\ DSilva.jpg`
6. Create a pull request.

Due to the nature of this repository, very few pull requests will be accepted.

## Licensing

Acceptable licenses include:

1. Public domain (preferred)
2. [Unsplash License](https://unsplash.com/license)
3. A Creative Commons license that allows commercial use. Share-Alike and Attribution are allowed.

Individual wallpapers will be evaluated to ensure they meet the licensing requirements.
