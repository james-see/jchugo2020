---
title: "Weather Forecast with Axios & VueJS"
date: 2022-01-05T17:19:10-05:05
showDate: true
draft: false
tags: ["side-projects", "vuejs", "axios", "coding"]
images:
  - /posts/weatherus.jpeg
  - /posts/weathermvp.png
---

![weather](/posts/weatherus.jpeg)

I am learning that my computer-focused work is seasonal. As summer 2021 slid into fall 2021 I noticed my Github commits for my own projects go up and up. I am ok with this seasonal shift. I wonder that if I lived in a tropical location, would I pick a different vocation or just work from a hut on the beach all day?

Side projects and new ideas in general excite me. Moving as fast as possible from idea to a running application tickles the parts of me that seek creation, instant gratification, and control. 

Most side projects I leave unfinished or turn them into command line tools like the [ufw (uncomplicated firewall) visitor log parser][1]. That tool serves the purpose to track visitors that happen upon your web server without all the bloat of Google Analytics or other third parties snooping or selling your data. 

Other projects make it to full completion as landing pages or web tools. The web weather app I just completed is one of those. Still others end up as forget-me-nots for my future self in the form of gists on github. In fact, this application itself came about after I rediscovered a [vue.js forget-me-not gist][5] I had created 3 years(!) ago.

### Requirements Gathering

Here is what I had as the initial requirements in my head of what I wanted to do:

1. Find public free APIs for weather forecast data by zipcode
2. Get the data as json and display it on a web page
3. Allow users to input their zipcode
4. Not have to load a separate page for results
5. Not have to store or transile / compile javascript via node or anything to get it to run
6. Make it truly a Single Page Application (SPA)

I was able to hit all of those requirements and more, which ended up making it mobile-first display and other niceties like free hosting on github. Total code time was probably less than 8 hours, including deploying to github and spending time tweaking the css color palette and pixel pushing to ensure centered content and visibility on mobile. It is live at [getweatherbyzipcode][2]

![](/posts/weathermvp.png)

### Search for FREE APIs

These needed to be free without an account or auth code at all. Free endpoints to just access without limits. I ended up finding [this][7] article that showed one api for weather that needed latitude and longitude and another api that allowed you to get latitude and longitude based on zipcode. So I married the two together and turned it into chained callbacks in axios to first get the latitude & longitude, and then passing those into the url of the second `axios.get` to return the actual weather data to the user.

### Rendering on Mobile

A single line of meta tag in bare html fixes most problems displaying on mobile:

`<meta name="viewport" content="width=device-width, initial-scale=1">`

[Mozilla][4] explains this succintly if you want to read about this and other modifications.

### Why VueJS

The neat thing about VueJS is its ability to stay out of the way. I was able to use a single `index.html` loading VueJS from the unpkg CDN because I could just use the Vue code as needed sprinkled in as custom variables as a simple `<script>let app = new App()` setup that is created at page render time on the client while still maintaining very fast page load times. No transpiling needed. No Node bs. No package.json needed. This is pure magic to me in terms of lightning fast implementation speed vs. scaffolding and dev-ops background bog-downing of brain matter that takes away from shipping product. 

### Why Axios

Axios is my default for async grabbing of content from elsewhere to get it to the page. I am sure there are better implementations now with ES6 / Typescript that are built-in with promises and await and async out of the box. As I have learned over the 20+ years of doing code work, _better_ is subjective and dependant heavily on goal-setting & priorities. I move faster with what I already know or can remember from a few Stackoverflow checks.

### Improvements

Post MVP, I identify the following improvements I may make:

1. Moving the JS files (Axios & Vue) to be local and static vs. loading them from the unpkg CDN
2. Switching to native Typescript / ES6 to do the get requests instead of Axios ([here][6] is a good post explaining why and how)
3. Exposing more of the forecast data like wind speed and others
4. Adding a sparkline style line graph using D3 or similar to show the temperature change for the next 72 hours visually

### Extras

#### _Source code_

Source code is [public on my Github][8] where you can see it really is a single index.html file.

#### _Sharability_

I implemented twitter card for the application, which required a square image and some twitter related metadata. Twitter explains this well and even has a [card tester tool][9].

#### _Favicon_

I made custom favicons that even render properly on mobile bookmarking sites etc. using [realfavicongenerator.net][10].


[1]: https://github.com/jamesacampbell/ufwvisitorcounter "parses and returns file of the top visitors from ufw logs to your server"
[2]: https://www.jamescampbell.us/getweatherbyzipcode "get forecasted weather by zipcode"
[3]: https://gist.github.com/jamesacampbell "james campbell gists on github"
[4]: https://developer.mozilla.org/en-US/docs/Web/HTML/Viewport_meta_tag "mozilla mobile meta tags"
[5]: https://gist.github.com/jamesacampbell/6fd177f252cd09c28a3b023d34c3a0a0 "vue js forget me not gist"
[6]: https://medium.com/dont-leave-me-out-in-the-code/handling-javascript-promises-with-async-await-or-then-ceebc235933d "why use async/await vs. axios"
[7]: https://mixedanalytics.com/blog/list-actually-free-open-no-auth-needed-apis/ "free list of apis"
[8]: https://github.com/jamesacampbell/getweatherbyzipcode "source code"
[9]: https://cards-dev.twitter.com/validator "twitter card validator"
[10]: https://realfavicongenerator.net/ "favicon generator"