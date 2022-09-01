package ## no critic: Modules::RequireFilenameMatchesPackage
    # hide from PAUSE
    TableDataRole::Business::ID::DGIP::Class::23;

use 5.010001;
use strict;
use warnings;

use Role::Tiny;
with 'TableDataRole::Source::CSVInFile';

around new => sub {
    my $orig = shift;

    require File::Basename;
    my $filename = File::Basename::dirname(__FILE__) . '/../../../../../../share/class23.csv';
    unless (-f $filename) {
        require File::ShareDir;
        $filename = File::ShareDir::dist_file('TableDataBundle-Business-ID-DGIP', 'class23.csv');
    }
    $orig->(@_, filename=>$filename);
};

package TableData::Business::ID::DGIP::Class::23;

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;

# AUTHORITY
# DATE
# DIST
# VERSION

with 'TableDataRole::Business::ID::DGIP::Class::23';

# STATS

1;
# ABSTRACT: List of products/services in class 23 ("Textile yarns") in Indonesian DGIP (Directorate General of Intellectual Property)

=head1 DESCRIPTION

Keyword: DJKI, Sistem Klasifikasi Merek. Benang tekstil.