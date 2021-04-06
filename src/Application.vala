/*
 * Copyright 2021 elementary, Inc. (https://elementary.io)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 *
 * Authored by: Marius Meisenzahl <mariusmeisenzahl@gmail.com>
 */

public class Wallpapers.Application : GLib.Application {
    private const string TAG_ARTIST = "Exif.Image.Artist";
    private const string TAG_ACCENT_COLOR = "Xmp.xmp.io.elementary.AccentColor";

    private static string? artist = null;
    private static string? accent_color = null;
    private static bool lint = false;

    private ApplicationCommandLine application_command_line;

    private const string[] VALID_COLORS = {
        "Red",
        "Orange",
        "Yellow",
        "Green",
        "Mint",
        "Blue",
        "Purple",
        "Pink",
        "Brown",
        "Gray"
    };

    private const OptionEntry[] OPTIONS = {
        { "artist", 'a', 0, OptionArg.STRING, ref artist,
            "Set artist" },
        { "accent-color", 'c', 0, OptionArg.STRING, ref accent_color,
            "Set accent color" },
        { "lint", 'l', 0, OptionArg.NONE, ref lint,
            "Lint wallpapers" },
        { null }
    };

    private Application () {
        Object (
            application_id: "io.elementary.wallpapers",
            flags: ApplicationFlags.HANDLES_COMMAND_LINE
        );
    }

    public override int command_line (ApplicationCommandLine command_line) {
        this.hold ();

        int res = handle_command_line (command_line);

        this.release ();
        return res;
    }

    private int handle_command_line (ApplicationCommandLine command_line) {
        string[] args = command_line.get_arguments ();

        if (args.length == 1) {
            args = { args[0], "." };
        }

        unowned string[] tmp = args;

        try {
            var option_context = new OptionContext ("");
            option_context.set_help_enabled (true);
            option_context.add_main_entries (OPTIONS, null);

            option_context.parse (ref tmp);
        } catch (OptionError e) {
            command_line.print ("Error: %s\n", e.message);
            command_line.print ("Run '%s --help' to see a full list of available options.\n", args[0]);
            return 1;
        }

        this.application_command_line = command_line;

        int errors = 0;
        string[] file_name_list = tmp[1:tmp.length];

        if (artist != null) {
            if (artist.length >= 3) {
                for (int i = 0; i < file_name_list.length; i++) {
                    print ("Set artist of \"%s\" to %s\n", file_name_list[i], artist);
                    try {
                        set_artist (file_name_list[i], artist);
                    } catch (Error e) {
                        print ("ERROR: Setting artist of \"%s\": %s", file_name_list[i], e.message);
                        errors++;
                    }
                }
            } else {
                print ("ERROR: \"%s\" is not a valid artist\n", artist);
                errors++;
            }
        }

        if (accent_color != null) {
            if (accent_color in VALID_COLORS) {
                for (int i = 0; i < file_name_list.length; i++) {
                    print ("Set accent color of \"%s\" to %s\n", file_name_list[i], accent_color);
                    try {
                        set_accent_color (file_name_list[i], accent_color);
                    } catch (Error e) {
                        print ("ERROR: Setting accent color of \"%s\": %s", file_name_list[i], e.message);
                        errors++;
                    }
                }
            } else {
                print ("ERROR: \"%s\" is not a valid accent color\n", accent_color);
                print ("Valid colors are:\n");
                for (int i = 0; i < VALID_COLORS.length; i++) {
                    print ("    %s\n", VALID_COLORS[i]);
                }
                errors++;
            }
        }

        if (lint) {
            GExiv2.Metadata metadata;
            string? value;
            for (int i = 0; i < file_name_list.length; i++) {
                try {
                    metadata = new GExiv2.Metadata ();
                    metadata.open_path (file_name_list[i]);

                    print ("Image: %s\n", file_name_list[i]);

                    value = metadata.get_tag_string (TAG_ARTIST);
                    if (value == null) {
                        print ("ERROR: Artist is not set\n");
                        errors++;
                    } else if (value.length < 3) {
                        print ("ERROR: Artist length is less than 3 characters\n");
                        errors++;
                    } else {
                        print ("Artist: %s\n", value);
                    }

                    value = metadata.get_tag_string (TAG_ACCENT_COLOR);
                    if (value == null) {
                        print ("ERROR: %s is not set\n", TAG_ACCENT_COLOR);
                        errors++;
                    } else if (!(value in VALID_COLORS)) {
                        print ("ERROR: \"%s\" is not a valid accent color\n", accent_color);
                        print ("Valid colors are:\n");
                        for (int j = 0; j < VALID_COLORS.length; j++) {
                            print ("    %s\n", VALID_COLORS[j]);
                        }
                        errors++;
                    } else {
                        print ("AccentColor: %s\n", value);
                    }

                    print ("\n");
                } catch (Error e) {
                    print ("ERROR: Parsing exif metadata of \"%s\": %s", file_name_list[i], e.message);
                    errors++;
                }
            }
        }

        return errors;
    }

    private void set_artist (string path, string artist) throws Error {
        var metadata = new GExiv2.Metadata ();
        metadata.open_path (path);

        metadata.set_tag_string (TAG_ARTIST, artist);

        metadata.save_file (path);
    }

    private void set_accent_color (string path, string accent_color) throws Error {
        var metadata = new GExiv2.Metadata ();
        metadata.open_path (path);

        metadata.set_tag_string (TAG_ACCENT_COLOR, accent_color);

        metadata.save_file (path);
    }

    public static int main (string[] args) {
        var app = new Application ();
        return app.run (args);
    }
}
