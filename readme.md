cf push cli8 Github Action

How to use
Create a workflow and use the action to push your cf app

name: Deploy the package to Cloud Foundry
on: push
    
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Deploy to CF
        uses: Vishwastp89/CF@latest
        with:
          CF_API: ${{ secrets.CF_API }}
          CF_USERNAME: ${{ secrets.CF_USERNAME }}
          CF_PASSWORD: ${{ secrets.CF_PASSWORD }}
          CF_ORG: ${{ secrets.CF_ORG }}
          CF_SPACE: ${{ secrets.CF_SPACE }}
          command: target
