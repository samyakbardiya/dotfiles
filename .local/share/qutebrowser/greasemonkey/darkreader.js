// ==UserScript==
// @name            Dark Reader (Unofficial)
// @icon            https://darkreader.org/images/darkreader-icon-256x256.png
// @namespace       DarkReader
// @description     Inverts the brightness of pages to reduce eye strain
// @version         4.9.17
// @author          https://github.com/darkreader/darkreader#contributors
// @homepageURL     https://darkreader.org/ | https://github.com/darkreader/darkreader
// @run-at          document-end
// @grant           none
// @require         https://cdn.jsdelivr.net/npm/darkreader/darkreader.min.js
// @noframes

// @include         *

// @exclude         /^file?://.*/?/
// @exclude         /^http?://.*192\.168\.0/?/
// @exclude         /^https?://.*animetosho\.org/?/
// @exclude         /^https?://.*distrowatch\.com/?/
// @exclude         /^https?://.*duckduckgo\.com/?/
// @exclude         /^https?://.*github\.com/?/
// @exclude         /^https?://.*gitlab\.com/?/
// @exclude         /^https?://.*gsmarena\.com/?/
// @exclude         /^https?://.*iitkgp\.ac\.in/?/
// @exclude         /^https?://.*keybr\.com/?/
// @exclude         /^https?://.*keyma\.sh/?/
// @exclude         /^https?://.*learnxinyminutes\.com/?/
// @exclude         /^https?://.*leetcode\.com/?/
// @exclude         /^https?://.*monkeytype\.com/?/
// @exclude         /^https?://.*myanimelist\.net/?/
// @exclude         /^https?://.*nordtheme\.com/?/
// @exclude         /^https?://.*onlinegdb\.com/?/
// @exclude         /^https?://.*reddit\.com/?/
// @exclude         /^https?://.*searx\.be/?/
// @exclude         /^https?://.*time\.is/?/
// @exclude         /^https?://.*todoist\.com/?/
// @exclude         /^https?://.*typenconquer\.io/?/
// @exclude         /^https?://.*typeracer\.com/?/
// @exclude         /^https?://.*youtube\.com/?/

// @exclude         /^https?://.*google\.com/?/
// @exclude         /^https?://.*calendar\.google\.com/?/
// @exclude         /^https?://.*classroom\.google\.com/?/
// @exclude         /^https?://.*classroom\.google\.com/?/
// @exclude         /^https?://.*docs\.google\.com/?/
// @exclude         /^https?://.*firebase\.google\.com/?/
// @exclude         /^https?://.*meet\.google\.com/?/

// ==/UserScript==

DarkReader.enable({
    mode: 1,
    brightness: 105,
    contrast: 100,
    grayscale: 0,
    sepia: 0,
    engine: 'dynamicTheme',
    stylesheet: '',
    // darkSchemeBackgroundColor: '#202020',    /// hard contrast
    darkSchemeBackgroundColor: '#292828',       /// medium contrast
    // darkSchemeBackgroundColor: '#32302f',    /// soft contrast
    // darkSchemeTextColor: '#d4be98',
    // lightSchemeBackgroundColor: '#d4be98',
    // lightSchemeTextColor: '#282828',
    scrollbarColor: 'auto',
    selectionColor: 'auto',
    styleSystemColors: true,
});
