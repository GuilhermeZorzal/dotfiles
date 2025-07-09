# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103
terminal = "kitty"  # terminal to use for commands like :open -t, :open -p, etc.

# INFO: The colors use ##AARRGGBB, where AA is the transparency (not RRGGBBAA as you might expect)

# Load default browser configs
config.load_autoconfig()

#            _
#   ___ ___ | | ___  _ __ ___
#  / __/ _ \| |/ _ \| '__/ __|
# | (_| (_) | | (_) | |  \__ \
#  \___\___/|_|\___/|_|  |___/
#
config.set("window.transparent", True)
# Status bar (line at the bottom)
c.colors.statusbar.normal.bg = "#00000000"  # normal color
c.colors.statusbar.command.bg = "#00000000"  # color when runnin comands

# fore groud colors for the status bar
c.colors.statusbar.command.fg = "#ffffff"  # command color
c.colors.statusbar.normal.fg = "#00afff"  # little information at the right corner
c.colors.statusbar.passthrough.fg = "#00afff"
c.colors.statusbar.url.fg = "#af87ff"  # url
c.colors.statusbar.url.success.https.fg = "#af8744"
c.colors.statusbar.url.hover.fg = "#87afaf"

# unfocused Tabs
c.colors.tabs.even.bg = "#00000000"  # colors of inactive tabs are alternated
c.colors.tabs.odd.bg = "#22000000"
c.colors.tabs.bar.bg = "#00000000"

c.colors.tabs.even.fg = "#ffffff"  # font color inactive tabs
c.colors.tabs.odd.fg = "#ffffff"

c.colors.tabs.pinned.even.fg = "#ffffff"
c.colors.tabs.pinned.odd.fg = "#ffffff"
c.colors.tabs.pinned.even.bg = "#88000000"
c.colors.tabs.pinned.odd.bg = "#88000000"

c.colors.tabs.pinned.selected.even.bg = "black"
c.colors.tabs.pinned.selected.odd.bg = "black"
c.colors.tabs.pinned.selected.even.fg = "white"
c.colors.tabs.pinned.selected.odd.fg = "white"


c.colors.tooltip.bg = "#991e1e1e"  # tooltip background color
c.colors.tooltip.fg = "#ffffff"  # tooltip foreground color
c.fonts.tooltip = "bold 10pt monospace"


# selected Tabs
c.fonts.tabs.selected = "bold 10pt monospace"  # make tabs bold
c.colors.tabs.selected.even.bg = "#ffffff"
c.colors.tabs.selected.odd.bg = "#ffffff"
c.colors.tabs.selected.even.fg = "#000000"
c.colors.tabs.selected.odd.fg = "#000000"

c.colors.hints.bg = "#1e1e1e"
c.colors.hints.fg = "#ffffff"
c.tabs.show = "always"  # show tabs always, even if there is only one tab
# c.tabs.show = "multiple"  # if theres only one tab, hide it

c.colors.completion.item.selected.match.fg = "#00ffff"
c.colors.completion.match.fg = "#00ffff"

c.colors.tabs.indicator.start = "#afff00"
c.colors.tabs.indicator.stop = "#ff5f5f"
c.colors.completion.odd.bg = "#1e1e1e"
c.colors.completion.even.bg = "#1e1e1e"
c.colors.completion.fg = "#ffffff"
c.colors.completion.category.bg = "#1e1e1e"
c.colors.completion.category.fg = "#ffffff"
c.colors.completion.item.selected.bg = "#1e1e1e"
c.colors.completion.item.selected.fg = "#ffffff"

c.colors.messages.info.bg = "#1e1e1e"
c.colors.messages.info.fg = "#ffffff"
c.colors.messages.error.bg = "#1e1e1e"
c.colors.messages.error.fg = "#ff0000"
c.colors.downloads.error.bg = "#1e1e1e"
c.colors.downloads.error.fg = "#ff0000"

