
DOCS:=index

HDOCS:=$(addsuffix .html, $(DOCS))

FLAGS := -c mysite.conf

.PHONY : docs
docs : $(HDOCS)

.PHONY : update
update : $(HDOCS)
	@echo $(DOCS)
	@echo $(HDOCS)
	@echo -n 'Copying to server...'
	# insert code for copying to server here.
	rsync -avz ./ /var/www/renliang/
	@echo ' done.'

all: docs

$(HDOCS) : %.html : %.jemdoc mysite.conf MENU
	jemdoc $(FLAGS) $<

.PHONY : clean
	clean :
	-rm -vf $(HDOCS)
