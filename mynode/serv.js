                const express = require("express"); //importing express
                const req = require("express/lib/request");
                const fs = require('fs');
                const crypto = require('crypto'); // Used to hash passwords
                const port=8000;
                const multer  = require('multer');
                const mongoose =require('mongoose');
                const UserSign = require("./models/signmodel");
                const imgmodule = require("./models/imgmodule");
                const sensmodel = require("./models/sensmodel");
                const filemod=require("./models/filemodule");
                const notifmodel=require("./models/notif");
                const countmod=require("./models/count");
                const useridmodel=require("./models/userid");
                const idfile=require("./models/fileid");
                var bodyParser  = require('body-parser');

                require("dotenv").config();
                var buff;
                /////////////////////////////////////////////////////////////////////////
               var storage = multer.diskStorage({
                  destination: function (req, file, cb) {
                    cb(null, 'uploads')
                  },
                  filename: function (req, file, cb) {
                    cb(null,file.originalname)
                  }
                  /// new Date().toISOString()+
                });
                ////////////////////////////////////////////////////////////////////////////
                var app = express();
    server = require('http').createServer(app);
    
const excelToJson = require('convert-excel-to-json');

var path = require('path');

                mongoose.connect("mongodb+srv://Admin:admin@howyourroad.hhy7l.mongodb.net/howYourRoad?retryWrites=true&w=majority",{
                    useNewUrlParser: true,
                    useUnifiedTopology: true,
                });
                const db = mongoose.connection;
                db.once("open", function () {
                    console.log(" Mongo db connected");
                    });
    
                   
                     
                   
                app.use(express.json());
                
                              const usersignRoute = require("./routes/API");
              const { Console } = require("console");
const filemodule = require("./models/filemodule");
const { request } = require("http");
                              app.use("/signuser", usersignRoute);
                              app.use("/loguser", usersignRoute);
                             // app.use("/uploadfile", usersignRoute);
                             // app.use("/upload", usersignRoute);
                           //  app.use('/uploads', express.static(__dirname +'/uploads'));
                           // Upload excel file and import to mongodb
                           app.set('view engine','ejs'); 
                           app.use(bodyParser.urlencoded({extended:false})); 
                           app.use(express.static(path.resolve(__dirname,'public')));
                           var uploadmyfile = multer({ storage: storage })
                           app.get('/', (req, res) => {
                            res.sendFile(__dirname + '/index.html');
                            });
app.post('/uploadexcelfile', uploadmyfile.single("file"), (req, res) =>{
  importExcelData2MongoDB(__dirname + '/uploads/' + req.file.filename);
  console.log(res);
  });
  
             
  // Import Excel File to MongoDB database
function importExcelData2MongoDB(filePath){
  // -> Read Excel File to Json Data
  const excelData = excelToJson({
  sourceFile: filePath,
  sheets:[{

  name: 'Sheet1',

  header:{
  rows: 1
  },
  // Mapping columns to keys
  columnToKey: {
  A: 'x',
  B: 'y',
  C: 'z',
  D: 'index',
  E:'lat',
  F:'lng',
  G:'date',
  H:'time',
  I:'id'
  }
  }]
  });

  console.log(excelData);
  console.log("0000000000000000000000000000000000000000000000000000000000000000");
  // Insert Json-Object to MongoDB
  filemodule.insertMany(excelData.Sheet1  ,async(err,res)=>{  
    if(err){  
      console.log(err);  
      }  
      else{
      //  excelData.Sheet1 .json;
       // res.json(excelData.Sheet1 );
        console.log(res);
      }
      }); 
      fs.unlinkSync(filePath);
      }





      
app.post("/fileid", async (req, res) => {
  const fileid = new idfile({
    
    date:req.body.date,
    analyzed: req.body.analyzed,
      
      fileID: req.body.fileID,
      userID:req.body.userID,
  
    
    
      });
       
  try {
   
    const filllle = await newsens.save();
    res.send(newsens)
   res.json(filllle);
 
   
  } catch (error) {
    res.json({ mssssg: error });
  }
}
);
 
