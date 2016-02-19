# The Gathering Place

To set things up for the first time:

    $ npm install
    $ bower install
    $ bundle install

## Development workflow and scripts

The project contains a number of scripts to help automate the development cycle.

### Backing up the staging database

Because a large part of the "code" of a Craft site is built out in the Craft CMS, it makes sense that the site's data should be stored in version control. Backing up this data can be achieved fairly simply using the included shell script:

    $ bin/backup-db < ~/Dropbox/D-I\ Project\ Secrets/TheGatheringPlace/mysql-credentials

Just change the path above to a file containing the staging MySQL password (though the above should work in most cases assuming you have access to the DI Project Secrets folder).

### Pushing your code changes up to staging

    $ bin/push

This script will handle building the assets --- SCSS compilation, JS ES6 transpilation, etc, through the [Broccoli](http://broccolijs.com) build system.

If you want to build a production version of the maps (minified code, no source-maps, et al.) run:

    $ BROCCOLI_ENV=production bin/push

**NOTE:** we are committing the compiled assets into the git. This is not ideal, however it greatly simplifies our deployment process.

I find it best to call map this script to a keyboard shortcut in my code editor, that way after I update a template or CSS file, etc, I can quickly tap a command to sync my changes up to the staging server.

### Restoring staging MySQL database from a backup

Should you need to restore the staging database from the latest backup run:

    $ bin/db-restore-from-backup < ~/Dropbox/D-I\ Project\ Secrets/TheGatheringPlace/mysql-credentials

**NOTE:** please use the above with caution, as this will completely blow away any existing data on staging with the latest backup that has been committed to git. Remember, make a backup and commit it often --- see *Backing up the staging database* above.
