import { isDarkMode } from './lib/dark_mode'
const BODY_FADE_IN_TIME = 3200

function applyDarkMode () {
  document.body.classList.add('animating')
  document.body.classList.remove('black-bg')
  if (isDarkMode()) {
    document.body.classList.add('dark-theme-applied')
    document.body.style.backgroundColor = '#1c1d31'
    document.getElementById('navbar-logo').src = '/images/jadescan-logo-dark.png'
    document.getElementById('footer-logo').src = '/images/jadescan-logo-dark.png'
  }
  document.body.classList.add('fade-in')
  setTimeout(() => {
    document.body.classList.remove('animating')
  }, BODY_FADE_IN_TIME)
}
window.onload = applyDarkMode()

if (isDarkMode()) {
  if (document.getElementById('top-navbar')) {
    document.getElementById('top-navbar').style.backgroundColor = '#282945'
  }
  if (document.getElementById('navbar-logo')) {
    // document.getElementById('navbar-logo').style.filter = 'brightness(0) invert(1)'
  }
  const modeChanger = document.getElementById('dark-mode-changer')
  if (modeChanger) {
    modeChanger.className += ' ' + 'dark-mode-changer--dark'
  }

  const search = document.getElementById('main-search-autocomplete')
  const searchMobile = document.getElementById('main-search-autocomplete-mobile')
  if (search && search.style) {
    search.style.backgroundColor = '#22223a'
    search.style.borderColor = '#22223a'
  }
  if (searchMobile && searchMobile.style) {
    searchMobile.style.backgroundColor = '#22223a'
    searchMobile.style.borderColor = '#22223a'
  }
}
