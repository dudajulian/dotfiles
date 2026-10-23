DEVSETUP="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# link <path inside repo> <destination>
link() {
  mkdir -p "$(dirname "$2")"
  ln -sfn "$DEVSETUP/$1" "$2"
  echo "linked $2"
}
