import Iconify from '@iconify/iconify'

// This listener is needed to reload the icons after Turbo replaces the DOM
document.addEventListener('turbo:load', function () {
  Iconify.scan()
})
