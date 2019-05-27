document.addEventListener('DOMContentLoaded', () => {
  const federalRegistry = document.querySelector('.cpf');

  if(federalRegistry) {
    new Cleave('.cpf', {
      delimiters: ['.', '.', '-'],
      blocks: [3, 3, 3, 2],
      delimiterLazyShow: true
    });
  }
});
