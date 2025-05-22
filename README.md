# BADAS_scDAPP_2025.05.22
Guide for [scDAPP](https://github.com/bioinfoDZ/scDAPP) for the Bioinformatics and Data Analysis Series (BADAS) seminar series at NYU.

<br />

## 1. Example data and download instructions

We prepared some example data: [see the relevant repository for details](https://github.com/FerrenaAlexander/scDAPP_example_data).

Navigate to a folder of your choice before downloading. Then, to download:
```
git clone https://github.com/FerrenaAlexander/scDAPP_example_data.git
```

The data is about 284Mb in size. The test will leave a folder with ~2.2Gb output.

<br />

## 2. Running the pipeline:

Download or copy the ["scdapp_runner.sh"](https://github.com/FerrenaAlexander/BADAS_scDAPP_2025.05.22/blob/main/scdapp_runner.sh) script. Place it in the "scripts" subfolder of the downloaded exampel data repository. If you don't want to download the file you can copy/paste: at the top right of the screen there will be a button with two squares, this will copy it to your keyboard. You can then create a file and paste the contents there.

You will need to adjust some lines, such as the line starting with "projdir = ", based on where you have downloaded the folder.

Once saved and updated, execute it as a sbatch job: 
```
sbatch scdapp_runner.sh
```

