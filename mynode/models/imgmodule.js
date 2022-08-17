var mongoose = require('mongoose');
const multer  = require('multer');
var imageSchema = new mongoose.Schema({
  img:
    {
        data: Buffer,
        //contentType: String
    },
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
        required:true,
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
      massage:{
        type:String,
       // required:true,
      }
   
   
});
  
//Image is a model which has a schema imageSchema
  
module.exports = new mongoose.model('compliments', imageSchema);
