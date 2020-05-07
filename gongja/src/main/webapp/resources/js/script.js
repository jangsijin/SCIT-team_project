const video = document.getElementById('video')
let detectionEmotion = 'netural';
var warning = document.getElementById('warning')
var hidden = false;
var hide = false;
var warning = new Audio('../resources/mp3/siren.mp3');
var tired = new Audio('../resources/mp3/피곤해.mp3');

var hcount = 0
var scount = 0
var count = 0;
var count1 = 0;
var ncount =0;

Promise.all([
  faceapi.nets.tinyFaceDetector.loadFromUri('../resources/models'),
  faceapi.nets.faceLandmark68Net.loadFromUri('../resources/models'),
  faceapi.nets.faceRecognitionNet.loadFromUri('../resources/models'),
  faceapi.nets.faceExpressionNet.loadFromUri('../resources/models')
]).then(startVideo)


$(document).ready(function(){
   $('#pause1').hide();
   $('#pause2').hide();
   pauseWarning();
   pauseTired();
});

function startVideo() {
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.oGetUserMedia || navigator.msGetUserMedia ;
  URL = window.URL ||window.webkitURL || window.mozURL ||  window.oURL || window.msURL;
  navigator.getUserMedia(
    { video: {audio:true, video : true} },
    stream => video.srcObject = stream,
    err => console.error(err)
  )  
}



/*function hiddenPause(){
   var temp = document.getElementById('pause');
   if(warning.play()==false){
      temp.style.display='block';
   }else{
      temp.style.display='none';
   }
}*/

function pauseWarning(){
   console.log("here");
   if(hidden == true){
      $('#pause1').show();
      warning.play();
   }
   $('#pause1').off('click').on('click', function(){
      warning.pause();
      warning.currentTime=0;
      $('#pause1').hide();
      hcount= hcount+1;//바뀜
      hidden = false;
   });
}

//추가된거
function pauseTired(){
   console.log("come");
   if(hide == true){
      $('#pause2').show();
      tired.currentTime=120;
      tired.play();
   }
   $('#pause2').off('click').on('click', function(){
      tired.pause();
      tired.currentTime=0;
      $('#pause2').hide();
      hidden = false;
      scount = scount+1;
   });
}

video.addEventListener('play', () => {
  const canvas = faceapi.createCanvasFromMedia(video)
  document.body.append(canvas)
  const displaySize = { width: video.width, height: video.height }
  faceapi.matchDimensions(canvas, displaySize)
  setInterval(async () => {
    const detections = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions()).withFaceLandmarks().withFaceExpressions()
    for(var i = 0; i < detections.length; i++){
//       console.log(detections[i].expressions)
       const happy = detections[i].expressions.happy;
       const neutral = detections[i].expressions.neutral;
       
       if (happy > 0.8 && happy < 1){
          count++;
          console.log("a",count);
          if(count>10){
             Push.create("Hello world!", {
                 body: "딴짓하지마",
                 icon: 'images/logo11.png',
                 timeout: 4000,
                 onClick: function () {
                     window.focus();
                     this.close();
                 }
             });
             
             count = 0;
             ncount=0;
             console.log('딴짓',hcount);
             hidden = true;
             pauseWarning();
             
          }
       }   
       //추가된거
       if(neutral>0.8&&neutral<1){
          ncount++;
          console.log(ncount);
          if(ncount==20){
             if(count>0&&count<9||count1>0&&count1<3){
                count=0;
                count1 = 0;
                ncount=0;
             }else{
                ncount=0;
             }
          }
       }
       var surprised = detections[i].expressions.surprised
       if(surprised > 0.75 && surprised < 0.99){
          count1++;
          console.log("b",count1);
          if(count1 > 4){
             Push.create("Hello world!", {
                 body: "졸리냐?ㅋㅋㅋㅋㅋ",
                 icon: 'images/logo11.png',
                 timeout: 4000,
                 onClick: function () {
                     window.focus();
                     this.close();
                 }
             });
             console.log('졸림',scount)
             hide=true;
             pauseTired();
             ncount=0;
             count1=0;
          }
       }
    }
//    if (detections[0])
//        console.log(detections[0].expressions)
    const resizedDetections = faceapi.resizeResults(detections, displaySize)
    canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height)
//    faceapi.draw.drawDetections(canvas, resizedDetections)
//    faceapi.draw.drawFaceLandmarks(canvas, resizedDetections)
//    faceapi.draw.drawFaceExpressions(canvas, resizedDetections)
  }, 100)
  })