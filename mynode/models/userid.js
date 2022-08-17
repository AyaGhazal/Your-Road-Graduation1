const mongoose = require("mongoose");

const Int32 = require("mongoose-int32").loadType(mongoose);

const useridmodel = mongoose.Schema({
  id: {
    type: Number,
    required: true,
    unique:true

  },
 
  
});

module.exports = mongoose.model("userids", useridmodel);