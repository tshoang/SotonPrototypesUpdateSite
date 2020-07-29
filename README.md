# SotonLatestUpdateSite
Update Site for latest builds of features maintained by our team

A Makefile is used to build the update site and deploy the update
site.

Each of the repository included in this update site need to be **Maven enabled**

The main steps are as follows.

1. Include the features that you want to have by adding them to
   category.xml. All features should be included under **(Latest)**
   Category.

2. Edit the Makefile to add the repository to **repos** variable. All
   the repositories will be fetched from the GitHub organisation
   **eventB-soton**.

3. Run *make build* to build the update site using Maven.

4. Run *make deploy* to deploy the update site onto the
   **eventB-soton**'s GitHub page. The repository for the GitHub page,
   i.e. *eventb-soton.github.io* assumed to be at the same level as
   this *SotonLatestUpdateSite* repository.
