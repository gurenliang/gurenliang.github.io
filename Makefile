#

DOCS=index

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix ./, $(HDOCS))

.PHONY : docs
docs : $(PHDOCS)

.PHONY : update
update : $(PHDOCS)
	@echo $(DOCS)
	@echo $(HDOCS)
	@echo $(PHDOCS)
	@echo -n 'Copying to server...'
	# insert code for copying to server here.
	rsync -avz ./ /var/www/renliang/
	@echo ' done.'

./index.html : index.jemdoc
	# MENU
	jemdoc -o $@ $<

.PHONY : clean
	clean :
	-rm -f html/*.html
