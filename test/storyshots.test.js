import initStoryshots from "@storybook/addon-storyshots";
import puppeteer from "puppeteer";
import { imageSnapshot } from "@storybook/addon-storyshots-puppeteer";

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
