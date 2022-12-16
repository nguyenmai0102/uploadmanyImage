<%--
  Created by IntelliJ IDEA.
  User: levietdunghiki
  Date: 13-Dec-22
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
 <h1>Employee Edit</h1>
 <form  action="<%=request.getContextPath()%>/employee/edit" method="post">
   <div>
     <span>Id:</span>
     <input type="text" name="id" value="${employee.id}"/>
   </div>
   <div>
     <span>Name:</span>
     <input type="text" name="name" value="${employee.name}"/>
   </div>
   <div>
     <span>Email:</span>
     <input type="text" name="email" value="${employee.email}"/>
   </div>
     <div>
         <span>Upload Image</span>
         <input type="file" value="upload" accept=".jpg" id="fileButton">
         <input type="text" name="avatar" id="avatar" readonly/>
     </div>
   <input type="submit" value="Update"/>

 </form>

 <script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
 <script>

     //BE SURE TO PROTECT EVERYTHING IN THE CONFIG
     //DON'T COMMIT IT!!!

     // Initialize Firebase
     const firebaseConfig = {
         apiKey: "AIzaSyCR458XfnNaTRpyIrg6gayLtweG6g8w29o",
         authDomain: "maimeo-f0d86.firebaseapp.com",
         projectId: "maimeo-f0d86",
         storageBucket: "maimeo-f0d86.appspot.com",
         messagingSenderId: "494634549684",
         appId: "1:494634549684:web:781b93d9cbd634c7a2b2e1",
         measurementId: "G-LLN05VE2HJ"
     };
     firebase.initializeApp(firebaseConfig);
 </script>

 <script type="text/javascript">


     // get elements
     var uploader = document.getElementById('uploader');
     var fileButton = document.getElementById('fileButton');


     // listen for file selection
     fileButton.addEventListener('change', function (e) {

         // get file
         var file = e.target.files[0];

         console.log(file)

         // create a storage ref
         var storageRef = firebase.storage().ref('images/' + file.name);

         // upload file
         var uploadTask = storageRef.put(file);

         // The part below is largely copy-pasted from the 'Full Example' section from
         // https://firebase.google.com/docs/storage/web/upload-files

         // update progress bar
         uploadTask.on(firebase.storage.TaskEvent.STATE_CHANGED, // or 'state_changed'
             function (snapshot) {

                 switch (snapshot.state) {
                     case firebase.storage.TaskState.PAUSED: // or 'paused'
                         console.log('Upload is paused');
                         break;
                     case firebase.storage.TaskState.RUNNING: // or 'running'
                         console.log('Upload is running');
                         break;
                 }
             }, function (error) {

                 // A full list of error codes is available at
                 // https://firebase.google.com/docs/storage/web/handle-errors
                 switch (error.code) {
                     case 'storage/unauthorized':
                         // User doesn't have permission to access the object
                         break;

                     case 'storage/canceled':
                         // User canceled the upload
                         break;

                     case 'storage/unknown':
                         // Unknown error occurred, inspect error.serverResponse
                         break;
                 }
             }, function () {
                 // Upload completed successfully, now we can get the download URL
                 // save this link somewhere, e.g. put it in an input field
                 var downloadURL = uploadTask.snapshot.downloadURL;
                 // image = downloadURL;
                 document.getElementById("avatar").value = downloadURL;
                 console.log('downloadURL ===>', downloadURL);

             });

     });

 </script>
</body>
</html>
