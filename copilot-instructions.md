# Instructions for GitHub Copilot

1. **Update `seed.txt` with CHEBI IDs**
    - Open the `seed.txt` file in your project directory.
    - Add or update the list of CHEBI IDs as required, one per line.

2. **Run ODK Make All**
    - Open your terminal and navigate to the project directory.
    - Execute the following command:
      ```
      sh odk.sh make all
      ```
    - Wait for the process to complete. This will update your ontology files based on the new CHEBI IDs.

3. **Open a Pull Request**
    - Commit your changes:
      ```
      git add seed.txt
      git commit -m "Update seed.txt with new CHEBI IDs and rebuild ontology"
      git push
      ```
    - Go to your repository on GitHub.
    - Click "Compare & pull request" to open a new PR with your changes.