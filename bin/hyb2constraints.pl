#!/usr/bin/perl

# inputs hyb file, with coordinates of predicted RNA stems
# outputs a file in the format "F 1 100 5", which can be used as a list of constraints for hybrid-ss-min

eval '$'.$1.'$2;' while $ARGV[0] =~ /^([A-Za-z_0-9]+=)(.*)/ && shift;

LINE: while (<>){
	chomp;
	my $line = $_;
	my @F = split("\t", $line, -1);
	my @coords = ($F[6],$F[7],$F[12],$F[13]);
	if( overlap( @coords) > 0 ){
		next LINE;
	}
	my @sorted_coords = sort {$a <=> $b} @coords;
	$sorted_coords = join("\t", @sorted_coords);
	printf "F\t%s\t%s\t%s\n", $sorted_coords[0], $sorted_coords[3], $sorted_coords[1]-$sorted_coords[0]+1;
}

sub min {
        my ($a, $b) = @_;
        $a <= $b ? $a : $b;
}

sub max {
        my ($a, $b) = @_;
        $a >= $b ? $a : $b;
}

sub overlap {
        my ($a, $b, $c, $d) = @_;
        1 + min( $b, $d ) - max ($a, $c );
}


