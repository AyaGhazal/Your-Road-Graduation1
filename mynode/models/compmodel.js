const mongoose = require("mongoose");
const ComplimantsSehema = new mongoose.Schema({
    complainantsName: {
      type: String,
      required: true,
      maxlength: 32,
    },
    type: {
      type: String,
      required: true,
      maxlength: 32,
    },
   place: {
      type: String,
      required: true,
      maxlength: 32,
    },
    descrption: {
      type: String,
    },
    image: {
      type: String,
      required: true,
    },
    date:{
      type:Date,
      required:true,
    },
    lat:{
      type:Number,
      required:true,
    },
   lng:{
      type:Number,
      required:true,
    },
    isOpen:{
      type:Boolean,
      required:true,
    },
    solved:{
      type:Boolean,
      required:true,
    },
    solvingMechanism:{
      type: String,
      required: true,
    },
    userID:{
      type:Number,
      required:true
    },
    resentMessages:{
      type: String,
      required: true,
    },
    adminID:{
      type:Number,
      required:true
    },
    adminIDsolve:{
      type:Number,
      required:true
    },
  })
  module.exports=mongoose.model('Compliments',ComplimantsSehema)