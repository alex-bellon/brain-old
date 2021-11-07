# IoT

- [Home Assistant](https://www.home-assistant.io/) - FOSS home automation suite
  - [Reddit comment with good examples]
- [Rhasspy](https://rhasspy.readthedocs.io/en/latest/) - FOSS voice assistant (works with Home Assistant!)
- [Fauxmo](https://github.com/n8henrie/fauxmo) - Emulated Belkin WeMo devices that work with the Amazon Echo
  - [Another repo](https://github.com/makermusings/fauxmo)

```
At the time I write this there are three comments asking what HA will do for you.

The short answer is that it will bridge all your technologies together and allow a ridiculous level of automation between them. \"All\" your technologies? Well at the time of this writing [only 1524 of them I guess...](https://www.home-assistant.io/integrations)

A few things I have in my home all plugged into HA, not an exhaustive list:

* Hue lights
* Google Home devices
* Chromecasts
* Iris door sensors
* A homemade garage door sensor/opener
* My wireless router
* Chinese wifi outlets
* GE smart light switches
* Dark Sky weather API
* National Weather Service API
* Pushbullet
* Smart doorbell
* Nest thermostats

**All of this crap is from different companies but they all report their statuses to HA and then HA lets me write automations**:

* Front door opened and it's either after sunset or the sky is 90% or more covered with clouds? Turn on the foyer light for 2 minutes so my guests can take off their coats and shoes. That's an Iris sensor from Home Depot causing a change to a GE wall switch (only if certain weather related data is true such as cloud coverage and sun elevation!) Those devices aren't meant to talk to each other, and certainly not based on weather conditions, but since HA knows what's going on with the Iris door sensor and it can talk to the GE light switch *and* it knows the sun's elevation for my lat/long *and* it knows the cloud coverage in the sky, all that shit's part of the same ecosystem now and we can make decisions based on all of it. That's the power of Home Assistant. It's a huge bucket you dump all of your sensors into (door open or closed? light on or off? cloudy or not? daytime or nighttime?) and you wrap rules around them that look for changes in states as the basis to trigger actions. This is *powerful*.
* Garage door been open for 60 min? Send a notification to my phone and have all Google homes say \"the garage door has been open for 60 minutes.\" Continue to check and report every 60 minutes it's been open thereafter. Edit: a robot voice out of the blue kept startling us. Changed to a certain chime sound.
* Can't hear doorbell in the basement? Spam doorbell.mp3 to all Google Homes when someone rings. Might as well send a notification to my phone while I'm at it.
* Send me weather forecast as phone notification daily at 7a.
* Send me notifications on NWS storm warnings. I don't even have a weather app on my phone anymore which is saying a lot as a NWS trained weather spotter (enthusiast).
* Remotely check HA user interface and see if my wife is home.
* Someone set the thermostat outside of 65-70? Wait 10 seconds for them to walk away and set it right back to 68. Dad level 100.
* Flick a switch called Vacation Mode on my HA user interface and now all my lights turn on/off according to a schedule I set once three years ago. If I set up presence detection, I won't even have to switch it back off when I return because HA sees \"Rufus's phone is on WiFi so they've returned from vacation. I'll turn vacation mode off for them\". Some people plug Google calendar in and let HA mine their calendar to find flight info and they turn on vacation mode automatically.
* Automate all lights in my home from one utility (since some are Hue, some are GE switches, some are Chinese outlets). I don't even have these apps on my phone. I want light X to turn on at 7pm. I don't want to think about if it's Hue or Chinese or GE or what. Just turn on light.bedroom and be done with it. Beautiful abstraction.
* Is it after 9pm and the bed room light is on 100% brightness and the bedroom Chromecast switches from 'idle' to 'playing'? Dim that bedroom light to 20%.
* Automate lighting for my wife if she comes home after 10pm. The effect is that outdoor lights only turn off at 10pm if she's home. If she's out, they'll stay on until she arrives and then some indoor lights turn on for ten min so she doesn't come home to a dark house. She'll walk to bed never even touching a light switch, they'll shut off behind her.
* Anytime the garage door opens, a chime plays on google homes because we can't hear the garage door and it's jarring to have someone just walk in.

I could go on. Edit: I did go on. More examples.

Here's some screenshots of my UI: https://imgur.com/a/MDISrnT That floorplan has actual buttons I can interact with to control lights, thermostats, media players, doors, fans. Our cars grey out when one of us is gone--[here's the green car gone](https://i.imgur.com/PdTihOQ.png). Doors turn red when open, [example](https://i.imgur.com/RD6qz5u.png). Though I find if I'm spending time in my UI it means my automations should be better. As I get better at writing rules so the house works for me I'm spending less and less time in the UI controlling things.
```
