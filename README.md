# Zola Action

This action can be used to check if a Zola site builds successfully, or to check and build to be deployed by another actions.

## Usage

```yaml
name: Build Zola site
on:
 push:
  branches:
   - main

jobs:
  build:
    name: Build website
    runs-on: ubuntu-latest
    steps:
    - name: Checkout main
      uses: actions/checkout@v4
    - name: Build
      uses: SirMonteiro/zola-action@v0.20.0
      with:
        check: false
        drafts: false
        minify: true
        base_url: https://example.com
        output_dir: public/
```

## Environment Variables

You can set the following environment variables to customize the behavior of the Zola action:

  * `check`: If set to `true`, the action will run `zola check` instead of `zola build`.
  * `check_skip-external-links`: If set to `true`, the action will skip checking external links during `zola check`.
  * `drafts`: If set to `true`, the action will include draft content in both `zola check` and `zola build`.
  * `minify`: If set to `true`, the action will minify the generated HTML when building the site with `zola build`.
  * `base_url`: Overrides the base URL set in `config.toml` during the build.
  * `output_dir`: Sets a custom output directory instead of the default `public/`.
