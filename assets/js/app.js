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

// Firefox 1.0+
var isFirefox = typeof InstallTrigger !== 'undefined';

function toggleClass(node, klass) {
  if (node.classList.contains(klass)) {
    node.classList.remove(klass);
    return 'removed';
  } else {
    node.classList.add(klass);
    return 'added';
  }
}

function setDataClick(dataAttribute, callback) {
  const selector = '[data-' + dataAttribute + ']';
  const triggerElements = document.querySelectorAll(selector);

  for (let i=0; i<triggerElements.length; i++) {
    const triggerElement = triggerElements[i];
    const targetElement = document.getElementById(triggerElement.dataset[dataAttribute]);
    if (!targetElement) continue;

    triggerElement.addEventListener('click', function() { callback(targetElement) });
  }
}

function autoRemove() {
  const nodes = document.querySelectorAll('[data-autoremove]');

  for (let i=0; i<nodes.length; i++) {
    const node = nodes[i];
    const time = node.dataset['autoremove'] * 1000;
    setTimeout(function() { node.remove(); }, time);
  }
}

document.addEventListener("DOMContentLoaded", function(event) {
  // show icons
  feather.replace();

  // remove by click
  setDataClick('remove', function(element) { element.remove(); });

  // confirmation
  setDataClick('confirmation', function(element) { return confirm('Are your sure?'); });

  // autoremove
  // autoRemove();

  // Dropdown
  setDataClick('toggle', function(element) {
    if (element.classList.contains('hidden')) {
      element.classList.remove('hidden');

      let closeOut = function(evt) {
        if (!element.contains(evt.target)) {
          element.classList.add('hidden');
          document.removeEventListener("click", closeOut);
        }
      }

      setTimeout(function() { document.addEventListener("click", closeOut); }, 0);
    } else {
      element.classList.add('hidden');
    }
  });

  // SELECTS
  function toggleSelectOpen(selectNode) {
    selectNode.addEventListener(isFirefox ? 'click' : 'mousedown', function(event) {
      if (event.button != 0) return;
      event.stopImmediatePropagation();

      if (selectNode.classList.contains('open')) return;

      selectNode.classList.add('open');

      let close = function(event) {
        event.stopImmediatePropagation();
        setTimeout(function() { selectNode.classList.remove('open'); }, 1);
        document.removeEventListener('mouseup', close);
      }

      document.addEventListener('mouseup', close);
    });
  }

  const selectNodes = document.querySelectorAll('select');
  for (let i=0; i<selectNodes.length; i++) {
    toggleSelectOpen(selectNodes[i]);
  }
});
