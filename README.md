# Flood

1. Clone the git repo
2. Install the Heroku Toolbelt and run "heroku apps:create"
3. Go to https://foursquare.com/oauth and create a new app
4. Go to https://foursquare.com/lists and create a new list
5. Go to the list page and view source. Grab the list id off the end of the og:url property
6. Set Heroku config: "heroku config:set FOURSQUARE_CLIENT_ID=YOURCLIENTID FOURSQUARE_CLIENT_SECRET=YOURCLIENTSECRET FOURSQUARE_LIST_ID=YOURLISTID
7. Push to Heroku: "git push heroku"
8. Migrate the database: "heroku run rake db:migrate"
9. Create a Twilio account
10. Create a TwiML app and set the SMS Request URL to http://yourappname.herokuapp.com/twilio/receive.xml
11. Create a Twilio phone number and set the SMS Applciation to your TwiML app
12. Done!
