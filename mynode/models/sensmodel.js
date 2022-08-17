const mongoose = require("mongoose");

const Int32 = require("mongoose-int32").loadType(mongoose);
//const Double =mongoose.Schema.Types.Double;
//const Double = require('@mongoosejs/double');
const sensSchema = mongoose.Schema({
  x: {
    type: Number,
    required: true,
  },
  y: {
    type: Number,
    required: true,
  },
  z: {
    type: Number,
    required: true,
  },
  j: {
    type: Number,
    required: true,
  },
  
});

module.exports = mongoose.model("testsens", sensSchema);