const mongoose=require('mongoose')
const { json } = require('node:stream/consumers')

const notificationSchema= new  mongoose.Schema({
    
    noticeTitle:{
     type:String,
     required:true,
    },
    descriptionNotice:{
        type:String,
        required:true,
       },
       eventDate:{
        type:Date,
        required:true
       },
       puplishDate:{
        type:Date,
        required:true
       },
       lat:{
        type: Number,
        unique: true,
       },
       lng:{
        type: Number,
        required:true,
       },
       dest:
       {
           type:[]
           
       },
       
       open:{
           type: String,
         required: true
        }
       
})

module.exports=mongoose.model('notifications',notificationSchema)