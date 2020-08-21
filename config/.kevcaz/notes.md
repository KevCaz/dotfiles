https://github.com/julia-actions/setup-julia\

https://stackoverflow.com/questions/9741433/appending-a-line-break-to-an-output-file-in-a-shell-script

https://github.com/actions/virtual-environments/blob/main/images/macos/macos-10.15-Readme.md

    steps:
      - uses: actions/checkout@v1.0.0
      - name: "Install apt-get packages"
        if: runner.os == 'Linux'
        run: |-
            sudo apt-get update
            sudo apt-get install -y python-matplotlib python3-matplotlib
        if: runner.os == 'macOS'
        run: |
          pip3 install matplotlib


https://onlinelibrary.wiley.com/doi/epdf/10.1111/ele.13582

https://huygens.science.uva.nl/PlotsOfData/

