

<?php
$con=mysqli_connect("127.2.253.1","lpierik","","mydb");
// Check connection
if (mysqli_connect_errno()) {
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$result = mysqli_query($con,"SELECT * FROM PROFILE");

    $row = mysqli_fetch_array($result);
 //echo $row['FIRST_NAME'] . "" . $row['LAST_NAME'];
 //echo "<br>";
?>


<html>
  <head>
    <title>Lauren Pierik LinkedIn</title>
  </head>
  
  <body id="body" style="background-color: LightGray; font-family: arial,helvetica,sans-serif;">
    <div id="wrapper" style="margin: 0 auto; width: 990px: height:1000px">
     
     <div id="profile" style="width: 710px; height:230px; float: left; background-color: White; margin: 10px 0;">
       <div id="profile-picture" style="float: left; width: 200px; height: 150px; text-align: center; padding-top:20px; margin-top:20px; margin-bottom:20px;">
         <img style="width: 150px; height: 150px; margin-left: 20px; margin-bottom: 20px"; " alt="Lauren Pierik" src="https://media.licdn.com/mpr/mpr/shrink_200_200/p/6/005/059/1e6/0b45d80.jpg">
       </div>
         
         <div id="profile-overview" style="float: left; width: 500px; line-height: 199px; margin-top: 20px;, margin-bottom: 20px:">
             <h1 style="color: DarkSlateGray; font-size: 18px; font-weight: 700; line-height: 24px; 
                 margin: 20px; text-shadow: 1px 1px 2px #E9E9E9; text-transform: uppercase;"> <?php echo $row["FIRST_NAME"] ." ". $row["LAST_NAME"]; ?> </h1>
                <p style="line-height: 1px; margin: 20px; padding: 0; color: 70715A; font-size: 18px;">
                <?php echo $row["CURR_TITLE"] ."  ". $row["RECENT_JOBS"]; ?>
               </p>
               <p style="line-height: 15px; margin: 20px; padding: 0; color: Black; font-size: 13px;">
                San Francisco, CA | Government Administration</p>
                <p style="line-height: 15px; margin: 20px; padding: 0 color: Black; font-size: 11px;">
                <strong>Current &nbsp;&nbsp;&nbsp;US Census Bureau, Tekmeca, Gap Inc./Old Navy Flagship Store</strong>
                  <br>
                <strong>Previous</strong>&nbsp;&nbsp;US Census Bureau, Gap Inc./Banana Republic, US Census Bureau
                  <br>
                <strong>Education</strong>&nbsp;Tekmeca Cloud Computing Academy   
                </br>
                <br>
                <input type="button" value="Connect"> <input type="button" value="Send Lauren Email">
               </p>
         </div>        
      </div>
    </div>
    
    <div id="content" style="width: 710px; float: left; background-color: White; margin: 10px 0;">
      <h1 style="color: DarkSlateGray; font-size: 18px; font-weight: 700; line-height: 24px; 
          margin: 20px; text-shadow: 1px 1px 2px  #E9E9E9; text-transform: uppercase;">Summary</h1>
        <p style="font-size: 14px; line-height: 22px; margin: 20px; padding: 0">
        <?php echo $row["SUMMARY"];?>    
        </p>
        <hr>
        <img style="float: right; margin-right: 30px; margin-top: 30px"; alt="US Census Bureau"; src="https://media.licdn.com/media/p/2/000/02e/327/2ec0674.png">
        <h1 style="color: DarkSlateGray; font-size: 18px; font-weight: 700; line-height: 24px; 
          margin: 20px; text-shadow: 1px 1px 2px #E9E9E9; text-transform:uppercase;">Experience</h1>
          
    <?php
                    $result = mysqli_query($con,"SELECT * FROM EXPERIENCE");
                    while($rowExperience = mysqli_fetch_array($result)) {
                ?>
                      <p style="font-size: 14px; line-height: 22px; margin: 20px; padding: 0;"><?php echo $rowExperience["JOB_TITLE"] ."  ". $rowExperience["COMPANY"]; ?></p>
                      
                      <p style="line-height: 2px; margin: 20px; padding: 0; color: DimGray; font-size: 13px">
                      <?php 
                      
                      echo date('M-Y', strtotime($rowExperience["START_DATE"])) . " - "; 
                      
                      if ($rowExperience["END_DATE"] == null) 
                      {
                        echo "Present";
                      }
                      else
                      {
                        date('M-Y', strtotime($rowExperience["END_DATE"])); 
                      };
                      
                      ?></p>
                      <b></b>
                      <p style="font-size: 14px; line-height: 22px; margin: 20px; padding: 0;"><?php echo $rowExperience['DESCRIPTION']; ?></p>
                            
                 
                <?php } ?>
                
        
        <img style="float: right; margin-right: 20px; alt="Old Navy" src="https://media.licdn.com/media/p/2/005/00b/04e/3ce82cd.png">
        
            
        </p>
    </div>
  </body>               
</html>
<?php mysqli_close($con);
?>
