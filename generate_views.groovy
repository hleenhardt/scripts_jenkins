def project = 'hleenhardt/jenkins_test'
def branchApi = new URL("https://api.github.com/repos/${project}/branches")
def branches = new groovy.json.JsonSlurper().parse(branchApi.newReader())
branches.each {
    def branchName = it.name
  	listView("${branchName}") {
            description("All jobs for ${branchName}")
            recurse(true)
    		jobFilters {
        		regex {
            		matchType(MatchType.INCLUDE_MATCHED)
            		matchValue(RegexMatchValue.NAME)
                  	regex("${branchName}")
                }
            }
            columns {
                status()
                weather()
                name()
                lastSuccess()
                lastFailure()
                lastDuration()
                buildButton()
            }
      }
}