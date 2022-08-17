const mongoose=require('mongoose')

const count= new  mongoose.Schema({
    idcount:{
        type:String,
        required:true,
       },
    count:{
     type:String,
     required:true,
    },
 
    
       
})

module.exports=mongoose.model('counts',count)