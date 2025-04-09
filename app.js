const express = require("express");
const app = express();

const port = 3000;

app.get("/", (req, res) => {
  res.send("<h1>Express demo app</h1> <h4>HI</h4> <p>version 1.0</p>");
});

app.get("/products", (req, res) => {
  res.send([
    {
      productId: "1",
      price: 100,
    },
    {
      productId: "2",
      price: 200,
    },
  ]);
});

app.listen(port, () => console.log("app is connected"));
