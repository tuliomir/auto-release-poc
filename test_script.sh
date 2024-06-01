GITHUB_TOKEN="bolinha"
pr_data=$(jq -n --arg title "Merge release into master" \
                           --arg head "release" \
                           --arg base "main" \
                           --arg body "Automated PR to merge release branch into main based on release event." \
                           '{title: $title, head: $head, base: $base, body: $body}')
response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
                 -H "Content-Type: application/json" \
                 -d "$pr_data" \
                 https://api.github.com/repos/tuliomir/auto-release-poc/pulls)
echo "$response" | jq .
