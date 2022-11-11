const express = require("express");
const mongoose = require("mongoose");
// Import from orther files
const authRouter = require("./routes/auth");

const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://tthanh:tthanh123@cluster0.vtxu09d.mongodb.net/?retryWrites=true&w=majority";

// Middleware
app.use(express.json());
app.use(authRouter);

// Connections to mongoose
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successfull");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`conected at port ${PORT}`);
});
