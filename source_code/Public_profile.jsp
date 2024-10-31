<%-- 
    Document   : Public_profile
    Created on : Oct 7, 2024, 11:52:58 PM
    Author     : 84396
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initi5al-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Pager Public Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Public_profilee.css">
</head>
<body>
    <header>
        <nav>
          <ul> 
              <li>
                  <p><a href="Home_login.jsp?email=${email}"><img src="Imgs/Logo.png" alt=""></a></p>
              </li>
              <li>
                  <div class="search-container">
                      <i class="fas fa-magnifying-glass search-icon"></i>
                      <input type="text" class="search-input" placeholder="Search...">
                  </div>
              </li>
              <li>
                  <p><a href=""><h3>Study</h3></a></p>
              </li>
               <li>
                  <p><i class="fa-regular fa-heart"></i></p>
               </li>
               <li>
                  <a href="viewCart?email=${email}"><p><i class="fa-solid fa-cart-shopping"></i></p></a>
                </li>
                <li>
                   <p><i class="fa-regular fa-bell"></i></p>
                </li>
                <li>
                   <p><i class="fa-regular fa-circle-user"></i></p>
                </li>
                <li>
                    <p><a href=""><h3>${email}</h3></a></p>
                </li>
          </ul>
        </nav>

        <div  class="checked" onclick="Mychecked()">
            <p><i class="fa-solid fa-bars"></i></p>
            <div class="search-container">
              <i class="fas fa-magnifying-glass search-icon"></i>
              <input type="text" class="search-input" placeholder="Search...">
            </div>
          </div>
          <div id="checked" class="line_nav">
            <ul>
                <li>
                    <p><a href="">Study</a></p>
                </li>
                 <li>
                    <p><a href=""><i class="fa-regular fa-heart"></i></a></p>
                 </li>
                 <li>
                    <p><a href=""><i class="fa-solid fa-cart-shopping"></i></a></p>
                  </li>
                  <li>
                     <p><a href=""><i class="fa-regular fa-bell"></i></a></p>
                  </li>
                  <li>
                     <p><a href=""><i class="fa-regular fa-circle-user"></i></a></p>
                  </li>
                  <li>
                      <p><a href="">Alex</a></p>
                  </li>
            </ul>
          </div>
    </header>

        <main>
            <table>
                <tr>
                    <td class="table_left" style="width: 30%;">
                        <div class="user">
                            <p><img src="Imgs/user.png" alt=""></p>
                            <h3>${name}</h3>
                        </div>
                        
                        <div class="user_content">
                            <p>View public profile</p>
                            <p>Profile</p>
                            <p>Photo</p>
                            <p>Account</p>
                            <p>Security</p>
                            <p>Subscription</p>
                            <p>Payment methods</p>
                            <p>Privacy</p>
                            <p>Notifications</p>
                            <p>API client Close</p>
                            <p>Account</p>
                        </div>
                    </td>

                    <td class="table_right" style="width: 70%;">
                        <div class="profile_tittle">
                            <h3>Public Profile</h3>
                            <p>Add information about yourself</p>
                        </div>

                        <div class="information_user">
                            <form method="post" action="edit_profile">
                            <h4>Username</h4>
                            <p><input name="name" type="text" value="${name}"></p>
                            <h4>Date of birth</h4>
                            <p><input name="date_of_birth" type="text" value="${date_of_birth}"></p>
                            <h4>Gender</h4>
                            <p><input name="gender" type="text" value="${gender}"></p>
                            <h4>Bio</h4>
                            <p><textarea name="bio" id=""">${bio}</textarea></p>
                            <h4>Email</h4>
                            <p><input name="email" type="text" value="${email}"></p>
                            <h4>Phone</h4>
                            <p><input name="phone_number" type="text" value="${phone_number}"></p>
                            <h4>Address</h4>
                            <p><input name="address" type="text" value="${address}"></p>
                            <button class="submit" type="submit">Save</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </table>
        </main>

</body>
<script src="Public_profile.js"></script>
</html>
