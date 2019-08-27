/*
* Copyright (c) {{yearrange}} brombinmirko (https://linuxhub.it)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
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
* Authored by: brombinmirko <https://linuxhub.it>
*/

public class License.MainWindow : Gtk.Window {

    private Gtk.HeaderBar header_bar;
    private Granite.ModeSwitch mode_switch;
    private Gtk.Stack main_stack;
    private Gtk.StackSidebar stack_sidebar;
    private Gtk.Paned paned;
    private Gtk.TextView license_gplv3;
    private Gtk.TextView license_apache;

    construct {
        set_size_request (900, 800);

        var gtk_settings = Gtk.Settings.get_default ();

        mode_switch = new Granite.ModeSwitch.from_icon_name ("display-brightness-symbolic", "weather-clear-night-symbolic");
        mode_switch.primary_icon_tooltip_text = ("Light background");
        mode_switch.secondary_icon_tooltip_text = ("Dark background");
        mode_switch.valign = Gtk.Align.CENTER;
        mode_switch.bind_property ("active", gtk_settings, "gtk_application_prefer_dark_theme");

        header_bar = new Gtk.HeaderBar ();
        header_bar.set_title ("License");
        header_bar.show_close_button = true;
        header_bar.has_subtitle = false;
        header_bar.pack_end (mode_switch);

        set_titlebar (header_bar);

        license_gplv3 = new Gtk.TextView();
        var license_gplv3_buffer = license_gplv3.get_buffer();
        license_gplv3_buffer.set_text("Sono una licenza OwO");

        license_apache = new Gtk.TextView();
        var license_apache_buffer = license_apache.get_buffer();
        license_apache_buffer.set_text("Sono una licenza anche io OwO");

        main_stack = new Gtk.Stack ();
        main_stack.add_titled (license_gplv3, "GPLv3", "GPLv3");
        main_stack.add_titled (license_apache, "Apache", "Apache");
        
        stack_sidebar = new Gtk.StackSidebar ();
        stack_sidebar.stack = main_stack;

        paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        paned.add1 (stack_sidebar);
        paned.add2 (main_stack);
    
        add(paned);
    }
}
