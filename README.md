# comira_training_zeeshan

Repository for training of RTL design and UVM verification for trainees

Each user should clone this directory and create branch with their name. For example --> mars_training After successful review, branch will be merged with main branch

Following are some kickstart commands for using git. To clone a repository locally:

git clone https://github.com/<user_name>/<repo_name>.git

You will directly reside into the main branch.

Use these following commands to register your git account with the repo:

git config --global user.name "<your github username"
git config --global user.email "MY_NAME@example.com"

-------------
To add files:
-------------

After working (change files, add files etc), you can see whatever you have done so far.

git status --> Show current status of files, modified or newly added or removed  
git add <file_name with path>* --> Stage modified/new files for commit  
git commit -m "Commit message"* --> Create a commit with -m switch to have a brief commit message about this commit  
git push --> Push staged files into repository  

---------------------------------
To create a new branch from main:
---------------------------------

git checkout -b branch_name --> Create a branch locally  
git push --set-uptsream origin branch_name --> Upload the branch into remote repository  

Now your branch is created and uploaded into remote repository. Do whatever you want to do in this branch, commit your files etc  

--------------------------
To merge branch into main:
--------------------------

Confirm if you have any uncommitted file left in your branch, commit or remove if its not of any usage.  

git pull origin main** --> Pull updates from latest main in this branch to keep it updated  
git checkout main --> Checkout to main branch  
git merge branch_name --> Merge branch with main branch  
git push -u origin main --> Push updated stuff from branch merging in main  

--------------------------------------
To delete branch locally and remotely:
--------------------------------------

git branch -D branch_name --> Delete branch locally  
git push origin -d branch_name --> Delete branch from remote repository  

*It is a good practice to take pull first before each step of committing your files. You never know when you will get new push from another user working on that repository which may create commit conflicts. After staging file by "git add", do check "git status" to check if all of your desirable files are staged for commit or not.  

**While taking pull from main branch into your working branch, you may get conflicts in common files which are updated in both branches, so you need to remove the conflicts first, then push your stuff.  

Follow these guidelines:  

After cloning the repo, make a branch name "comb_ckt" for section 1, "seq_ckt" for section 2, "fsm_ckt" for section 3

In your working branch, (lets say comb_ckt) make separate directory for each question and name it according to the question (for example, task 1 of section 1 is to calculate odd parity, so you can name it "odd_parity_checker")

In that directory, there will be 4 files: 
1) RTL file
2) Testbench file
3) Waveform dump file (in vcd format)
4) Small shell script with icarus verilog commands to compile and simulate the design. 

RTL file should be named according to the question (for eg: odd_partiy_rtl.v) and testbench file should be named same as rtl file but with tb_ prefix (for eg: tb_odd_parity_rtl.v)
# comira_training_zeeshan
