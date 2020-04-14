# Get the Rodin Licence
repos = RodinLicence EventBUtils EMF_EventB EMF_Translator EMF_EventB_Extensions EventB_Translator_Support
location = ../
targets = $(addprefix $(location), $(repos))

$(targets): ../% :
	@echo $* " does not exist, git clone required"
	git clone "https://github.com/eventB-Soton/$*.git" $@

build: | $(targets)
# Use Maven to build
	mvn clean verify

clean: | $(targets)
# Use Maven to clean
	mvn clean


