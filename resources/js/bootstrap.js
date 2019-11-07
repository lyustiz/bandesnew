//usuario
let userHeader = document.head.querySelector('meta[name="user"]')
window.user = null
if (userHeader) if (userHeader.content) window.user = JSON.parse(userHeader.content);
