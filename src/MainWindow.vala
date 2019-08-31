/*
* Copyright (c) 2019 brombinmirko (https://linuxhub.it)
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
    private Gtk.TextView license_apache2;
    private Gtk.ScrolledWindow scrolled_gplv3;
    private Gtk.ScrolledWindow scrolled_apache2;
    private size_t license_read;
    private DataInputStream license_stream;
    private string license_data;

    construct {
        /*
        *  set default window size
        */
        set_size_request (900, 800);

        var gtk_settings = Gtk.Settings.get_default ();
        
        /*
        *  create switcher for dark/light theme selection
        */
        mode_switch = new Granite.ModeSwitch.from_icon_name ("display-brightness-symbolic", "weather-clear-night-symbolic");
        mode_switch.primary_icon_tooltip_text = ("Light background");
        mode_switch.secondary_icon_tooltip_text = ("Dark background");
        mode_switch.valign = Gtk.Align.CENTER;
        mode_switch.bind_property ("active", gtk_settings, "gtk_application_prefer_dark_theme");

        /*
        *  create header_bar and pack buttons
        */
        header_bar = new Gtk.HeaderBar ();
        header_bar.set_title (Constants.APP_NAME);
        header_bar.set_subtitle (Constants.APP_DESCRIPTION);
        header_bar.show_close_button = true;
        header_bar.has_subtitle = true;
        header_bar.pack_end (mode_switch);
        set_titlebar (header_bar);

        /*
        * grab licenses data from web
        * TODO:
        * - Move this function to a dedicated class
        * - When starting for the first time, save the licenses for offline use
        * - We should use gresources as storage (?)
        */
        license_stream = new DataInputStream(File.new_for_uri (Sources.GPLV3).read());
        license_data = license_stream.read_until("", out license_read);

        scrolled_gplv3 = new Gtk.ScrolledWindow(null, null);
        scrolled_gplv3.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scrolled_gplv3.set_border_width(10);
        license_gplv3 = new Gtk.TextView();
        license_gplv3.get_buffer().set_text(license_data);
        scrolled_gplv3.add (license_gplv3);

        license_stream = new DataInputStream(File.new_for_uri (Sources.APACHE2).read());
        license_data = license_stream.read_until("", out license_read);
        scrolled_apache2 = new Gtk.ScrolledWindow(null, null);
        scrolled_apache2.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
        scrolled_apache2.set_border_width(10);
        license_apache2 = new Gtk.TextView();
        license_apache2.get_buffer().set_text(license_data);
        scrolled_apache2.add (license_apache2);

        /*
        *  create the licenses stack layout
        */
        main_stack = new Gtk.Stack ();
        main_stack.add_titled (scrolled_gplv3, "GNU GPLv3", "GNU GPLv3");
        main_stack.add_titled (scrolled_apache2, "Apache 2.0", "Apache 2.0");
        
        /*
        *  create sidebar for stack layout
        */
        stack_sidebar = new Gtk.StackSidebar ();
        stack_sidebar.stack = main_stack;

        /* 
        *  create panned layout for license views
        */
        paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
        paned.add1 (stack_sidebar);
        paned.add2 (main_stack);
    
        add(paned);
    }
}
