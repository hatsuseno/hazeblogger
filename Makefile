# makefile for hazeblogger, a CMS without boundaries
# Copyright (C) 2009-2011 Jaromir Hradilek

# This program is  free software:  you can redistribute it and/or modify it
# under  the terms  of the  GNU General Public License  as published by the
# Free Software Foundation, version 3 of the License.
#
# This program  is  distributed  in the hope  that it will  be useful,  but
# WITHOUT  ANY WARRANTY;  without  even the implied  warranty of MERCHANTA-
# BILITY  or  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
# License for more details.
#
# You should have received a copy of the  GNU General Public License  along
# with this program. If not, see <http://www.gnu.org/licenses/>.

# General information:
NAME    = hazeblogger
VERSION = 1.2.0

# General settings:
SHELL   = /bin/sh
INSTALL = /usr/bin/install -c
POD2MAN = /usr/bin/pod2man
MAN1    = src/haze-add.1 src/haze-config.1 src/haze-edit.1 \
          src/haze-init.1 src/haze-list.1 src/haze-log.1 \
          src/haze-make.1 src/haze-remove.1
SRCS    = src/haze-add.pl src/haze-config.pl src/haze-edit.pl \
          src/haze-init.pl src/haze-list.pl src/haze-log.pl \
          src/haze-make.pl src/haze-remove.pl

# Installation directories:
config  = /etc
prefix  = /usr/local
bindir  = $(prefix)/bin
datadir = $(prefix)/share/$(NAME)
docsdir = $(prefix)/share/doc/$(NAME)-$(VERSION)
man1dir = $(prefix)/share/man/man1
compdir = $(config)/bash_completion.d

# Make rules;  please do not edit these unless you really know what you are
# doing:
.PHONY: all install_bin install_conf install_data install_docs \
        install_man install uninstall clean

all: $(MAN1)

install_bin:
	@echo "Copying executables..."
	$(INSTALL) -d $(bindir)
	$(INSTALL) -m 755 src/haze-add.pl $(bindir)/haze-add
	$(INSTALL) -m 755 src/haze-log.pl $(bindir)/haze-log
	$(INSTALL) -m 755 src/haze-edit.pl $(bindir)/haze-edit
	$(INSTALL) -m 755 src/haze-init.pl $(bindir)/haze-init
	$(INSTALL) -m 755 src/haze-list.pl $(bindir)/haze-list
	$(INSTALL) -m 755 src/haze-make.pl $(bindir)/haze-make
	$(INSTALL) -m 755 src/haze-config.pl $(bindir)/haze-config
	$(INSTALL) -m 755 src/haze-remove.pl $(bindir)/haze-remove
	$(INSTALL) -m 755 unix/haze.sh $(bindir)/haze

install_conf:
	@echo "Copying bash completion..."
	$(INSTALL) -d $(compdir)
	$(INSTALL) -m 644 unix/bash_completion $(compdir)/hazeblogger

install_data:
	@echo "Copying translations..."
	$(INSTALL) -d $(datadir)/lang
	$(INSTALL) -m 644 lang/cs_CZ $(datadir)/lang
	$(INSTALL) -m 644 lang/de_DE $(datadir)/lang
	$(INSTALL) -m 644 lang/en_GB $(datadir)/lang
	$(INSTALL) -m 644 lang/en_US $(datadir)/lang
	$(INSTALL) -m 644 lang/es_ES $(datadir)/lang
	$(INSTALL) -m 644 lang/eu_ES $(datadir)/lang
	$(INSTALL) -m 644 lang/fr_FR $(datadir)/lang
	$(INSTALL) -m 644 lang/ja_JP $(datadir)/lang
	$(INSTALL) -m 644 lang/pt_BR $(datadir)/lang
	$(INSTALL) -m 644 lang/ru_RU $(datadir)/lang
	$(INSTALL) -m 644 lang/uk_UK $(datadir)/lang

