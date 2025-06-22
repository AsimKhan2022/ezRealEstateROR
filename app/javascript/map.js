/*
document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('map')) {
    const map = L.map('map').setView([37.7749, -122.4194], 13); // Default coordinates

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: 'OpenStreetMap',
    }).addTo(map);

    const marker = L.marker([37.7749, -122.4194]).addTo(map); // Default coordinates

    map.on('click', (e) => {
      const { lat } = e.latlng;
      const { lng } = e.latlng;

      // Update hidden fields
      document.getElementById('latitude').value = lat;
      document.getElementById('longitude').value = lng;

      // Update marker position
      marker.setLatLng([lat, lng]);
    });

    // If property has coordinates, use them
    const propertyLat = document.getElementById('latitude').value;
    const propertyLng = document.getElementById('longitude').value;
    if (propertyLat && propertyLng) {
      const latLng = [parseFloat(propertyLat), parseFloat(propertyLng)];
      map.setView(latLng, 13);
      marker.setLatLng(latLng);
    }
  }
});
*/

document.addEventListener('DOMContentLoaded', function () {
    if (document.getElementById('map')) {
        var map = L.map('map').setView([37.7749, -122.4194], 13); // Default coordinates

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: 'OpenStreetMap',
        }).addTo(map);

        var marker = L.marker([37.7749, -122.4194]).addTo(map); // Default coordinates

        map.on('click', function (e) {
            var lat = e.latlng.lat;
            var lng = e.latlng.lng;

            // Update hidden fields
            document.getElementById('latitude').value = lat;
            document.getElementById('longitude').value = lng;

            // Update marker position
            marker.setLatLng([lat, lng]);
        });

        // If property has coordinates, use them
        var propertyLat = document.getElementById('latitude').value;
        var propertyLng = document.getElementById('longitude').value;
        if (propertyLat && propertyLng) {
            var latLng = [parseFloat(propertyLat), parseFloat(propertyLng)];
            map.setView(latLng, 13);
            marker.setLatLng(latLng);
        }
    }
});