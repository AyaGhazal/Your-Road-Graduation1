const mongoose = require("mongoose");
const fileid = new mongoose.Schema({
 
    date: {
      type: Date,
     required: true,
    },
    analyzed: {
        type: Boolean,
       required: true,
      },
      fileID: {
        type: Number,
       required: true,
      },
      userID: {
        type: String,
       required: true,
      },
  

  })
  module.exports=mongoose.model('vibreationids',fileid)