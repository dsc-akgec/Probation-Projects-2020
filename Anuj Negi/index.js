const express = require("express");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");

const { sendEmail } = require("./mail");

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cookieParser());

app.post("/api/register", (req, res) => {
  sendEmail(req.body);
  res.send("registered successfully");
});

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`server starting at port ${PORT}`);
});
