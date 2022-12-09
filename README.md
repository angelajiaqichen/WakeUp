# WakeUp


## FirebaseFirestore

The collections that we are using on firebase will be the containers for our documents. In our demo, we work with the Users struct, and we have a collection of users. For each user, we have 1) their id, which is a unique identifier from the user 2) device ID, which is unique for each device 3) date of the entry 4) a list of intentions written by the user 5) their list of selected features 6) stored quote of the day 7) stored suggestion of the day 8) stored affirmations for the day. Our get() function pulls data from firebse and the updateIntentionData() function uploads the user's input to firebase.

To obtain Google plist: https://console.firebase.google.com/u/1/project/wakeupdemo-5cedd/settings/general/ios:Labs.WakeUpFirebaseDemo

## Testing

For sprint 6, we did not reach 100% test coverage for the following reasons:

1. Our app is an app that focuses on user experience, and we created a lot of fancy view files and functions to enhance user experience. These views and functions are not testable.
2. We did not test firebase-related models (eg. User and UserRepository)
3. We did not fully test the Weather and WeatherParser models. Testing these two models would be challenging because our decoder had too many layers / was heavily nested - we were pulling from the accuweather api, accuweather's json file was not structured nicely and we had to decode 4 layers of the json file to get to the data that we needed. Writing test cases for Weather and WeatherParser would be not cost efficient. Also, previously in sprint 4, we wrote plenty of print statements to make sure that our parser works properly. We know for sure that our weather parser works as expected, and it would not make sense to write additional test cases to re-prove something that we've already proved.
4. We were unable to fully test the Events/Reminders models. We had 7 files of code to handle asynchronously fetching events/reminders from the user's Events/Remidners App, and a lot of this code was untestable. For example, it was impossible to test requestAccess() - we simply couldn't change the authorization status in our tests. 

