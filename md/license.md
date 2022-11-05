# License and Rights


A really good synthetic document about software license: http://choosealicense.com/licenses/
An other one a bit more exhaustive and descriptive from the GNU Project: https://www.gnu.org/licenses/license-list.html

Generate license header with 

	copyright-header --license AGPL3 \
		--copyright-holder 'owner name' \
		--copyright-software 'project name' \
		--copyright-software-description "project's short description" \
		--copyright-year 2022 \
		-a to/path -o ./

    # or with a licence header file
    copyright-header --license-file ../agpl-header -a ./to/path -o ./


