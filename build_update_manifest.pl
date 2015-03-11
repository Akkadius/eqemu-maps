#::: Akkadius
#::: Build manifest text file for eqemu_update.pl

use File::Find;

open (MAPS_MANIFEST, '> !eqemu_maps_manifest.txt');

my @files;
my $start_dir = "maps/";
find( 
    sub { push @files, $File::Find::name unless -d; }, 
    $start_dir
);
for my $file (@files) {
	if($file=~/\.map|\.wtr|\.path/i){
		my $file_size = (stat $file)[7];
		print $file . "," . $file_size . "\n";
		print MAPS_MANIFEST $file . "," . $file_size . "\n";
	}
}

close (MAPS_MANIFEST);