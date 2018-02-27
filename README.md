# Project 4 - *Instagram*

**Instagram** is a photo sharing app using Parse as its backend.

Time spent: **10** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can sign up to create a new account using Parse authentication (+1pt)
- [x] User can log in and log out of his or her account (+1pt)
- [x] The current signed in user is persisted across app restarts (+1pt)
- [x] User can take a photo, add a caption, and post it to "Instagram" (+2pt)
- [x] User can view the last 20 posts submitted to "Instagram" (+2pt)
- [x] User can pull to refresh the last 20 posts submitted to "Instagram" (+1pt)
- [x] User can tap a post to view post details, including timestamp and caption (+2pt)

The following **stretch** features are implemented:

- [x] Style the login page to look like the real Instagram login page (+1pt)
- [ ] Style the feed to look like the real Instagram feed (+1pt)
- [ ] User can use a tab bar to switch between all "Instagram" posts and posts published only by the user. AKA, tabs for Home Feed and Profile (+2pt)
- [ ] Add a custom camera using the CameraManager library (+1pt)
- [ ] User can load more posts once he or she reaches the bottom of the feed using infinite scrolling (+2pt)
- [ ] Show the username and creation time for each post using section headers (+1pt)
   - If you use TableView Section Headers to display the the username and creation time, you'll get "sticky headers" similar to the actual Instagram app.
- [ ] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse (+1pt)
- User Profiles:
   - [ ] Allow the logged in user to add a profile photo (+2pt)
   - [ ] Display the profile photo with each post (+1pt)
   - [ ] Tapping on a post's username or profile photo goes to that user's profile page (+2pt)
- [ ] User can comment on a post and see all comments for each post in the post details screen (+3pt)
- [ ] User can like a post and see number of likes for each post in the post details screen (+1pt)
- [x] Run your app on your phone and use the camera to take the photo (+1pt)


The following **additional** features are implemented:

- [x] Autolayout constraints on all views.
- [x] Launch screen.

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to use a different backend platform that allows to store images of higher quality.
2. How to allow for posts containing videos and not only images.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/albinencio/Instagram/blob/master/InstagramDemo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Credits

- [Parse](http://parseplatform.org/) - backend platform of the application.
- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [Pastel](https://github.com/cruisediary/Pastel) - gradient in background of login view


## Notes

This project was a lot of fun! I definitely plan on working on it more to make it even more realistic and similar to the original Instagram app. I really liked working on styling the login page; if I had had more time, I would have styled the rest of the views too.
The biggest challenge was definitely to keep track of the general flow of the application, as there were many user interactions to consider.

## License

    Copyright © 2018 Alberto Nencioni. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
