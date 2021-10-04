const { default: initStoryshots } = require("@storybook/addon-storyshots");
const puppeteer = require("puppeteer");
const { imageSnapshot } = require("@storybook/addon-storyshots-puppeteer");

initStoryshots({
  framework: "react",
  test: imageSnapshot({
    storybookUrl: `http://host.docker.internal:${process.env.STORYBOOK_PORT}/`,
    getCustomBrowser: () =>
      puppeteer.connect({
        browserURL: `http://localhost:${process.env.BROWSERLESS_PORT}`,
      }),
  }),
});
