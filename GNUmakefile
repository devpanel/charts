#https://tech.paulcz.net/blog/creating-a-helm-chart-monorepo-part-1/
index:
	docker run -v="$(shell pwd):/app" -w="/app" --env-file .env quay.io/helmpack/chart-releaser:v1.1.1 sh -c \
	"cr index -p .deploy -c https://github.com/devpanel/charts -o devpanel --git-repo charts -i ./index.yaml"
package-basic-hpa:
	helm package charts/basic-hpa --destination .deploy
package-basic-cronjob:
	helm package charts/basic-cronjob --destination .deploy
package-basic-lemp:
	helm package charts/basic-lemp --destination .deploy
package-lemp:
	helm package charts/lemp --destination .deploy
upload:
	docker run -v="$(shell pwd):/app" -w="/app" --env-file .env quay.io/helmpack/chart-releaser:v1.1.1 sh -c \
	"cr upload -o devpanel -r charts -p .deploy --token \$$CH_TOKEN"
build-basic-hpa: package-basic-hpa upload index