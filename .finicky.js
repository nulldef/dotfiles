// @docs: https://github.com/johnste/finicky/wiki/Configuration

const chromeDistributionBrowser = {
  name: "Google Chrome",
  profile: "Profile 2" // distribusion.com profile
}

const chromePersonalBrowser = {
  name: "Google Chrome",
}

module.exports = {
  defaultBrowser: "Safari",
  handlers: [
    {
      match: ({ opener }) => /iterm/i.test(opener.name),
      browser: chromePersonalBrowser,
    },
    {
      match: ({ opener }) => /slack/i.test(opener.name),
      browser: chromeDistributionBrowser
    },
    {
      match: ({ urlString }) => /distribusion/i.test(urlString),
      browser: chromeDistributionBrowser
    },
    {
      match: ({ urlString }) => /vx\/booking/i.test(urlString),
      browser: chromeDistributionBrowser
    },
    {
      match: ({ urlString }) => /adyen/i.test(urlString),
      browser: chromeDistributionBrowser
    },
    {
      match: ({ urlString }) => /belladonna/i.test(urlString),
      browser: chromeDistributionBrowser
    },
  ]
}
