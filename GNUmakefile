#https://tech.paulcz.net/blog/creating-a-helm-chart-monorepo-part-1/
index:
	docker run -v="$(shell pwd):/app" -w="/app" --env-file .env quay.io/helmpack/chart-releaser:v1.1.1 sh -c \
	"cr index -p .deploy -c https://github.com/devpanel/charts -o devpanel --git-repo charts -i ./index.yaml"
package:
	helm package charts/basic-hpa --destination .deploy
upload:
	docker run -v="$(shell pwd):/app" -w="/app" --env-file .env quay.io/helmpack/chart-releaser:v1.1.1 sh -c \
	"cr upload -o devpanel -r charts -p .deploy --token \$$CH_TOKEN"
build: package upload index