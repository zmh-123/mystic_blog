# 1. 停止如果出现错误
$ErrorActionPreference = "Stop"

Write-Host " 开始清理旧缓存..." -ForegroundColor Cyan
hexo clean

Write-Host " 开始生成静态网页..." -ForegroundColor Cyan
hexo g

Write-Host " 正在提交到 GitHub..." -ForegroundColor Cyan
git add .
# 获取当前时间作为提交备注
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Site Update: $date"

Write-Host " 正在推送到云端 (Vercel 会自动捕获)..." -ForegroundColor Cyan
git push

Write-Host " 恭喜！发布成功！" -ForegroundColor Green