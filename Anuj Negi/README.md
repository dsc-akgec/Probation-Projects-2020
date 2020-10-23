# DSC-AKGEC WEBSITE

## Description

Probation Project for DSC-AKGEC.

## Live Preview

[DSC-AKGEC](http://dsc-akgec.netlify.app)
(without working backend)
<br>

# To Run on Local Machine

Follow the steps to get the project running on your machine.  
<br>
1 - Open cmd and change directory to the folder containing "mail.js", then type command

```
npm install
```

This command to install all the dependencies for nodejs to work.  
<br>
2 - Then go to the folder "dsc_website" and open the cmd in that folder, then type command

```
npm install
```

This command to install all the dependencies for React to work. (This may take some time.)
<br>
3- now come back to the root directory and write the command

```
npm run dev
```

This command will start both frontend and backend on different ports and will open the frontend project in your default browser.

## Register Form

### Requirement for working form

### In the root folder containing "mail.js" create a ".env" file and add two variables in the file:-

1- USER_ID = [gmail id from which you want to send mail]  
2- PASSWORD = [password of that mail id]

In "dsc_website" folder create another ".env" file and add four variables in the file:-

1- REACT_APP_SPREADSHEET_ID = [spreadsheet id]  
2- REACT_APP_SHEET_ID = [sheet id]  
3- REACT_APP_CLIENT_EMAIL = [email id of the service account from google developers console]

- [READ MORE](https://support.google.com/a/answer/7378726?hl=en)

4- REACT_APP_PRIVATE_KEY = [api key for google sheets api]
