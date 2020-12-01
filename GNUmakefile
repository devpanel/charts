#https://tech.paulcz.net/blog/creating-a-helm-chart-monorepo-part-1/
CH_TOKEN=5ed4cd356f1c2ddb21c179dd61d15ad02a92d410
index:
	cr index -p .deploy -c https://github.com/devpanel/charts -o devpanel --git-repo charts -i ./index.yaml
package:
	helm package charts/basic-hpa --destination .deploy
upload:
	 cr upload -o devpanel -r charts -p .deploy --token ${CH_TOKEN}