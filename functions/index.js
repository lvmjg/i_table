/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onCall} = require("firebase-functions/v2/https");
const {logger, setGlobalOptions} = require("firebase-functions/v2");
const {getFirestore, Timestamp} = require("firebase-admin/firestore")
const {onSchedule} = require("firebase-functions/v2/scheduler");

const admin = require('firebase-admin');

const nodemailer = require('nodemailer');

admin.initializeApp();

setGlobalOptions({ region: "europe-west3" });



// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

 exports.sendEmails = onSchedule('*/2 * * * *',async (event) => {
   logger.info("Function sendEmails started", {structuredData: true});

    //initialize transporter
     const transporter = nodemailer.createTransport({
         host: 'smtp.gmail.com',
         port: 587,
         auth: {
           user: 'tusiedze@gmail.com',
           pass: 'apcgpbdvnomknpwi',
         },
       });
      await transporter.verify();


   let snapshot = null;
   try{
    const today = new Date();
    const tomorrow = (new Date(today)).setDate(today.getDate()+1);
    const midnightTomorrowMorning = (new Date(tomorrow)).setHours(0,0,0,0);

    const midnightTimestamp = Timestamp.fromDate(new Date());
    console.log(midnightTimestamp);


    snapshot = await getFirestore()
    .collection('placesReservations')
    .where('startDate', '>', midnightTimestamp)
    .get();

     for(const doc of snapshot.docs){
     console.log(doc.data());
     }
   } catch(e){
    console.log(e);
   }

    if(snapshot.docs==null){
        console.log('dupa');
    }else{
     console.log('wszystko ok dupa');
    }


   if(snapshot!=null){

                for(const doc of snapshot.docs){

                     try{

                    console.log('wysyłan');
                     console.log(doc.data());

                               await transporter.sendMail({
                                 from: '"TuSiedzę" <tusiedze@gmail.com>', // sender address
                                 to: doc.data().email, // list of receivers
                                 subject: 'Rezerwacja ⏰', // Subject line
                                 html: `<b>Witaj Michałku!</b><br>Przypominamy o Twojej rezerwacji w miejscu ${doc.id}!</b>`, // html body
                               });


                               } catch(e){
                                console.error(e);
                                   return { "testError": "Dupa"};
                               }
                }



   }



   return {'test' : 'data'};
 });
