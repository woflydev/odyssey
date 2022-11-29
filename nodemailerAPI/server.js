const express = require("express");
const nodemailer = require("nodemailer");
const app = express();
require("dotenv").config();

let transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      type: "OAuth2",
      user: process.env.EMAIL,
      pass: process.env.WORD,
      clientId: process.env.OAUTH_CLIENTID,
      clientSecret: process.env.OAUTH_CLIENT_SECRET,
      refreshToken: process.env.OAUTH_REFRESH_TOKEN,
    },
   });

transporter.verify((err, success) => {
err
    ? console.log(err)
    : console.log(`=== Server is ready to take messages: ${success} ===`);
});

let mailOptions = {
    from: "test@gmail.com",
    to: process.env.EMAIL,
    subject: "Nodemailer API",
    text: "Hi from your nodemailer API",
   };

app.post("/send", function (req, res) {
    let mailOptions = {
        from: "test@gmail.com",
        to: process.env.EMAIL,
        subject: "Nodemailer API",
        text: "Hi from your nodemailer API",
    };

    transporter.sendMail(mailOptions, function (err, data) {
        if (err) {
            console.log("Error " + err);
        } else {
            console.log("Email sent successfully");
            res.json({ status: "Email sent" });
        }
    });
});

// engage server on port
const port = 9999;
app.listen(port, () => {
 console.log(`Server is running on port: ${port}`);
});