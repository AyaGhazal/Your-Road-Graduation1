const mongoose = require("mongoose");

const Int32 = require("mongoose-int32").loadType(mongoose);
//const Double =mongoose.Schema.Types.Double;
//const Double = require('@mongoosejs/double');
const usersignSchema = mongoose.Schema({
  fullname: {
    type: String,
    required: true,
  },
  id: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  gender: {
    type: String,
    required: true,
  },
 
  lat:{
    type: Number,
    required:true,
  },
  long:{
    type: Number,
    required:true,
  },
  age: {
    type: Int32,
    required: true,
  },
  points:{
    type: Int32,
    required:true,
  },
  specialneeds:{
    type:String,
    required: true,
  },
  rate:{
    type:Number,
    //required:true,

  }
});

module.exports = mongoose.model("userinfos", usersignSchema);