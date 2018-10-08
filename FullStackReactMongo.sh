#!/bin/bash
#Use dos2unix in bash terminal to make it readable by bash
# Use: FullStackReactApp.sh <AppName>
mkdir $1
cd $1
npm init -y
create-react-app client
# mkdir client
# mkdir client/public
# mkdir client/src

mkdir models
mkdir routes


cat <<EOF > server.js
const express = require("express");
const bodyParser = require("body-parser");

const PORT = process.env.PORT || 3001;
const app = express();
app.use(bodyParser.urlencoded({encoded: true}));
app.use(bodyParser.json());

const routes = require("./routes/api.js");
app.use(routes);

//app.use(express.static("client/build"));

// require("./routes/api.js")(app);

app.listen(PORT, function(){
        console.log(`Server running on port ${PORT}`);
})
EOF


cat <<EOF >routes/api.js
const router = require("express").Router();
var db = require("../models");


module.exports = router;
EOF

cat <<EOF >models/index.js
module.exports = {

}
EOF

npm install express body-parser