
echo -e "\e[0m\e[34m\uE0B2\e[0m\e[44m Copying src/latest to src/$1 \e[0m\e[34m\uE0B0\e[0m"
cp src/latest/ src/$1 -r
cd src/$1
echo -e "\e[0m\e[34m\uE0B2\e[0m\e[44m Modifying pyproject.toml \e[0m\e[34m\uE0B0\e[0m"
echo -e "[tool.poetry]\nname = \"v\"\nversion = \"$1\"\ndescription = \"v makes building projects easier. It's as simple as that.\"\nauthors = [\"Dylan Rogers <opendylan@proton.me>\"]\nreadme = \"README.md\"\n\n[tool.poetry.dependencies]\npython = \"^3\"\n\n\n[build-system]\nrequires = [\"poetry-core\"]\nbuild-backend = \"poetry.core.masonry.api\"\n" > pyproject.toml
echo -e "\e[0m\e[34m\uE0B2\e[0m\e[44m Building Python package \e[0m\e[34m\uE0B0\e[0m"
poetry build
echo -e "\e[0m\e[34m\uE0B2\e[0m\e[44m Publishing to PyPI \e[0m\e[34m\uE0B0\e[0m"
poetry publish
#echo -e "\e[0m\e[34m\uE0B2\e[0m\e[44m Creating git \e[0m\e[34m\uE0B0\e[0m"
#git commit -m $1
#git branch -M main
#git push -u origin main