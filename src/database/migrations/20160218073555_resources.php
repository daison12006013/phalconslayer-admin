<?php

use Clarity\Support\Phinx\Migration\AbstractMigration;

class Resources extends AbstractMigration
{
    public function up()
    {
        $resources = $this->table('resources');

        if (!$this->hasTable('resources')) {
            $resources

                # columns
                ->addColumn('resource', 'string')
                ->addColumn('table', 'string')

                # indexes
                ->addIndex(['resource'], ['unique' => true])

                # created_at and updated_at
                ->addTimestamps()

                # deleted_at
                ->addSoftDeletes()

                # build the entire table
                ->create();
        }
    }

    public function down()
    {
        $resources = $this->table('resources');

        $this->dropTable('resources');
    }
}
