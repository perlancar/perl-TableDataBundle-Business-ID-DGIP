package ## no critic: Modules::RequireFilenameMatchesPackage
    # hide from PAUSE
    TableDataRole::Business::ID::DGIP::Class::9;

use 5.010001;
use strict;
use warnings;

use Role::Tiny;
with 'TableDataRole::Source::CSVInFile';

around new => sub {
    my $orig = shift;

    require File::Basename;
    my $filename = File::Basename::dirname(__FILE__) . '/../../../../../../share/class9.csv';
    unless (-f $filename) {
        require File::ShareDir;
        $filename = File::ShareDir::dist_file('TableDataBundle-Business-ID-DGIP', 'class9.csv');
    }
    $orig->(@_, filename=>$filename);
};

package TableData::Business::ID::DGIP::Class::9;

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;

# AUTHORITY
# DATE
# DIST
# VERSION

with 'TableDataRole::Business::ID::DGIP::Class::9';

# STATS

1;
# ABSTRACT: List of products/services in class 9 ("Scientific & electrical tools, audio/visual tools; digital media recorders") in Indonesian DGIP (Directorate General of Intellectual Property)

=head1 DESCRIPTION

Keyword: DJKI, Sistem Klasifikasi Merek. Perkakas ilmu pengetahuan dan elektrikal; perkakas suara/gambar; perekam media digital