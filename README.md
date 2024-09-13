# Corelight

## Overview

Welcome to the Corelight Dashboards for Chronicle. These dashboards are designed to provide you with valuable insights and visualizations for your Corelight data. Whether you're a security analyst, network administrator, or IT professional, these dashboards can help you monitor and analyze network traffic effectively.

## Block Structure

For more information on the Block structure and customization, refer to [Looker Marketplace Documentation](https://docs.looker.com/data-modeling/marketplace/customize-blocks#marketplace_blocks_that_use_refinements)

## Technical installation

### Pre-requisites

- This block works with Chronicle datasets in Google BigQuery.
- The BigQuery Export feature needs to be enabled for your Chronicle tenant. (Reach out to your Chronicle representative to set this up.)
- The connection with Chronicle dataset needs to be created in Looker, refer to [Connecting with DB](https://cloud.google.com/looker/docs/connecting-to-your-db) 

### Installation steps (GitHub)

#### Create a connection to Google Chronicle in Looker

1. To create a connection to the chronicle, First, open the Looker instance and navigate to the Home page.

    ![image](https://github.com/user-attachments/assets/8ca29d72-74d0-4204-b2eb-ccf922af335f)

2. Now select the main menu. Then click on Admin and go to the connection page.

    ![image](https://github.com/user-attachments/assets/1981fdde-2a2d-4229-9cd4-3b66f2c19ddd)

3. Now click on the Add connection to create a new connection.
4. Enter the name of the connection as you prefer (Ex: corelight-chronicle) and select Google BigQuery Standard SQL in the Dialect. Now several new fields will appear. 
5. Enter the Billing Project ID field (Ex here: chronicle-crds) , where Chronicle data is present.
6. Enter the relevant dataset name (Ex: datalake).

    ![image](https://github.com/user-attachments/assets/ced48304-f445-4ff3-bab7-a0909c1fb50e)

7. To configure authentication, select the service account method and upload your service account file.
8. In Optional settings, Set both the timestamps (Database timestamp and query timestamp) as UTC (the time fields shown in dashboards will be affected accordingly).
9. Click on the Connect button (![image](https://github.com/user-attachments/assets/b2a1a619-8679-4139-a726-cbd4120bb781)) to complete the connection setup. Looker is now connected to the Google Chronicle database!

#### Get the Block from the GitHub Repository

1. Go to this [corelight/block-corelight-chronicle](https://github.com/corelight/block-corelight-chronicle.git) github repository and fork the **main** repository.
2. Go to Looker Instance and Turn on **“Development Mode”**.

    ![image](https://github.com/user-attachments/assets/7286094e-16b0-4a44-a6ce-c003b9d3a4f5)

3. Select Projects from the Develop menu.

    ![image](https://github.com/user-attachments/assets/a165483b-9d38-42d1-8ad7-0747e34fd969)

4. From the LookML Projects page, select New LookML Project to open the New Project page.

    ![image](https://github.com/user-attachments/assets/ab84da58-4abd-40a9-b770-0538a9e04fd1)

5. From the LookML Projects page, select New LookML Project to open the New Project page.
6. On the New Project page, specify the options for the project:   
    a. Project Name: **corelight-dashboards**  
    b. Starting Point: Choose a Blank Project.  
    c. Select Create Project. Looker creates the project and opens it in the Looker IDE. 
    ![image](https://github.com/user-attachments/assets/fbd36668-2b8f-4474-a9bb-01c43156bd17)
 
7. Select the Settings icon from the navigation bar, and open the Configure Git page by selecting the Configure Git button.

    ![image](https://github.com/user-attachments/assets/692f3a9c-0d83-407c-97bc-cf3fae858210)

8. In Looker's Configure Git section, paste the HTTPS URL for the forked Corelight Looker dashboard git repository in the Repository URL field, then select Continue.

- In the Repository URL paste the repo URL which you have forked in **Step-1**

    ![image](https://github.com/user-attachments/assets/fa37cc4e-46eb-4ba7-aa71-f0ed1c1be524)

9. Enter GitHub username and Personal Access Token, then click “Test and Finalize Setup”.

- **Note**: Make sure the **Personal Access Token (PAT)** you created from your github repository has **Read/Write** permissions of the repository.

    ![image](https://github.com/user-attachments/assets/5c9f1920-23c2-441b-b05a-2ef167706343)

10. After successful connection head over to the Project settings page and change the production branch from **master** to **main** and click on save the configuration by scrolling below.

    ![image](https://github.com/user-attachments/assets/c57d93ae-bb7c-4158-b1b9-fba60116e5f3)

11. Now, you should be able to see the code from the **main** branch. If not do the following:  
    
    a. In the ‘Git Actions’ tab from the left side, click on the **“Pull from…”** option.

    ![image](https://github.com/user-attachments/assets/b4f6ab7e-21bf-48ba-9934-07e8e0596334)

    b. Select the **“Pull From Production”** option and click on the Confirm button.

    ![image](https://github.com/user-attachments/assets/7a2a5461-4462-4b16-9154-4afe785d27cb)

12. In the ‘File Browser’ tab from the left side, click on ‘manifest.lkml’ and update the value of the following constant if required and then click “Save Changes”.  
    a. CONNECTION_NAME: The name of the connection you created to connect with the chronicle.
    
    b. CHRONICLE_URL: The base URL of your Chronicle tenant (i.e., https://{your_tenant}.backstory.chronicle.security)

    ![image](https://github.com/user-attachments/assets/d9c22666-917a-4c8c-a385-0a213e4377ce)

13. After saving the changes, click on **"Validate LookML"** on the top right corner and then click on **"Commit changes"** and Push the latest changes to the repository.

    ![image](https://github.com/user-attachments/assets/352e98f8-6af3-48f6-adba-8af5707289cd)

    ![image](https://github.com/user-attachments/assets/5c1eead8-ea38-4a10-9086-8dd53086960f)

14. After the above steps, In the Git Actions, click on the **“Deploy to Production”** or you can press **“Deploy to Production”** from the top right corner.

    ![image](https://github.com/user-attachments/assets/494f29c6-2b3c-477c-8129-cabf25d5123c)

    ![image](https://github.com/user-attachments/assets/a8c02b5f-e3a1-4a7a-a1dc-e7e074b7e89c)

15. On the Homepage of your Looker instance, navigate to the **“LookML dashboards”** tab under the **“Folders”** tab to access and view all the created dashboards.

    ![image](https://github.com/user-attachments/assets/baa25143-f926-4afe-aa42-086715dffb54)

### Upgrade

For any future enhancements into Looker Dashboards make sure the repo you forked in **Step-1** of **Get the Block from the GitHub Repository** section is in sync with this [corelight/block-corelight-chronicle](https://github.com/corelight/block-corelight-chronicle.git) github repository.

To sync this changes in forked repository from the main repository, make sure to follow the steps below:

1. In the event of any additional changes required for the Dashboards in the future, the main repository will be updated. Once you have created a fork of your repository, you can synchronize it by selecting the **"Sync fork"** option located at the top of your repo.

    ![image](https://github.com/user-attachments/assets/3efc89f2-9065-40a6-95fe-f9d4f1b360a6)

2. After clicking **"Sync fork"** you'll see an option to either **"Discard commit"** or **"Update branch"** Select **"Update branch"** and your branch will be updated with the latest changes from the main branch.

    ![image](https://github.com/user-attachments/assets/1af8994a-af04-46c6-8c14-587374e8b21e)

    - **Note**: If you don’t see the **"Update Branch"** option and instead see **"Open Pull Request,"** click the **"Discard commits''** button. This will discard all your local commits while keeping your changes in your Looker code. After clicking "Discard commits," you will have the latest code changes from the main repository.

3. After completing the steps above, go to your Looker instance and refresh the window. You will then see the option to pull the latest code from production by clicking the **"Pull from Production"** button in the top right corner. This will update your repo with the latest code from the main branch.

    ![image](https://github.com/user-attachments/assets/485d7542-4ec5-4932-885f-cc696b072b7f)

4. If in some case **Pull from Production** doesn’t permits head over to git actions and click on **Pull from...** option which will open a popup which shows **"Pull from Production"** and confirm it.

    ![image](https://github.com/user-attachments/assets/b4f6ab7e-21bf-48ba-9934-07e8e0596334)

    ![image](https://github.com/user-attachments/assets/7a2a5461-4462-4b16-9154-4afe785d27cb)

5. After Pulling the code from Production, Deploy the latest code changes to Production by pressing the **"Deploy to Production"** button from the top right corner.

    ![image](https://github.com/user-attachments/assets/494f29c6-2b3c-477c-8129-cabf25d5123c)

    ![image](https://github.com/user-attachments/assets/a8c02b5f-e3a1-4a7a-a1dc-e7e074b7e89c)

Now your code will be upgraded to the latest code and it will be in sync with the **main** repository [corelight/block-corelight-chronicle](https://github.com/corelight/block-corelight-chronicle.git).

### Reference

- For guidance on fully utilizing and analyzing dashboards in Looker, refer to [Looker Guide Documentation](https://cloud.google.com/looker/docs/viewing-dashboards)
