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
    const button = document.createElement('button');
    button.textContent = 'Find Remote Words';
    button.style.position = 'fixed';
    button.style.top = '10px';
    button.style.right = '10px';
    button.style.zIndex = '1000';
    document.body.appendChild(button);
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
    const bodyText = document.body.textContent;
    const regex = new RegExp(`\\b(${words.join('|')})\\b`, 'i');
    if (regex.test(bodyText)) {
      button.textContent = 'Words Found';
      button.style.backgroundColor = 'lightgreen';
      highlightWords(words);
    } else {
      button.textContent = 'No Words Found';
      button.style.backgroundColor = 'lightred'
    }
  }

  const wordsToFind = ['remote', 'hybrid', 'home', 'wfh', 'office'];
  const button = addButton();
  button.addEventListener('click', () => searchAndHighlight(button, wordsToFind));
  searchAndHighlight(button, wordsToFind);
})();
