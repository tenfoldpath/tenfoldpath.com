if (navigator.serviceWorker) {
  window.addEventListener('load', function () {
    navigator.serviceWorker.register('/sw.js', {
      scope: '/'
    }).then((reg) => {
      console.log('Registered service worker', reg)
    }).catch((err) => {
      console.log('Service worker unavailable', err)
    })
    if (navigator.serviceWorker.controller) {
      navigator.serviceWorker.controller.postMessage({ command: 'trimCaches' })
    }
  })
}
