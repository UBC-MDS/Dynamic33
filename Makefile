.PHONY: all clean

results/isles.dat : data/isles.txt scripts/wordcount.py
    python scripts/wordcount.py \
        --input_file=data/isles.txt \
        --output_file=results/isles.dat

results/abyss.dat : data/abyss.txt scripts/wordcount.py
python scripts/wordcount.py \
    --input_file=data/abyss.txt \
    --output_file=results/abyss.dat

results/figure/isles.png : results/isles.dat scripts/plotcount.py
    python scripts/plotcount.py \
        --input_file=results/isles.dat \
        --output_file=results/figure/isles.png

results/figure/abyss.png : results/abyss.dat scripts/plotcount.py
    python scripts/plotcount.py \
        --input_file=results/abyss.dat \
        --output_file=results/figure/abyss.png

clean :
    rm -f results/isles.dat \
        results/abyss.dat
    rm -f results/figure/isles.png \
        results/figure/abyss.png

