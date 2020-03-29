import utils from "./utils.js";

function handleDropdown() {
  utils.onDataClick('toggle', function(id) {
    const element = document.getElementById(id);

    if (!element) return;

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
}

function handleSelectArrow() {
  utils.forNode('select', function(node) {
    node.addEventListener(utils.isFirefox ? 'click' : 'mousedown', function(event) {
      if (event.button != 0) return;
      event.stopImmediatePropagation();

      if (node.classList.contains('open')) return;

      node.classList.add('open');

      let close = function(event) {
        event.stopImmediatePropagation();
        setTimeout(function() { node.classList.remove('open'); }, 1);
        document.removeEventListener('mouseup', close);
      }

      document.addEventListener('mouseup', close);
    });
  });
}

export default {
  init: function init() {
    handleDropdown(); // Dropdowns: open/close

    handleSelectArrow(); // Selects: update arrow icon
  }
}
