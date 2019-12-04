function showSelectedFile() {
  if (window.File && window.FileReader && window.FileList && window.Blob) {
    let currentImage = document.getElementById('current_avatar');
    let file = document.getElementById('user_avatar').files[0];
    let reader = new FileReader();
    reader.onload = function (event) {
      currentImage.src = reader.result;
    };
    reader.readAsDataURL(file);
  } else {
    alert("Your browser is too old to support HTML5 File API");
  }
}

document.getElementById('user_avatar').addEventListener('change', () => {
  showSelectedFile();
});
