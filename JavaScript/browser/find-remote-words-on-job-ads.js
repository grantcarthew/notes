// ==UserScript==
// @name         Find Remote on Job Ad
// @namespace    http://tampermonkey.net/
// @version      2024-11-04
// @description  Looks for remote work words on job ads
// @author       Grant Carthew
// @match        https://www.seek.com.au/*
// @match        https://www.linkedin.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=tampermonkey.net
// @grant        none
// ==/UserScript==

(function () {
  'use strict';

  /**
   * Adds a button to the top of the page
   * @returns {HTMLButtonElement} The created button element
   */
  function addButton() {
    console.log('Adding button to the page');
    const button = document.createElement('button');
    button.textContent = 'Find Words';
    button.style.position = 'fixed';
    button.style.top = '10px';
    button.style.right = '10px';
    button.style.zIndex = '1000';
    document.body.appendChild(button);
    console.log('Button added:', button);
    return button;
  }

  /**
   * Highlights all occurrences of the specified words in the document
   * @param {string[]} words - The words to search for and highlight
   */
  function highlightWords(words) {
    const bodyText = document.body.innerHTML;
    const regex = new RegExp(`\\b(${words.join('|')})\\b`, 'gi');
    const highlightedText = bodyText.replace(regex, '<mark>$1</mark>');
    document.body.innerHTML = highlightedText;
  }

  /**
   * Searches for specified words and updates the button text if found
   * @param {HTMLButtonElement} button - The button to update
   * @param {string[]} words - The words to search for
   */
  function searchAndHighlight(button, words) {
    console.log('Searching for words:', words);
    const regex = new RegExp(`\\b(${words.join('|')})\\b`, 'i');
    const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, {
      acceptNode: function (node) {
        const isScript = node.parentNode.nodeName === 'SCRIPT';
        console.log('Checking node:', node, 'Is script:', isScript);
        return isScript ? NodeFilter.FILTER_REJECT : NodeFilter.FILTER_ACCEPT;
      }
    });

    let found = false;
    let node;
    while (node = walker.nextNode()) {
      console.log('Checking node text:', node.nodeValue);
      if (regex.test(node.nodeValue)) {
        console.log('Match found in node:', node);
        found = true;
        break;
      }
    }

    if (found) {
      console.log('Words found, updating button');
      button.textContent = 'Winner 👍';
      button.style.backgroundColor = 'green';
      button.style.color = 'white';
      highlightWords(words);
    } else {
      console.log('No words found, updating button');
      button.textContent = 'No go 👎';
      button.style.backgroundColor = 'red';
      button.style.color = 'white';
    }
  }

  const wordsToFind = ['remote', 'hybrid', 'home', 'wfh', 'office', 'brisbane', 'queensland', 'qld'];
  console.log('Words to find:', wordsToFind);
  const button = addButton();
  button.addEventListener('click', () => {
    console.log('Button clicked');
    searchAndHighlight(button, wordsToFind);
  });
  searchAndHighlight(button, wordsToFind);
})();
