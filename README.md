jenkins-test-repo

A deliberately tiny repository for testing a Jenkins + GitHub webhook setup.

Its only job is to give Jenkins something to build so you can confirm that
pushing to GitHub automatically triggers a build. There is no real application
here — just enough to make a pipeline run and go green.

What's inside

FileWhat it doesJenkinsfileThe pipeline. Runs three stages: Build, Test, Deploy.app.shThe "app" — prints a single line of text.test.shChecks the app prints the expected line. Passes or fails the build.

Why shell scripts (and not Maven / Node / Python)?

The official jenkins/jenkins:lts-jdk21 container ships with Java and git, but
not build tools like Maven, Node, or Python. Using plain shell commands means
this pipeline runs with zero extra setup, so your first build succeeds and you
know the webhook wiring is what you're actually testing.

How to test your Jenkins with it

Push this repo to GitHub (see commands below).
In Jenkins, create a Pipeline job pointed at this repo (Pipeline script from
SCM → Git → your repo URL). Make sure "GitHub hook trigger for GITScm
polling" is ticked under Build Triggers.
Add the webhook in GitHub (Settings → Webhooks), payload URL =
https://YOUR-NGROK-URL/github-webhook/.
Make any change, commit, and push:

bash echo "trigger a build" >> README.md
git commit -am "test webhook"
git push

Within a second or two, Jenkins should start a build on its own. Watch it go
Build → Test → Deploy, all green.

Making it fail on purpose (optional)

Want to see a red build? Break the test by changing the expected text in
test.sh (or the printed text in app.sh) so they no longer match, then push.
The Test stage will fail and the build turns red — exactly what you'd want to
catch a real bug before merging.