install_docs:
	@echo "Copying documentation..."
	$(INSTALL) -d $(docsdir)
	$(INSTALL) -m 644 FDL $(docsdir)
	$(INSTALL) -m 644 TODO $(docsdir)
	$(INSTALL) -m 644 README $(docsdir)
	$(INSTALL) -m 644 AUTHORS $(docsdir)
	$(INSTALL) -m 644 COPYING $(docsdir)
	$(INSTALL) -m 644 INSTALL $(docsdir)
	-$(INSTALL) -m 644 ChangeLog $(docsdir)

install_man: $(MAN1)
	@echo "Copying manual pages..."
	$(INSTALL) -d $(man1dir)
	$(INSTALL) -m 644 src/haze-add.1 $(man1dir)
	$(INSTALL) -m 644 src/haze-log.1 $(man1dir)
	$(INSTALL) -m 644 src/haze-edit.1 $(man1dir)
	$(INSTALL) -m 644 src/haze-init.1 $(man1dir)
	$(INSTALL) -m 644 src/haze-list.1 $(man1dir)
	$(INSTALL) -m 644 src/haze-make.1 $(man1dir)
	$(INSTALL) -m 644 src/haze-config.1 $(man1dir)
	$(INSTALL) -m 644 src/haze-remove.1 $(man1dir)
	$(INSTALL) -m 644 unix/man/man1/haze.1 $(man1dir)

install: install_bin install_conf install_data install_docs install_man

uninstall:
	@echo "Removing executables..."
	-rm -f $(bindir)/haze-add
	-rm -f $(bindir)/haze-log
	-rm -f $(bindir)/haze-edit
	-rm -f $(bindir)/haze-init
	-rm -f $(bindir)/haze-list
	-rm -f $(bindir)/haze-make
	-rm -f $(bindir)/haze-config
	-rm -f $(bindir)/haze-remove
	-rm -f $(bindir)/haze
	-rmdir $(bindir)
	@echo "Removing bash completion..."
	-rm -f $(compdir)/hazeblogger
	-rmdir $(compdir)
	@echo "Removing translations..."
	-rm -f $(datadir)/lang/cs_CZ
	-rm -f $(datadir)/lang/de_DE
	-rm -f $(datadir)/lang/en_GB
	-rm -f $(datadir)/lang/en_US
	-rm -f $(datadir)/lang/es_ES
	-rm -f $(datadir)/lang/eu_ES
	-rm -f $(datadir)/lang/fr_FR
	-rm -f $(datadir)/lang/ja_JP
	-rm -f $(datadir)/lang/pt_BR
	-rm -f $(datadir)/lang/ru_RU
	-rm -f $(datadir)/lang/uk_UK
	-rmdir $(datadir)/lang $(datadir)
	@echo "Removing documentation..."
	-rm -f $(docsdir)/FDL
	-rm -f $(docsdir)/TODO
	-rm -f $(docsdir)/README
	-rm -f $(docsdir)/AUTHORS
	-rm -f $(docsdir)/COPYING
	-rm -f $(docsdir)/INSTALL
	-rm -f $(docsdir)/ChangeLog
	-rmdir $(docsdir)
	@echo "Removing manual pages..."
	-rm -f $(man1dir)/haze-add.1
	-rm -f $(man1dir)/haze-log.1
	-rm -f $(man1dir)/haze-edit.1
	-rm -f $(man1dir)/haze-init.1
	-rm -f $(man1dir)/haze-list.1
	-rm -f $(man1dir)/haze-make.1
	-rm -f $(man1dir)/haze-config.1
	-rm -f $(man1dir)/haze-remove.1
	-rm -f $(man1dir)/haze.1
	-rmdir $(man1dir)

clean:
	-rm -f $(MAN1)

%.1: %.pl
	$(POD2MAN) --section=1 --release="Version $(VERSION)" \
	                       --center="hazeblogger Documentation" $^ $@

