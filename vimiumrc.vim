# avalable commands

# Scroll down (scrollDown)
# Scroll up (scrollUp)
# Scroll to the top of the page (scrollToTop)
# Scroll to the bottom of the page (scrollToBottom)
# Scroll a half page down (scrollPageDown)
# Scroll a half page up (scrollPageUp)
# Scroll a full page down (scrollFullPageDown)
# Scroll a full page up (scrollFullPageUp)
# Scroll left (scrollLeft)
# Scroll right (scrollRight)
# Scroll all the way to the left (scrollToLeft)
# Scroll all the way to the right (scrollToRight)
# Reload the page (reload)
# Copy the current URL to the clipboard (copyCurrentUrl)
# Open the clipboard's URL in the current tab (openCopiedUrlInCurrentTab)
# Open the clipboard's URL in a new tab (openCopiedUrlInNewTab)
# Go up the URL hierarchy (goUp)
# Go to root of current URL hierarchy (goToRoot)
# Enter insert mode (enterInsertMode)
# Enter visual mode (enterVisualMode)
# Enter visual line mode (enterVisualLineMode)
# Pass the next key to the page (passNextKey)
# Focus the first text input on the page (focusInput)
# Open a link in the current tab (LinkHints.activateMode)
# Open a link in a new tab (LinkHints.activateModeToOpenInNewTab)
# Open a link in a new tab & switch to it (LinkHints.activateModeToOpenInNewForegroundTab)
# Open multiple links in a new tab (LinkHints.activateModeWithQueue)
# Download link url

unmapAll

# Navigating the page

map j scrollDown
map <c-e> scrollDown
map k scrollUp
map <c-y> scrollUp
map gg scrollToTop
map G scrollToBottom
map d scrollPageDown
map u scrollPageUp
map - scrollFullPageDown
map - scrollFullPageUp
map h scrollLeft
map l scrollRight
map r reload
map yy copyCurrentUrl
map p openCopiedUrlInCurrentTab
map P openCopiedUrlInNewTab
map i enterInsertMode
map v enterVisualMode
map gi focusInput
map f LinkHints.activateMode
map F LinkHints.activateModeToOpenInNewTab
map - LinkHints.activateModeToOpenInNewForegroundTab
map gf nextFrame
map gF mainFrame

# Using the vomnibar

map o Vomnibar.activate
map O Vomnibar.activateInNewTab
map b Vomnibar.activateBookmarks
map B Vomnibar.activateBookmarksInNewTab
map T Vomnibar.activateTabSelection
map - enterFindMode
map n performFind
map N performBackwardsFind

# Navigating history

map H goBack
map L goForward

# Manipulating tabs

map t createTab
map J previousTab
map gT previousTab
map K nextTab
map gt nextTab
map ^ visitPreviousTab
map g0 firstTab
map g$ lastTab
map yt duplicateTab
map <a-p> togglePinTab
map <a-m> toggleMuteTab
map x removeTab
map X restoreTab

# Miscellaneous

map ? showHelp
