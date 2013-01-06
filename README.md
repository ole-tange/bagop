NAME
    bagop - mark files and directories for backup and back them up

SYNOPSIS
    bagop [--dest *[[user@]host:][dir]* ] [--dryrun|-d] [--quiet|-q] (add
    *paths*|del *paths*|commit|stat)

DESCRIPTION
    bagop is a tool for flagging specific files and directories that should
    be backed up.

OPTIONS
    --dest *[[user@]host:][dir]*
             Destination folder. --dest determines where the backup will be
             saved. *dir* is the directory where the backup should be saved
             (defaults to . if a remote host is given). *host* is the name
             of the remote host on which the backup is (default: no remote
             host). *user* is the username on the remote host (default: your
             username).

             The syntax is the same as for rsync.

             The default is ~/backup/bagop.

    -d
    --dryrun Dry run. Do not do the actual backup but show what would be
             done.

    -q
    --quiet  Quiet. Do not output progress information and warnings. Only
             report errors.

    add *paths*
             Add to the backup. Mark *paths* for backing up from now on.
             Adding a directory will add all files and furture files under
             that directory.

    del *paths*
             Delete from the backup. Mark *paths* for not being backed up
             any more and delete it from the backup.

    commit   Do the actual backup. This will copy the files and directories
             to the backup.

    stat
    status   Show status. Show the status of the files and directories.

EXAMPLE: Simple use
    Mark a file foo.gz for backup:

    bagop add foo.gz

    Mark multiple files for backup:

    bagop add *.gz

    Mark a directory results/ for backup:

    bagop add results/

    Copy the marked files and directories to the backup dir

    bagop commit

    Show the backup status:

    bagop stat

EXAMPLE: backup to a specified destination
    The default backup destination is '~/backup/bagop'. To use an
    alternative destination do:

    bagop --dest ~/my_backup add *.gz

    And commit the backup to that specific destination:

    bagop --dest ~/my_backup commit

EXAMPLE: backup to multiple destinations
    First add files for the first destination and then the second:

    bagop --dest ~/my_backup1 add *.gz bagop --dest ~/my_backup2 add *.gz

    And then commit both:

    bagop --dest ~/my_backup commit bagop --dest ~/my_backup commit

EXAMPLE: backup to a specified host
    Specify the alternatie host and the optional directory at the host when
    adding files:

    bagop --dest maasha@host1:my_backup add *.gz

    And then commit the backup for that host and directory:

    bagop --dest maasha@host1:my_backup commit

EXAMPLE: backup to multiple hosts
    Don't put all eggs in one basket. First add files for the first host and
    then the second:

    bagop --dest maasha@host1: add *.gz bagop --dest maasha@host2: add *.gz

    And then commit both:

    bagop --dest maasha@host1: commit bagop --dest maasha@host1: commit

AUTHOR
    Copyright (C) 2011-2013 Martin Asser Hansen, http://www.maasha.dk

    Copyright (C) 2012-2013 Ole Tange, http://ole.tange.dk

LICENSE
    Copyright (C) 2007,2008,2009,2010,2011,2012,2013 Free Software
    Foundation, Inc.

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the
    Free Software Foundation; either version 3 of the License, or at your
    option any later version.

    This program is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
    Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program. If not, see <http://www.gnu.org/licenses/>.

  Documentation license I
    Permission is granted to copy, distribute and/or modify this
    documentation under the terms of the GNU Free Documentation License,
    Version 1.3 or any later version published by the Free Software
    Foundation; with no Invariant Sections, with no Front-Cover Texts, and
    with no Back-Cover Texts. A copy of the license is included in the file
    fdl.txt.

  Documentation license II
    You are free:

    to Share to copy, distribute and transmit the work

    to Remix to adapt the work

    Under the following conditions:

    Attribution
             You must attribute the work in the manner specified by the
             author or licensor (but not in any way that suggests that they
             endorse you or your use of the work).

    Share Alike
             If you alter, transform, or build upon this work, you may
             distribute the resulting work only under the same, similar or a
             compatible license.

    With the understanding that:

    Waiver   Any of the above conditions can be waived if you get permission
             from the copyright holder.

    Public Domain
             Where the work or any of its elements is in the public domain
             under applicable law, that status is in no way affected by the
             license.

    Other Rights
             In no way are any of the following rights affected by the
             license:

             * Your fair dealing or fair use rights, or other applicable
               copyright exceptions and limitations;

             * The author's moral rights;

             * Rights other persons may have either in the work itself or in
               how the work is used, such as publicity or privacy rights.

    Notice   For any reuse or distribution, you must make clear to others
             the license terms of this work.

    A copy of the full license is included in the file as cc-by-sa.txt.

SEE ALSO
    ssh(1), rsync(1)

