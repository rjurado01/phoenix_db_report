// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../scss/app.scss"
import "../node_modules/bootstrap/js/dist/index";
import "../node_modules/bootstrap/js/dist/util";
import "../node_modules/bootstrap/js/dist/button";
import "../node_modules/bootstrap/js/dist/dropdown";
import "../node_modules/bootstrap/js/dist/alert";
import "../node_modules/bootstrap/js/dist/modal";
import "../node_modules/bootstrap/js/dist/toast";

import feather from 'feather-icons';

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

$(document).ready(function() {
  // show icons
  feather.replace();

  // remove notification after 2 seconds
  $('#info-notification').delay(2000).fadeOut('fast', function() {
    $(this).remove();
  });

  $('.confirmation').on('click', function () {
    return confirm('Are you sure?');
  });
});
