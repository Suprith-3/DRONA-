# This script rewrites your entire Git history to today's date (April 5, 2026).
# It's the most reliable way to update all commits at once.

Write-Host "Updating Git History to April 5, 2026..." -ForegroundColor Cyan

# Squelch the deprecation warning
$env:FILTER_BRANCH_SQUELCH_WARNING = "1"

# Target Date (Current Local Time)
$newDate = "2026-04-05 07:38:27 +0530"

# Main Rewrite Command
git filter-branch -f --env-filter "
    export GIT_AUTHOR_DATE='$newDate'
    export GIT_COMMITTER_DATE='$newDate'
" --tag-name-filter cat -- --all

Write-Host "`nSUCCESS: Local history rewritten to today's date!" -ForegroundColor Green
Write-Host "--------------------------------------------------------"
Write-Host "To push to your new GitHub repository, run these commands:" -ForegroundColor Yellow
Write-Host "git remote add sync https://github.com/Artsy-Technologies/Virtual-innovators.git" -ForegroundColor White
Write-Host "git push sync --force --all" -ForegroundColor White
Write-Host "git push sync --force --tags" -ForegroundColor White
Write-Host "--------------------------------------------------------"
