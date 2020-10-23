const mailer = require("nodemailer");
require("dotenv").config();

const getEmailData = (data) => {
  data = {
    from: "devilbuddyy@gmail.com",
    to: data.email,
    subject: `Hello ${data.fullName}`,
    html: `<!DOCTYPE html>
    <html>
      <body>
        <div>
          <h3>
            Hello, ${data.fullName}
          <h3>
          <p>
            You have successfully registered for the event.
            You will be shortly informed about further details.
          </p>
          <h4>Check if your details are correct</h4>
          <ul>
            <li>
              full name: ${data.fullName}
            </li>
            <li>
              year: ${data.year}
            </li>
            <li>
              branch: ${data.branch}
            </li>
            <li>
              section: ${data.section}
            </li>
            <li>
              student number: ${data.studentNumber}
            </li>
            <li>
              university roll number: ${data.universityRollNumber}
            </li>
          </ul>
        </div>  
      </body>
    </html>`,
  };
  return data;
};

// console.log(process.env, process.env.PASSWORD);

const sendEmail = (data) => {
  const smtpTransport = mailer.createTransport({
    service: "Gmail",
    auth: {
      user: process.env.USER_ID,
      pass: process.env.PASSWORD,
    },
  });

  const mail = getEmailData(data);

  smtpTransport.sendMail(mail, function (error, response) {
    if (error) {
      console.log(error);
    } else {
      console.log("email sent");
    }
    smtpTransport.close();
  });
};

module.exports = { sendEmail };
