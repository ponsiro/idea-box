document.addEventListener('DOMContentLoaded', function() {
  const editPreview = document.getElementById('edit-icon-preview');

  document.getElementById('upload-icon').addEventListener('change', function(e) {
    const imageContent = document.querySelector('#icon')
    if (imageContent){
      imageContent.remove();
    }

    const imageDiv = document.getElementById('edit-user-icon')
    if (imageDiv) {
      imageDiv.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const imageElement = document.createElement('div');
    const blobImage = document.createElement('img');
    imageElement.setAttribute('class', 'edit-user-icon')
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('class', 'icon');
    blobImage.setAttribute('id', "icon");

    imageElement.appendChild(blobImage);
    editPreview.appendChild(imageElement);
  });
});