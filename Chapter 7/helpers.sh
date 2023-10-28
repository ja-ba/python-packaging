
#Setting up and accessing virtual environment
python -m venv .venv
source .venv/Scripts/activate 

#Installing build dependencies
python -m pip install --upgrade pip
pip install build
pip install pre-commit

#Timing the python code
python -m timeit \
    --setup 'from harmonic_mean import harmonic_mean' \
    --setup 'from random import randint' \
    --setup 'nums = [randint(1, 1_000_000) 
for _ in range(1_000_000)]' 'harmonic_mean(nums)'  



#Building the package
pyproject-build


#Installing the newly build package
python -m pip install .

#Timing the C implemented python code
python -m timeit \
    --setup 'from imppkg.harmonic_mean import harmonic_mean' \
    --setup 'from random import randint' \
    --setup 'nums = [randint(1, 1_000_000) 
for _ in range(1_000_000)]' 'harmonic_mean(nums)'  

# Uploading via twine
pip install twine
pyproject-build --sdist
twine upload -r testpypi dist/*
