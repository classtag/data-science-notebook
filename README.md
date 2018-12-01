# Data science notebook

A light data science notebook docker image build package.

## How to install ?

### Docker environment setup
This repository build on docker-compose, so you have to setup docker-compose environment at first, please seek from google.

### Setup a data science notebook
```base

~ git clone git@github.com:classtag/data-science-notebook.git
~ cd data-science-notebook
~ ./start.sh

```

### Jupyter notebook and tensorboard
- notebook link: http://localhost:8888

It needs a password, you should get from ```head -n 100 /tmp/dsn.log```

- tensorboard link: http://localhost:6006

### Has installed major packages
- scikit-learn
- pandas
- numpy
- tensorflow
- keras
- pytorch-nightly-cpu
- torchvision-nightly-cpu
- fastai
- xgboost
- lightgbm
- tqdm


