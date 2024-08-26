Josh Eres
jeeres

1. I chose to implement the dark mode and maximum guess attempts settings in my Guess3LettersWithSettings app. To do this, I used a toggle switch for the dark mode setting and a multiple value menu for the maximum attempts setting. I then registered these settings with the notification center in the app delegate. After this, I inplemented all of the correct functionality for each of the settings.

2. To make this cooler, I added an observer using the notification center that can do things when the app is in the background and foreground, which I used to check for any updated settings (and update them if they have changed) whenever the app goes from background to foreground.
