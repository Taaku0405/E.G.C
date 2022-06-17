function sleep(msec) {
   return new Promise(function(resolve) {

      setTimeout(function() {resolve()}, msec);

   })
};

/* global $*/
$(document).ready(function (){
  $('#flash-message').slideDown(1500,async function start(){
    await sleep(2000);
    $('#flash-message').slideUp(1500);
  });
});