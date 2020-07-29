# GitHub organisation where all repository can be found
GitHub = https://github.com/eventB-Soton

# The list of repositories from the organisation
repos = RodinLicence EventBUtils EMF_EventB EMF_Translator EMF_EventB_Extensions EventB_Translator_Support Records iUML_B_Diagrams EMF_Inclusion EMF_Containment iUML_B_StateMachineDiagrams XEventB EventB_ProB_Support CODA_Oracle iUML_B_StateMachineAnimation1 ScenarioChecker

# The (local) location for the repositories
location = ../

# Getting the local location for each repositories
targets = $(addprefix $(location), $(repos))

# Local composite update site
ghPage = ../eventB-Soton.github.io
updateSite = updateSite/latest

# Check if the local repositories exist
# Otherwise, clone a snapshot from GitHub (no need to have the full history).
$(targets): ../% :
	@echo $* " does not exist, git clone required"
	git clone "$(GitHub)/$*.git" $@ --depth 1

build: | $(targets)
# Use Maven to build
	mvn clean verify

clean: | $(targets)
# Use Maven to clean
	mvn clean

# Deploy 
deploy:
	rm -r $(ghPage)/$(updateSite)
	cp -r ac.soton.eventb.latest.updateSite/target/repository $(ghPage)/$(updateSite)
	cd $(ghPage);git checkout master;git pull;git add $(updateSite);git commit -m "Update Latest Update Site";git push
