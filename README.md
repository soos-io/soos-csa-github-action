# [SOOS CSA](https://soos.io/products/container-product)

SOOS is an independent software security company, located in Winooski, VT USA, building security software for your team. [SOOS, Software security, simplified](https://soos.io).

Use SOOS to scan your software for [vulnerabilities](https://app.soos.io/research/vulnerabilities) and [open source license](https://app.soos.io/research/licenses) issues with [SOOS Core SCA](https://soos.io/products/sca). [Generate and ingest SBOMs](https://soos.io/products/sbom-manager). [Export reports](https://kb.soos.io/help/soos-reports-for-export) to industry standards. Govern your open source dependencies. Run the [SOOS DAST vulnerability scanner](https://soos.io/products/dast) against your web apps or APIs. [Scan your Docker containers](https://soos.io/products/containers) for vulnerabilities. Check your source code for issues with [SAST Analysis](https://soos.io/products/sast).

[Demo SOOS](https://app.soos.io/demo) or [Register for a Free Trial](https://app.soos.io/register).

If you maintain an Open Source project, sign up for the Free as in Beer [SOOS Community Edition](https://soos.io/products/community-edition).

## How to use it:

You can use the Action as follows:

- Update the `.github/workflows/main.yml` file to include a step like this
``` yaml
on: [push]

jobs:
  soos_csa_analysis_example:
    name: SOOS CSA Analysis Example
    runs-on: ubuntu-latest
    steps:
      - name: Run SOOS CSA Analysis
        uses: soos-io/soos-csa-github-action@v1
        with:
          client_id: ${{ secrets.SOOS_CLIENT_ID }}
          api_key: ${{ secrets.SOOS_API_KEY }}
          project_name: "My Project Name"
          target_image: "image:tag"

```

## Parameters

| Property               | Default                      | Description                                                                                                                  |
|------------------------|------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| api_key                | [none]                       | The Api Key provided to you when subscribing to SOOS services.                                                               |
| api_url                | "https://api.soos.io/api/"   | The API BASE URI provided to you when subscribing to SOOS services.                                                          |
| branch_name            | [none]                       | Branch Name to create scan under.                                                                                            |
| branch_uri             | [none]                       | URI to branch from SCM system.                                                                                               |
| build_uri              | [none]                       | URI to CI build info.                                                                                                        |
| build_version          | [none]                       | Version of application build artifacts.                                                                                      |
| client_id              | [none]                       | The Client Id provided to you when subscribing to SOOS services.                                                             |
| export_format          | [none]                       | Write the scan result to this file format. Options: CsafVex, CycloneDx, Sarif, Spdx, SoosIssues, SoosLicenses, SoosPackages, SoosVulnerabilities |
| export_file_type       | [none]                       | Write the scan result to this file type (when used with exportFormat). Options: Csv, Html, Json, Text, Xml                                       |
| log_level              | 'INFO'                       | Log level to show: DEBUG, INFO, WARN, FAIL, ERROR.                                                                           |
| on_failure             | 'continue_on_failure'        | Action to perform when the scan fails. Values available: fail_the_build, continue_on_failure.                                |
| operating_environment  | ${{ runner.os }}             | System info regarding operating system, etc.                                                                                 |
| other_options          | [none]                       | Other Options to pass to syft.                                                                                               |
| project_name           | ${{ github.repository }}     | The project name that will be displayed on the dashboard. By Default is owner/repository_name.                               |
| target_image           | [none]                       | The target to scan. Should be a docker image name or a path to a directory containing a Dockerfile.                          |

## References
 - [Syft](https://github.com/anchore/syft)
