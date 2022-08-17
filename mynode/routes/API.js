require("../models/signmodel.js");

const express = require("express");
const router = express.Router();

const multer  = require('multer');
const path = require('path');
const signmodel = require("../models/signmodel");
const sensmodel = require("../models/sensmodel");
var imgModel = require('../models/imgmodule');
//router.get("/s")





router.post("/uploadfile", async (req, res) => {
  const newsens = new sensmodel({
    
       x: req.body.x,
        y: req.body.y,
        z: req.body.z,
        j:req.body.j,
      
       
     
        
    
    
      });
       
  try {
   
    const news = await newsens.save();
    res.send(newsens)
    res.json(news);
   return res.sendStatus(201).json(news);
   
  } catch (error) {
    res.json({ mssssg: error });
  }
}
);


router.post("/signuser", async (req, res) => {
  const UserSign = new signmodel({
    
       fullname: req.body.fullname,
        id: req.body.id,
        email: req.body.email,
        password:req.body.password,
        gender:req.body.gender,
       
        lat:req.body.lat,
        long:req.body.long,
        age:req.body.age,
        points:req.body.points,
        specialneeds:req.body.specialneeds,
        
    
    
      });
       
  try {
   
    const newuser = await UserSign.save();
    res.send(UserSign)
    res.json(newuser);
  //return rsendStatus(201);
   //json(newuser);
   
  } catch (error) {
    res.json({ mssssg: error });
  }
}
);









 /*
const result1 =  userinfos.insertOne(    {, "date":
" 2022-05-5T21:00:00.000+00:00","fileID":integer,"userID" :"1"});*/

 
  

/*
//getting all userTasks
router.get("/getUsers", async (req, res) => {
    try {
      let user = await UserSign.find();
      res.json(user);
    } catch (e) {
      res.json({ msg: e });
    }
  });
//router.get("/")
  //updating userTask based on task id
router.patch("/updateuserinfo/:id", async (req, res) => {
    try {
      const result = await UserSign.findOneAndUpdate(
        { _id: req.params.id }, //filter conditions
        { $set: { fullnameuser: req.body.fullnameuser,id: req.body.id,
            email: req.body.email,password:req.body.password,
             gender:req.body.gender,age:req.body.age},
           }, //update value of specific field
        { new: true } //to get new updated document back in the result
      );
      //return res.json(result);
    } catch (e) {
     // return res.status(500).json({ msg: e });
    }
  });*/
  /*
  class API {
    static getAllDoc = async(req, res) =>{
      try {
        const result = await signmodel.find()
        res.send(result)
      } catch (error) {
        console.log(error)
      }
    }
  }
  router.get('/user', API.getAllDoc)*/
  //export default API;
  
  module.exports = router;