# List the processes agents have launched on this machine, for the stray-job
# sweep (../references/local-compute.md). Read-only: it lists, never kills.
#
# A process is listed when its command line names one of the roots (by default
# this workspace and the agent harness's temp/scratchpad area), and so is every
# descendant of a listed process (multiprocessing workers carry no paths of
# their own). Shells and the harness itself are skipped.
#
#   pwsh -NoProfile -File .claude/skills/orchestration/scripts/list-jobs.ps1
#   pwsh -NoProfile -File .claude/skills/orchestration/scripts/list-jobs.ps1 -Roots 'D:\other\root'
#
# Windows only (CIM). On macOS/Linux use: ps -eo pid,ppid,ni,lstart,args
param(
  [string[]]$Roots = @(
    (Resolve-Path (Join-Path $PSScriptRoot '..\..\..\..')).Path,
    (Join-Path ([IO.Path]::GetTempPath()) 'claude')
  )
)
$all  = @(Get-CimInstance Win32_Process)
$skip = 'bash.exe','sh.exe','pwsh.exe','powershell.exe','cmd.exe','conhost.exe','claude.exe','git.exe'
$hit  = @{}
foreach ($p in $all) {
  if ($skip -contains $p.Name -or -not $p.CommandLine) { continue }
  foreach ($r in $Roots) { if ($p.CommandLine -like "*$r*") { $hit[$p.ProcessId] = $true } }
}
do {
  $n = $hit.Count
  foreach ($p in $all) {
    if ($hit[$p.ParentProcessId] -and $skip -notcontains $p.Name) { $hit[$p.ProcessId] = $true }
  }
} while ($hit.Count -ne $n)
if ($hit.Count -eq 0) { 'No agent-launched processes found.'; return }
$all | Where-Object { $hit[$_.ProcessId] } | Sort-Object CreationDate | ForEach-Object {
  $g = Get-Process -Id $_.ProcessId -ErrorAction SilentlyContinue
  [pscustomobject]@{
    Pid     = $_.ProcessId
    Parent  = $_.ParentProcessId
    Started = $_.CreationDate.ToString('yyyy-MM-dd HH:mm')
    Prio    = $g.PriorityClass
    CpuMin  = [int]($g.CPU / 60)
    Command = $_.CommandLine
  }
} | Format-Table -AutoSize -Wrap | Out-String -Width 240
