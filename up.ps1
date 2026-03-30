# 1. 清理并重新生成
$ErrorActionPreference = "Stop"

Write-Host " 开始生成博客..." -ForegroundColor Cyan
hexo clean

Write-Host " 开始生成静态页面..." -ForegroundColor Cyan
hexo g

Write-Host " 准备提交到 GitHub..." -ForegroundColor Cyan
git add .
# 获取当前时间作为提交备注
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Site Update: $date"

Write-Host " 准备发送到部署 (Vercel 会自动部署)..." -ForegroundColor Cyan
git push

Write-Host " 恭喜，部署成功！" -ForegroundColor Green
