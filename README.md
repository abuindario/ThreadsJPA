# Threads! - Discussion forum with JPA
Threads! is a discussion forum developed in Java with Maven, using the Java Persistence API (JPA) and Java Server Pages (JSP). <br>
It is developed using the model-view-controller design pattern.<br>
It is connected to a local database (MySQL). <br>
The technologies used for the frontend are JavaScript (HTML <script> tags), HTML and CSS.
## Login Page
When the program is executed, the first page is the login page. <br>
Registered users can access by filling in their details, and there is a link to the sign up page.
![loginPage](https://github.com/abuindario/ThreadsJPA/assets/92298516/ee3869a3-ef73-49e7-aa7f-ab8ed33562bf)
The 'Already logged-in' link and the 'Terminate session' button are used to check the HTTP Session if there is a user logged-in and to force the Servlet to terminate the existing session (log out the user).
## Sign up Page
On the sign up page, users can register by filling in their details.
![signupPage](https://github.com/abuindario/ThreadsJPA/assets/92298516/8093c690-6126-4cb3-9b2b-bad900ac10b0)
All fields are mandatory, and they may have special checks:
- Text fields can not be null nor filled with blank spaces.
- The password must have a capital letter, a number, and must be at least 8 character long.
- The password must be the same on both fields to complete the registration.
![signupPage_validatePassword](https://github.com/abuindario/ThreadsJPA/assets/92298516/a0ac970f-e2c0-4c88-bc1b-bbd979e332eb)
##
![signupPage_matchPassword](https://github.com/abuindario/ThreadsJPA/assets/92298516/8399ba19-02e3-41bf-9664-2af341c207b7)
## Threads Page
At the top of the page, the current logged user, a logout button, and a link to return to the login page (without logging out the user). This section is always fixed at the top of the page during user scrolling. <br>
The Threads table contains the Thread name, actions that can be performed on the Thread, the author of the Thread, the publication date, and the number of messages in a Thread.<br>
The table header is stuck at the top of the page during user scrolling.
![threadsPage](https://github.com/abuindario/ThreadsJPA/assets/92298516/6c32efe0-60bf-4471-88d0-09678596aa5e)
- Thread's name can be modified only by their author. If the user logged in is the author, the 'Edit' button will be available in the 'Actions' column.
- Threads can only be deleted by their author. If the user logged in is the author, the 'Delete' button will be available in the 'Actions' column.
- All users can access a Thread to read the messages that are posted by using the 'Access' button.
- New Threads are displayed first.
- The last row of the table allow users to post a new Thread.
## Thread Messages
At the top of the page, the current logged user, a logout button, and a link to return to the Threads page. This section is always fixed at the top of the page during user scrolling. <br>
The Thread table contains the message posted, actions that can be performed on the message, the author of the message, and the publication date.<br>
The table header is stuck at the top of the page during user scrolling.
![messagesPage](https://github.com/abuindario/ThreadsJPA/assets/92298516/7aeb6f13-741c-4309-bd54-9cb8a28eda42)
- Messages can be edited only by their author. If the user logged in is the author, the 'Edit' button will be available in the 'Actions' column.
- Messages can only be deleted by their author. If the user logged in is the author, the 'Delete' button will be available in the 'Actions' column.
- Old messages are displayed first.
- The last row of the table allow users to post a new message in a Thread.
