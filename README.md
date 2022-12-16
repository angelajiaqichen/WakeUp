# WakeUp


## FirebaseFirestore

The collections that we are using on firebase will be the containers for our documents. In our demo, we work with the Users struct, and we have a collection of users. For each user, we have 1) their id, which is a unique identifier from the user 2) device ID, which is unique for each device 3) date of the entry 4) a list of intentions written by the user 5) their list of selected features 6) stored quote of the day 7) stored suggestion of the day 8) stored affirmations for the day. Our get() function pulls data from firebse and the updateIntentionData() function uploads the user's input to firebase.

To obtain Google plist: https://console.firebase.google.com/u/1/project/wakeupdemo-5cedd/settings/general/ios:Labs.WakeUpFirebaseDemo

## Testing

For sprint 6, we did not reach 100% test coverage for the following reasons:

1. Our app is an app that focuses on user experience, and we created a lot of fancy view files and functions to enhance user experience. These views and functions are not testable.
2. We did not test firebase-related models (eg. User and UserRepository).
3. We did not fully test the Weather and WeatherParser models. Testing these two models would be challenging because our decoder had too many layers / was heavily nested - we were pulling from the accuweather api, accuweather's json file was not structured nicely and we had to decode 4 layers of the json file to get to the data that we needed. Writing test cases for Weather and WeatherParser would be not cost efficient. Also, previously in sprint 4, we wrote plenty of print statements to make sure that our parser works properly. We know for sure that our weather parser works as expected, and it would not make sense to write additional test cases to re-prove something that we've already proved.
4. We were unable to fully test the Events/Reminders models. We had 7 files of code to handle asynchronously fetching events/reminders from the user's Events/Reminders App, and a lot of this code was untestable. For example, it was impossible to test requestAccess() - we simply couldn't create a user and change their authorization status in our tests. Also, our models only had functions to get() events and reminders from the user's Apple Calendar and Reminders. We did not have a create() function to populate the user's Apple Canlendar/Reminders, and if we wanted to test the get() functions, we would have to program a create() function. Our app does not need a create() function for its functionality and therefore it would not make sense to program a more complicated, cost-inefficient create() function just for the sake of testing get(). The views and print statements proved that our get() works properly, thus we did not write additional tests for our many get() functions.

## Feature List

### A-Level
- Tasks, Events screens: User could see a brief list of their daily tasks and events
- Intentions + Setting up the daily intentions: Users can set up 1-3 daily intentions and view a summary of them at the end of the flow
- User onboarding (selecting features): New users can choose to enable the following features: weather, quote, productivity, deep breathing, and affirmations
- User onboarding (description of features): Users should be able to see what a feature does before they decide if they want to select the feature or not


### B-Level
- Editing the routine: After setting up their routine, returning users can click edit routine button on the user profile page to change the setting. They can select additional features or deselect features.
- Deep breathing animation: Expansion and compression of animation to match a user’s breathing patterns





