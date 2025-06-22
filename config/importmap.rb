# Pin npm packages by running ./bin/importmap

pin "application"
pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true
#pin "@nathanvda/cocoon", to: "https://cdn.jsdelivr.net/npm/@nathanvda/cocoon@latest/dist/cocoon.min.js"
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js"