app.post("/getnotif",async (req, res) => {
  let id=req.body.id;
 
  try {
    let user = await notifmodel.find({dest:[id]});
   
    res.json({user});
   // res.
  } catch (e) {
    res.json({ msg: e });
  }
});

app.post("/getcount", async (req, res, next) => {
 // let idcount = req.body.idcount;

  //let flage = req.body.password;
  try {
  var user = await countmod.find({ idcount:"0" })
   // let image=user.image;
    res.json({
      
        user,
        
     } );
    
  } catch (error) {
    res.status(400).json({
      message: "An error occurred",
      error: error.message,
    })
  }
});
app.post("/getpoints", async (req, res, next) => {
   let userID = req.body.userID;
 
   //let flage = req.body.password;
   try {
   var user = await UserSign.findOneAndUpdate({ userID })
    // let image=user.image;
     res.json({
       
         user,
         
      } );
     
   } catch (error) {
     res.status(400).json({
       message: "An error occurred",
       error: error.message,
     })
   }
 });
 app.post("/updatepoints", async (req, res) => {
  let id = req.body.id;
  try {
    const user = await UserSign.findOneAndUpdate(
      { id}, //filter conditions
      { $set: 
        { points: req.body.points,
      
        
         },
         }, //update value of specific field
      { new: true } //to get new updated document back in the result
    );
    return res.json({user});
  } catch (e) {
    return res.status(500).json({ msg: e });
  }
});
/////////////////////////////////////////////////////////////
app.post("/getid", async (req, res, next) => {
   let id = req.body.id;
 
   //let flage = req.body.password;
   try {
   var user = await useridmodel.findOne( {id});
    // let image=user.image;
   
     res.json(
       user,
         );
     
   } catch (error) {
     res.status(400).json({
       message: "An error occurred",
       error: error.message,
     })
   }
 });

app.post("/updatecount", async (req, res) => {
  let idcount = req.body.idcount;
  try {
    const result = await countmod.findOneAndUpdate(
      { idcount}, //filter conditions
      { $set: 
        { count: req.body.count,
      
        
         },
         }, //update value of specific field
      { new: true } //to get new updated document back in the result
    );
    return res.json(result);
  } catch (e) {
    return res.status(500).json({ msg: e });
  }
});


