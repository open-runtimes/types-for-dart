# Publishing

This package is published to [pub.dev](https://pub.dev/packages/open_runtimes).

## Setup

1. Create a pub.dev account at https://pub.dev
2. Generate a credential token:
   ```bash
   dart pub token add https://pub.dev
   ```
3. Base64-encode the token and add it as a GitHub Actions secret:
   - Secret name: `PUB_TOKEN`
   - Secret value: the token from `~/.config/dart/pub-credentials.json`

## Publishing

Publishing is automated via GitHub Actions. To publish a new version:

1. Create a new GitHub release with a tag matching the desired version (e.g., `0.1.0`)
2. The workflow will automatically update `pubspec.yaml` and publish to pub.dev

## Manual Publishing

```bash
dart pub publish
```
