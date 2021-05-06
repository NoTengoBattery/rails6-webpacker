function findLoaderRuleIndex (testName, config) {
  return config.module.rules.findIndex(e => {
    const re = e.test
    switch (true) {
      case re instanceof RegExp:
        return re.test(testName)
      case re instanceof Array:
        return re.findIndex(e => { return e.test(testName) }) !== -1
      default:
        return false
    }
  })
};

function findLoaderIndex (testName, loader, config) {
  const ruleIndex = findLoaderRuleIndex(testName, config)
  const loaders = config.module.rules[ruleIndex].use
  return loaders.findIndex(e => {
    return e.loader.includes(loader)
  })
};

module.exports = { findLoaderRuleIndex, findLoaderIndex }
