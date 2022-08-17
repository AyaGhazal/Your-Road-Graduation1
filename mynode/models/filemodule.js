const mongoose = require("mongoose");
const myfile = new mongoose.Schema({
    x: {
      type: Number,
      //required: true,
    
    },
    y: {
      type: Number,
     // required: true,
  
    },
   z: {
      type: Number,
   // required: true,
    },
    index: {
      type: Number,
     // required: true,
    },
    lat: {
      type: Number,
     // required: true,
    },
    lng: {
      type: Number,
     // required: true,
    },
    date: {
      type: Date,
     // required: true,
    },
    time:{
      type: String,
    },

id:{
  type:Number,
}
  })
  module.exports=mongoose.model('vibreations',myfile)