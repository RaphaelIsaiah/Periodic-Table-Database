mkdir periodic_table
cd periodic_table
git init
git checkout -b main
touch element.sh
git add .
# Be careful to ensure that the first commit is Initial commit
git commit -m "Initial commit"
chmod +x element.sh

# After adding the echo to element.sh
git add .
git commit -m "feat: Add prompt"

# Add a some text into the element.sh
# repeat git add . and git commit
# total commits should be at least 5
