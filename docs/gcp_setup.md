# `Google Cloud Platform` setup instructions

## Requirements

- Create account in `Google Cloud Platform`

## Creating project

1. Go to main menu and click on button with current project:

![img.png](img/gcp_setup/screenshot_1.png)

2. Click on `NEW PROJECT`:

![img.png](img/gcp_setup/screenshot_2.png)

3. Enter only project name and click on `CREATE`:

![img.png](img/gcp_setup/screenshot_3.png)

4. After that you can see notification that your project successfully created. Click on `SELECT PROJECT`:

![img.png](img/gcp_setup/screenshot_4.png)

## Creating service account

1. Go to `IAM & Admin > Service Accounts` and click on `CREATE SERVICE ACCOUNT`:

![img.png](img/gcp_setup/screenshot_5.png)

2. Fill in all the required fields in the first step:

![img.png](img/gcp_setup/screenshot_6.png)

3. In the second step add all roles as in the screenshot below and click on `DONE`:

![img.png](img/gcp_setup/screenshot_7.png)

4. After that you can see yours service account. Click on `Email` value for your account:

![img.png](img/gcp_setup/screenshot_8.png)

5. Got to `KEYS` section and click on `ADD KEY`

![img.png](img/gcp_setup/screenshot_9.png)

6. Select `JSON` format for your key and download file to `credentials` directory:

![img.png](img/gcp_setup/screenshot_10.png)
