import utils from "./utils.js";

function handleDataRemove() {
  utils.onDataClick('remove', function(id) {
    const targetElement = document.getElementById(query);

    if (targetElement) targetElement.remove();
  });
}

function handleDataAutoremove() {
  const nodes = document.querySelectorAll('[data-autoremove]');

  for (let i=0; i<nodes.length; i++) {
    const node = nodes[i];
    const time = node.dataset['autoremove'] * 1000;
    setTimeout(function() { node.remove(); }, time);
  }
}

export default {
  init: function() {
    handleDataRemove(); // Notifications: remove by click

    handleDataAutoremove(); // Notifications: autoremove after time
  }
}
