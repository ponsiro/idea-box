if (document.URL.match( /./ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');
  
    document.getElementById("message_image").addEventListener("change", function(e) {
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
  
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'preview-image')
  
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    });
  });
}
