<%--
  Created by IntelliJ IDEA.
  User: levietdunghiki
  Date: 13-Dec-22
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Manager</title>
</head>
<body>

  <h1>Create Employee</h1>
  <form action="<%=request.getContextPath()%>/employee/create" method="post" id="employeeForm">
    <div>
      <span>Name:</span>
      <input type="text" name="name"/>
    </div>
    <div>
      <span>Email:</span>
      <input type="text" name="email"/>
    </div>
    <div>
      <span>Upload Image</span>

      <input type="file" value="upload" accept=".jpg" multiple id="fileButton">

    </div>
    <div id="displayUpload"></div>
    <br>
    <input type="submit" value="create"/>

  </form>



  <script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
  <script>

    //BE SURE TO PROTECT EVERYTHING IN THE CONFIG
    //DON'T COMMIT IT!!!

    // Initialize Firebase

    function displayLink(link) {
      const node = document.getElementById("displayUpload");
      const addInput = document.createElement("input");
      const br = document.createElement("br");
      addInput.name = "listavatar";
      addInput.value = link;
      addInput.readOnly;
      node.appendChild(br)
      node.appendChild(addInput);
    }


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
    let totalLinks = [];

    // listen for file selection
    fileButton.addEventListener('change', function (e) {

      // get file
      for (var i = 0; i < e.target.files.length; i++) {
        var imageFile = e.target.files[i];
        uploadImageAsPromise(imageFile);
      }



    });

    function uploadImageAsPromise(imageFile) {
      return new Promise(function (resolve, reject) {
        var storageRef = firebase.storage().ref("images" + "/" + imageFile.name);

        //Upload file
        var task = storageRef.put(imageFile);

        //Update progress bar
        task.on('state_changed',
                function progress(snapshot) {
                  var percentage = snapshot.bytesTransferred / snapshot.totalBytes * 100;

                },
                function error(err) {

                },
                function complete() {
                  var downloadURL = task.snapshot.downloadURL;
                  displayLink(downloadURL)
                }
        );
      });
    }

  </script>
    </body>
</html>
