# AL-Go Per Tenant Extension Template

This template repository can be used for managing Per-tenant Extensions (PTEs) for Business Central.

Please go to https://aka.ms/AL-Go to learn more.

## Releases (EDK Create Release)

This repository releases through the EDK Create Release workflow (`.github/workflows/EDKCreateRelease.yaml`). After a successful CI/CD run on `main`, it creates a release of `App/app.json`'s version automatically. On every pull request to `main`, it checks that AL-Go's `repoVersion` matches that version (`release / repoVersion`). The workflow is maintained in [ECIT-EDK-BC/EDK-Actions](https://github.com/ECIT-EDK-BC/EDK-Actions#readme), and its README has the full description.

### Getting started

1. **Add the app** in `App/`.
2. **Set `repoVersion`.** In `.AL-Go/settings.json`, set `"repoVersion"` to `App/app.json`'s Major.Minor.Build, for example `"repoVersion": "1.0.0"` for `1.0.0.0`. Until then, `release / repoVersion` fails on pull requests with a message that says what to set. It does not block merging.
3. **Wait for a green check.** `release / repoVersion` must have passed on a pull request to `main`.
4. **Turn on the required check.** Only after step 3, set the repository's custom property `edk-release` to `true`. The organization ruleset `RepoVersionCheck` then makes `release / repoVersion` a required check. If `edk-release` is set before the check has run, every pull request is blocked.

When you bump the app version, bump `repoVersion` in the same pull request.

### Not releasing with EDK Create Release

Leave `edk-release` at `false`, which is the default. Then disable the workflow (Actions → EDK Create Release → Disable workflow, or `gh workflow disable "EDK Create Release"`), or delete the file.

### Keeping it current

`EDKCreateRelease.yaml` and `.github/actionlint.yaml` are verbatim copies of the templates in EDK-Actions. Do not edit them here. "Update AL-Go System Files" does not update them. When the AL-Go system files move to another version, copy the template from the EDK-Actions release line built for that version (for example `v1.3-algo10.0` for AL-Go v10.0) in the same pull request.

## Contributing

Please read [this](https://github.com/microsoft/AL-Go/blob/main/Scenarios/Contribute.md) description on how to contribute to AL-Go for GitHub.

We do not accept Pull Requests on the template repository directly.