c.colors.downloads.bar.bg = "#1e1e1e"
c.colors.downloads.start.bg = "#afff00"
c.colors.downloads.start.fg = "#ffffff"
c.colors.downloads.stop.bg = "#ff5f5f"
c.colors.downloads.stop.fg = "#ffffff"

c.colors.tooltip.bg = "#1e1e1e"
c.hints.border = "#ffffff"


#  _____     _
# |_   _|_ _| |__  ___
#   | |/ _` | '_ \/ __|
#   | | (_| | |_) \__ \
#   |_|\__,_|_.__/|___/
#
# Tabs
c.tabs.padding = {"top": 3, "bottom": 3, "left": 9, "right": 9}
c.tabs.indicator.width = 0  # no tab indicators
c.tabs.width = "7%"

# J and K to me only make sense to me if its a stack with top on the left (j = going down the stack, k = going up the stack)
c.tabs.new_position.unrelated = "first"
c.tabs.new_position.stacking = True
c.tabs.new_position.related = "prev"

c.url.searchengines = {
    # note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "!aw": "https://wiki.archlinux.org/?search={}",
    "!apkg": "https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=",
    "!gh": "https://github.com/search?o=desc&q={}&s=stars",
    "!yt": "https://www.youtube.com/results?search_query={}",
}

c.completion.open_categories = [
    "searchengines",
    "quickmarks",
    "bookmarks",
    "history",
    "filesystem",
]


# Show the index, so its faster to jump
c.tabs.title.format = "{relative_index} - {current_title}"
c.tabs.title.format_pinned = "{relative_index}"

c.auto_save.session = True  # save tabs on quit/restart

# keybinding changes
config.bind("=", "cmd-set-text -s :open")
config.bind("h", "history")
config.bind("cs", "cmd-set-text -s :config-source")
config.bind("tH", "config-cycle tabs.show multiple never")
config.bind("sH", "config-cycle statusbar.show always never")
config.bind("T", "hint links tab")
config.bind("pP", "open -- {primary}")
config.bind("pp", "open -- {clipboard}")
config.bind("pt", "open -t -- {clipboard}")
config.bind("qm", "macro-record")
config.bind("<ctrl-y>", "spawn --userscript ytdl.sh")
config.bind("tT", "config-cycle tabs.position top left")
config.bind("gJ", "tab-move +")
config.bind("gK", "tab-move -")
config.bind("gm", "tab-move")
config.bind("<ctrl-shift-c", "config-source")
# config.bind("<ctrl-d>", "config-cycle colors.webpage.darkmode.enabled True False")
config.bind(
    "<ctrl-d>",
    "config-cycle colors.webpage.darkmode.enabled True False",
    # ;; config-cycle colors.webpage.bg "#00000000" "#ffffff"',
)

# dark mode setup
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.policy.images = "never"
c.colors.webpage.bg = "#ffffff"

config.set("colors.webpage.darkmode.enabled", False, "file://*")
# fonts
c.fonts.default_family = []
c.fonts.default_size = "10pt"  # browser font
c.fonts.web.family.fixed = "monospace"
c.fonts.web.family.sans_serif = "monospace"
c.fonts.web.family.serif = "monospace"
c.fonts.web.family.standard = "monospace"
c.fonts.web.size.default = 14  # content font

c.editor.command = [terminal, "-e", "nvim", "{file}", "-c", "normal {line}G{column0}l"]

# privacy - adjust these settings based on your preference
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # tsh keybind to toggle

# Adblocking info -->
# For yt ads: place the greasemonkey script yt-ads.js in your greasemonkey folder (~/.config/qutebrowser/greasemonkey).
# The script skips through the entire ad, so all you have to do is click the skip button.
# Yeah it's not ublock origin, but if you want a minimal browser, this is a solution for the tradeoff.
# You can also watch yt vids directly in mpv, see qutebrowser FAQ for how to do that.
# If you want additional blocklists, you can get the python-adblock package, or you can uncomment the ublock lists here.
c.content.blocking.enabled = True
c.content.blocking.method = "adblock"  # uncomment this if you install python-adblock
c.content.blocking.adblock.lists = [
    # "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt",
]
