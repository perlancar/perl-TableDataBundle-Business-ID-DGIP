package TableData::Business::ID::DGIP::AllClass;

use 5.010001;
use strict;
use warnings;

use Role::Tiny;
with 'TableDataRole::Source::Iterator';

my $state;
my $fh_perclass;
my $fh_listofclass;
my $csv_perclass;
my $csv_listofclass;
my $class_row;

sub new {
    my $class = shift;

    $class->_new(
        gen_iterator => sub {
            require File::Basename;
            require Text::CSV;

            my $dir = File::Basename::dirname(__FILE__) . '/../../../../../share';

            my $state = "start";
            return sub {
              REPEAT:

                if ($state eq 'start') {
                    open $fh_listofclass, "<", "$dir/class.csv"
                        or die "Can't open $dir/class.csv: $!";
                    $csv_listofclass = Text::CSV->new({binary=>1, auto_diag=>1});
                    # discard header
                    $csv_listofclass->getline($fh_listofclass);
                    $state = 'read_class.csv';
                    goto REPEAT;
                } elsif ($state eq 'read_class.csv') {
                    $class_row = $csv_listofclass->getline($fh_listofclass);
                    return unless $class_row;
                    open $fh_perclass, "<", "$dir/class$class_row->[0].csv"
                        or die "Can't open $dir/class$class_row->[0].csv: $!";
                    $csv_perclass = Text::CSV->new({binary=>1, auto_diag=>1});
                    # discard header
                    $csv_perclass->getline($fh_perclass);
                    $state = 'read_classX.csv';
                    return {"00row_type"=>"class", class_num=>$class_row->[0], class_description=>$class_row->[1], item_name_ind=>undef, item_name_eng=>undef};
                } elsif ($state eq 'read_classX.csv') {
                    my $row = $csv_perclass->getline($fh_perclass);
                    unless ($row) { $state = 'read_class.csv'; goto REPEAT }
                    return {"00row_type"=>"item", class_num=>$class_row->[0], class_description=>undef, item_name_ind=>$row->[0], item_name_eng=>$row->[1]};
                } else {
                    die "BUG: unhandled state '$state'";
                }
            }; # return sub
        }, # gen_iterator
    );
};

# STATS

1;
# ABSTRACT: List of products/services (from all classes) in Indonesian DGIP (Directorate General of Intellectual Property)

=head1 DESCRIPTION

Keyword: DJKI, Sistem Klasifikasi Merek
