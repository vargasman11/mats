// apply in the homepage
var apply = bodymovin.loadAnimation({
    container: document.getElementById('applyLottie'), // Required
    path: '/REnder_apply/data.json', // Required
    renderer: 'svg', // Required
    loop: true, // Optional
    autoplay: true, // Optional
  })

  // Apply icon in the jobs index
  var applyTwo = bodymovin.loadAnimation({
    container: document.getElementById('applyLottie2'), // Required
    path: '/REnder_apply/data.json', // Required
    renderer: 'svg', // Required
    loop: true, // Optional
    autoplay: true, // Optional
  })


//  Chat in the desktop version
  var chat = bodymovin.loadAnimation({
    container: document.getElementById('lottieChat'), // Required
    path: '/render_chat/data.json', // Required
    renderer: 'svg', // Required
    loop: true, // Optional
    autoplay: true, // Optional
  })

  //Chat in the Mobile Version
  var chatM = bodymovin.loadAnimation({
    container: document.getElementById('lottieChatM'), // Required
    path: '/render_chat/data.json', // Required
    renderer: 'svg', // Required
    loop: true, // Optional
    autoplay: true, // Optional
  })


