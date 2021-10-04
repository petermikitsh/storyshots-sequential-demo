# storyshots-sequential-demo

Companion repo: https://github.com/petermikitsh/storyshots-parallel-demo

Run storyshots in sequence, using official integration (as opposed to experimental parallelized strategy).

Requires `yarn`, and `nvm` is recommended.

```sh
nvm use # or use Node v14.15.4
yarn install
yarn test
```

### Results

1008 snapshots in 8.75 minutes, ~1.92 snapshots per second (2019 MBP).

```
Snapshot Summary
 › 1008 snapshots written from 1 test suite.

Test Suites: 1 passed, 1 total
Tests:       1008 passed, 1008 total
Snapshots:   1008 written, 1008 total
Time:        525.152 s
```

[Prior Art](https://github.com/jdelStrother/storybook/compare/b2eebbb5801bdb833916fdd6efedcee2a11cf253...5259806c4f4e6c172687b7532dcd891ccd58874d)

https://github.com/storybookjs/storybook/issues/7863#issuecomment-770231597
