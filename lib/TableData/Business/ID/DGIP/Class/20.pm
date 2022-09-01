package ## no critic: Modules::RequireFilenameMatchesPackage
    # hide from PAUSE
    TableDataRole::Business::ID::DGIP::Class::20;

use 5.010001;
use strict;
use warnings;

use Role::Tiny;
with 'TableDataRole::Source::CSVInFile';

around new => sub {
    my $orig = shift;

    require File::Basename;
    my $filename = File::Basename::dirname(__FILE__) . '/../../../../../../share/class20.csv';
    unless (-f $filename) {
        require File::ShareDir;
        $filename = File::ShareDir::dist_file('TableDataBundle-Business-ID-DGIP', 'class20.csv');
    }
    $orig->(@_, filename=>$filename);
};

package TableData::Business::ID::DGIP::Class::20;

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;

# AUTHORITY
# DATE
# DIST
# VERSION

with 'TableDataRole::Business::ID::DGIP::Class::20';

# STATS

1;
# ABSTRACT: List of products/services in class 20 ("Home equipments") in Indonesian DGIP (Directorate General of Intellectual Property)

=head1 DESCRIPTION

Keyword: DJKI, Sistem Klasifikasi Merek. Perabot rumah.