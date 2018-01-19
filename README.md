# Node + Karma + Chromium + Xvfb

## Run headless browser tests within an Alpine Linux Docker image

### Build the image
- Clone this repo 
```
$ git clone git@github.com:danielwhatmuff/alpine-node-karma-chromium-xvfb.git
```
- Run:
```bash
$ docker build -t danielwhatmuff/alpine-node-karma-chromium-xvfb .
```
### Or pull the image
```
$ docker pull danielwhatmuff/alpine-node-karma-chromium-xvfb
```

### Configure Karma conf and package.json
- Within your karma.conf.js add a custom launcher:
```
const config = {
  customLaunchers: {
    ChromiumNoSandbox: {
      base: 'ChromiumHeadless',
      flags: ['--no-sandbox', '--headless', '--disable-gpu', '--disable-translate', '--disable-extensions']
    }
  },
  ...
```
- Within package.json add a script to execute using Chromium headless
```
"scripts": {
  "test-in-chromium": "CI=true karma start --single-run --browsers ChromiumNoSandbox",
  ...
```

### Run your tests interactively
```
$ docker run -v $(pwd):/root/ -t danielwhatmuff/alpine-node-karma-chromium-xvfb /bin/sh
$ Xvfb :99 -ac -screen 0 1280x720x16 -nolisten tcp &
$ npm install
$ npm run test-in-chromium
```
