// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../scss/app.scss"

import feather from 'feather-icons';

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

import utils from "./utils.js";
import components from "./components.js";
import dataHanders from "./data-handlers.js";


// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

// $(document).ready(function() {

//   // remove notification after 2 seconds
//   $('#info-notification').delay(2000).fadeOut('fast', function() {
//     $(this).remove();
//   });

//   $('.confirmation').on('click', function () {
//     return confirm('Are you sure?');
//   });
// });



document.addEventListener("DOMContentLoaded", function(event) {
  feather.replace(); // Icons: load library

  dataHanders.init();

  components.init();
});
