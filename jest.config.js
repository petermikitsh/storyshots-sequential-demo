/** @type {import('@jest/types').Config.InitialOptions} */
const config = {
  moduleNameMapper: {},
  transform: {
    "\\.(css)$": "<rootDir>/test/styleMock.js",
    "\\.(js|ts|tsx)$": ["babel-jest", { configFile: "./test/babel.config.js" }],
  },
  testMatch: ["**/?(*.)+(spec|test|stories).[jt]s?(x)"],
  testPathIgnorePatterns: ["/node_modules/"],
  testTimeout: 5 * 60 * 1000,
};

module.exports = config;
