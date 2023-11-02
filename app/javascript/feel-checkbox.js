function feel_checkbox() {
  // チェックボックス要素の取得
  const checkBoxes = document.getElementsByClassName('checkbox');

  for (let i = 0; i < checkBoxes.length; i++) {
    const checkBox = checkBoxes[i];
    const inputElement = checkBox.querySelector('input'); // <input>要素を取得

    checkBox.addEventListener('change', function() {
      // チェックボックスの状態が変化したときの処理
      const isChecked = inputElement.checked;
      if (isChecked) {
        checkBox.style.backgroundColor = '#ffffff';
        checkBox.style.color = 'gray';
        checkBox.style.boxShadow = '0 0 1.2px 1.2px #4FE358, 0 0 1.2px 1.2px #4FE358 inset';
      } else {
        checkBox.style.backgroundColor = '';
        checkBox.style.color = '';
        checkBox.style.boxShadow = 'none';
      }
    });

    // hoverで背景色を変更
    checkBox.addEventListener('mouseover', function() {
      if (!inputElement.checked) {
        checkBox.style.backgroundColor = '#c9f29b';
      }
    });
    checkBox.addEventListener('mouseout', function() {
      if (!inputElement.checked) {
        checkBox.style.backgroundColor = '';
      }
    });
  }
};

window.addEventListener('load', feel_checkbox);
window.addEventListener('turbo:render', feel_checkbox);
