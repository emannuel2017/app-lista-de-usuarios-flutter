const mongoose = require('mongoose');

async function connect(){
    await mongoose.connect('mongodb://localhost:28015/flutter-node-tutorial-1', {
        useNewUrlParser: true
    });
    console.log("Database: connect");
}
module.exports = { connect }