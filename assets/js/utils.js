const isFirefox = typeof InstallTrigger !== 'undefined'; // Firefox 1.0+

function onDataClick(dataAttribute, callback) {
  const selector = '[data-' + dataAttribute + ']';
  const elements = document.querySelectorAll(selector);

  for (let i=0; i<elements.length; i++) {
    const value = elements[i].dataset[dataAttribute];
    elements[i].addEventListener('click', function() { callback(value) });
  }
}

function forNode(query, callback) {
  const nodes = document.querySelectorAll('select');

  for (let i=0; i<nodes.length; i++) callback(nodes[i]);
}

function toggleClass(node, klass) {
  if (node.classList.contains(klass)) {
    node.classList.remove(klass);
    return 'removed';
  } else {
    node.classList.add(klass);
    return 'added';
  }
}

module.exports = {
  isFirefox,
  onDataClick,
  forNode,
  toggleClass
}
