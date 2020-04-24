# Get the Rodin Licence
repos = RodinLicence EventBUtils EMF_EventB EMF_Translator EMF_EventB_Extensions EventB_Translator_Support Records iUML_B_Diagrams EMF_Inclusion EMF_Containment iUML_B_StateMachineDiagrams XEventB EventB_ProB_Support CODA_Oracle iUML_B_StateMachineAnimation1
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

deploy:
	rm -r ../blog-files/source/media_bin/ac.soton.eventb.prototypes.updateSite
	cp -r ac.soton.eventb.prototypes.updateSite/target/repository ../blog-files/source/media_bin/ac.soton.eventb.prototypes.updateSite
	cd ../blog-files;make deploy
