import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
export const helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", { structuredData: true });
  response.send("Hello from Firebase!");
});

export const helloWorld2 = functions.https
  .onRequest(async (request, response) => {
    const querySnapshot = await admin.firestore()
      .collection("placesReservations").get();

    const results: any = [];
    querySnapshot.forEach((doc: any) => {
      // Get the document data and push it to the results array
      results.push(doc.data());
    });

    console.log(results);

    response.status(200).json(results);
  });

