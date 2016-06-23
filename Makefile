GO ?= go

BUILDMODE := install

LDFLAGS1 += -extldflags "-static -lrocksdb -lpthread -dynamic"
LDFLAGS2 += -extldflags "-static"

.PHONY: build 
build: BUILDMODE = build
build: install

.PHONY: install
install:	dgraph	dgraphloader	dgraphassigner	dlist	merge

.PHONY: dgraph
dgraph:
	cd "./cmd/dgraph" ; \
	$(GO) $(BUILDMODE) --ldflags '$(LDFLAGS1)' . ; 

.PHONY: dgraphassigner
dgraphassigner:
	cd "./cmd/dgraphassigner" ; \
	$(GO) $(BUILDMODE) --ldflags '$(LDFLAGS2)' .  ;

.PHONY: dgraphloader
dgraphloader:
	cd "./cmd/dgraphloader" ; \
	$(GO) $(BUILDMODE) --ldflags '$(LDFLAGS2)' .  ;

.PHONY: dlist
dlist:
	cd "./cmd/dlist" ; \
	$(GO) $(BUILDMODE) --ldflags '$(LDFLAGS2)' .  ;

.PHONY: merge
merge:
	cd "./cmd/merge" ; \
	$(GO) $(BUILDMODE) --ldflags '$(LDFLAGS2)' .  ;


