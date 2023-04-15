document.documentElement.classList.remove('no-js');

'serviceWorker' in navigator && navigator.serviceWorker.register('/sw.js', { scope: '/' });
