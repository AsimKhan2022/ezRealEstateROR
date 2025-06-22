// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require popper
//= require bootstrap
//= require cocoon

// Initialize dropdowns on page load
document.addEventListener('DOMContentLoaded', function() {
  var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'));
  var dropdownList = dropdownElementList.map((dropdownToggleEl) => new bootstrap.Dropdown(dropdownToggleEl));
});

document.addEventListener('DOMContentLoaded', function() {
  document.body.addEventListener('click', (e) => {
    if (e.target.matches('[data-association]')) {
      e.preventDefault();
    }
  });
});

document.addEventListener('DOMContentLoaded', function() {
  document.body.addEventListener('click', (event) => {
    if (event.target.matches('.remove_fields')) {
      console.log('Remove Amenity button clicked');
    }
  });
});

/*
$(document).on('turbolinks:load', function() {
  // This will ensure that newly added fields are styled correctly
  $(document).on('cocoon:after-insert', function(e, insertedItem) {
    $(insertedItem).addClass('amenity-item'); // Add class for styling
  });
});
*/

$(document).on('turbolinks:load', function() {
  $(document).on('cocoon:after-insert', (e, insertedItem) => {
    // Add the amenity-item class to newly inserted items
    $(insertedItem).addClass('amenity-item');

    // Optionally adjust the layout if needed
    $('.horizontal-fields').css('display', 'flex');
  });
});

document.addEventListener('DOMContentLoaded', function() {
  var apiUrl = 'https://www.universal-tutorial.com/api';
  var apiKey = 'LOCsXPPlLW2HwN7hqYw0pk8fR0k7IARXLfhHZZNYfeUMrBFVxIyQ2AkVEVcIqArIEto'; // Replace with your API key from Universal Tutorial

  // Set headers for the API request
  const headers = {
    Authorization: `Bearer ${apiKey}`,
    Accept: 'application/json',
  };

  // Function to fetch and populate countries
  function fetchCountries() {
    fetch(`${apiUrl}/countries`, { headers })
      .then((response) => response.json())
      .then((data) => {
        var countrySelect = document.getElementById('country_select');
        countrySelect.innerHTML = '<option value="">Select Country</option>';
        data.forEach((country) => {
          var option = document.createElement('option');
          option.value = country.country_name;
          option.textContent = country.country_name;
          countrySelect.appendChild(option);
        });
      });
  }

  // Function to fetch and populate states based on selected country
  function fetchStates(countryName) {
    fetch(`${apiUrl}/states/${countryName}`, { headers })
      .then((response) => response.json())
      .then((data) => {
        var stateSelect = document.getElementById('state_select');
        stateSelect.innerHTML = '<option value="">Select State</option>';
        data.forEach((state) => {
          var option = document.createElement('option');
          option.value = state.state_name;
          option.textContent = state.state_name;
          stateSelect.appendChild(option);
        });
      });
  }

  // Function to fetch and populate cities based on selected state
  function fetchCities(stateName) {
    fetch(`${apiUrl}/cities/${stateName}`, { headers })
      .then((response) => response.json())
      .then((data) => {
        var citySelect = document.getElementById('city_select');
        citySelect.innerHTML = '<option value="">Select City</option>';
        data.forEach((city) => {
          var option = document.createElement('option');
          option.value = city.city_name;
          option.textContent = city.city_name;
          citySelect.appendChild(option);
        });
      });
  }

  // Fetch countries on page load
  fetchCountries();

  // Event listener for country change
  document.getElementById('country_select').addEventListener('change', function () {
    var selectedCountry = this.value;
    if (selectedCountry) {
      fetchStates(selectedCountry); // Fetch states for selected country
    } else {
      document.getElementById('state_select').innerHTML = '<option value="">Select State</option>';
      document.getElementById('city_select').innerHTML = '<option value="">Select City</option>';
    }
  });

  // Event listener for state change
  document.getElementById('state_select').addEventListener('change', function () {
    var selectedState = this.value;
    if (selectedState) {
      fetchCities(selectedState); // Fetch cities for selected state
    } else {
      document.getElementById('city_select').innerHTML = '<option value="">Select City</option>';
    }
  });
});
