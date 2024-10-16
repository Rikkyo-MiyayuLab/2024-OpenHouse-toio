param(
    [int]$envs= 4,
    [string]$modelId="0",
    [bool]$force = $false,
    [bool]$exe = $false
)

$configurePath = "ai-robot-soccer/config/ai-robot-soccer-poca.yaml"
$exePath = "2024-OpenHouse-toio/build/2024-OpenHouse-toio.exe"

if($exe) {
    if($force) {
        mlagents-learn $configurePath --env=$exePath --num-envs=$envs --run-id=$modelId --force --width=1920 --height=1080 --torch-device="cuda"
    } else {
        mlagents-learn $configurePath --env=$exePath --run-id=$modelId --num-envs=$envs --width=1920 --height=1080 --torch-device="cuda"
    }
} else {
    if($force) {
        mlagents-learn $configurePath --run-id=$modelId --force --width=1920 --height=1080 --torch-device="cuda"
    } else {
        mlagents-learn $configurePath --run-id=$modelId --width=1920 --height=1080 --torch-device="cuda"
    }
}
