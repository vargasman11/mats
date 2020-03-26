var apply = bodymovin.loadAnimation({
    container: document.getElementById('lottieApply'), // Required
    path: '/render_apply/data.json', // Required
    renderer: 'svg', // Required
    loop: true, // Optional
    autoplay: true, // Optional
  })


  var chat = bodymovin.loadAnimation({
    container: document.getElementById('lottieChat'), // Required
    path: '/render_chat/data.json', // Required
    renderer: 'svg', // Required
    loop: true, // Optional
    autoplay: true, // Optional
  })

  // Mobile Version
  var chatM = bodymovin.loadAnimation({
    container: document.getElementById('lottieChatM'), // Required
    path: '/render_chat/data.json', // Required
    renderer: 'svg', // Required
    loop: true, // Optional
    autoplay: true, // Optional
  })