let  dat;

                              var upload = multer({ storage: storage })
                              app.post('/upload', upload.single('image'), async(req, res, next) => {
                                const file = req.file
                                if (!file) {
                                  const error = new Error('Please upload a file')
                                  error.httpStatusCode = 400
                                  return next("hey error")
                                }
                            let  dat= fs.readFileSync(path.join(__dirname + '/uploads/' + req.file.filename)),
                                
                                buff= dat.toString();
                                     
                                  
                                  const imagepost= new imgmodule({
                                    img: {
                         
                                 data : fs.readFileSync(path.join(__dirname + '/uploads/' + req.file.filename)),
                                      //contentType: 'image/png'
                                  },
                                    image: file.path,
                                   complainantsName: req.body.complainantsName,
                                    type: req.body.type,
                                   place: req.body.place,
                                   descrption: req.body.descrption,
                                 
                                    date: req.body.date,
                                    lat:req.body.lat,
                                   lng:req.body.lng,
                                    isOpen:req.body.isOpen,
                                    solved:req.body.solved,
                                    solvingMechanism:req.body.solvingMechanism,
                                    userID:req.body.userID,
                                    resentMessages:req.body.resentMessages,
                                    adminID:req.body.adminID,
                                    adminIDsolve:req.body.adminIDsolve,
                                
                                  })
                                  const savedimage= await imagepost.save()
                                  res.json(savedimage)
                                
                              });


                             app.post("/updaterate", async (req, res) => {
                              let id = req.body.id;
                              try {
                                const result = await UserSign.findOneAndUpdate(
                                  { id}, //filter conditions
                                  { $set: 
                                    { rate: req.body.rate,
                                  
                                    
                                     },
                                     }, //update value of specific field
                                  { new: true } //to get new updated document back in the result
                                );
                                return res.json(result);
                              } catch (e) {
                                return res.status(500).json({ msg: e });
                              }
                            });

                             app.post("/updatename", async (req, res) => {
                              let id = req.body.id;
                              try {
                                const result = await UserSign.findOneAndUpdate(
                                  { id}, //filter conditions
                                  { $set: 
                                    { fullname: req.body.fullname,
                                  
                                    
                                     },
                                     }, //update value of specific field
                                  { new: true } //to get new updated document back in the result
                                );
                                return res.json(result);
                              } catch (e) {
                                return res.status(500).json({ msg: e });
                              }
                            });
                            
                            app.post("/updatelocation", async (req, res) => {
                              let id = req.body.id;
                              try {
                                const result = await UserSign.findOneAndUpdate(
                                  { id}, //filter conditions
                                  { $set: 
                                    { lat: req.body.lat,
                                      long:req.body.long
                                  
                                    
                                     },
                                     }, //update value of specific field
                                  { new: true } //to get new updated document back in the result
                                );
                                return res.json(result);
                              } catch (e) {
                                return res.status(500).json({ msg: e });
                              }
                            });

                            app.post("/updateage", async (req, res) => {
                              let id = req.body.id;
                              try {
                                const result = await UserSign.findOneAndUpdate(
                                  { id}, //filter conditions
                                  { $set: 
                                    { age: req.body.age,
                                      
                                  
                                    
                                     },
                                     }, //update value of specific field
                                  { new: true } //to get new updated document back in the result
                                );
                                return res.json(result);
                              } catch (e) {
                                return res.status(500).json({ msg: e });
                              }
                            });
                       
                            app.post("/profile", async (req, res, next) => {
                              let id = req.body.id;
                           
                              //let flage = req.body.password;
                              try {
                              var user = await UserSign.find({ id })
                               // let image=user.image;
                                res.json({
                                  
                                    user,
                                    
                                 } );
                                
                              } catch (error) {
                                res.status(400).json({
                                  message: "An error occurred",
                                  error: error.message,
                                })
                              }
                            });
                       
                            app.post("/image", async (req, res, next) => {
                              let userID = req.body.userID;
                              let massege="true";
                           
                              //let flage = req.body.password;
                              try {
                              let user = await imgmodule.find({ userID,massege })
                               // let image=user.image;
                                  res.json({
                                  
                                    user,
                                    
                                  })
                                
                              } catch (error) {
                                res.status(400).json({
                                  message: "An error occurred",
                                  error: error.message,
                                })
                              }
                            });

                            
                      /*      app.post("/notif", async (req, res, next) => {
                              let userID = req.body.userID;
                           
                              //let flage = req.body.password;
                              try {
                              let user = await imgmodule.find({ []dest:userID,open:"false" })
                               // let image=user.image;
                                  res.json({
                                  
                                    user,
                                    
                                  })
                                
                              } catch (error) {
                                res.status(400).json({
                                  message: "An error occurred",
                                  error: error.message,
                                })
                              }
                            });*/
                    ///////////////////////////// ///////////////////////////////////////////////////

                             app.post("/log", async (req, res, next) => {
                              let email = req.body.email;
                              let password = req.body.password;
                              try {
                                if(
                                 user = await UserSign.findOne({ email, password }))
                               // console.log(password);
                                  res.json({
                                    user,
                                    
                                  
                                  })

                                  else
                                  res.status(400).json({
                                    message: "An error occurred",
                                    error: error.message,
                                  })
                                
                              } catch (error) {
                                res.status(400).json({
                                  message: "An error occurred",
                                  error: error.message,
                                })
                              }
                            });

                                
app.listen( port,function(){
    console.log("server runnn on" +port);
});

        
                
//db.close();


