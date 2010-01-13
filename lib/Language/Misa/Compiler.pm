package Language::Misa::Compiler;
use strict;
use warnings;
use utf8;
use Carp qw(croak);
use Encode qw(decode_utf8 is_utf8);

my %instruction_map;
   $instruction_map{$_} = 'incr'       for qw(> ＞ → ～ ー);
   $instruction_map{$_} = 'decr'       for qw(< ＜ ← ★ ☆);
   $instruction_map{$_} = 'add'        for qw(+ ＋ あ ぁ お ぉ);
   $instruction_map{$_} = 'sub'        for qw(- − っ ッ);
   $instruction_map{$_} = 'put'        for qw(. ！ !);
   $instruction_map{$_} = 'set'        for ',', qw(？ ?);
   $instruction_map{$_} = 'loop_start' for qw([ 「 『);
   $instruction_map{$_} = 'loop_end'   for qw(] 」 』);

sub tokenize {
    my ($class, $code) = @_;
    $code = decode_utf8($code) if !is_utf8($code);

    # strip comment line
    $code =~ s/^#.+?$//mg;

    # strip nonsense chars
    my $pattern = '[^' . (join '', map { quotemeta $_ } keys %instruction_map) . ']';
    $code =~ s/$pattern//g;

    [split //, $code];
}

sub compile {
    my ($class, $code) = @_;
    my @tokens = @{$class->tokenize($code)};
    my @instructions;
    my $i = 0;

    for my $token (@tokens) {
        my $instruction = $instruction_map{$token} or next;

        if ($instruction eq 'loop_start') {
            for (my $j = $i + 1; $j <= $#tokens; $j++) {
                if (($instruction_map{$tokens[$j]} || '') eq 'loop_end') {
                    push @instructions, [$instruction, $j];
                    last;
                }
                croak "mathing $token not found"
                    if $j == $#tokens;
            }
        }
        elsif ($instruction eq 'loop_end') {
            for (my $j = $i - 1; $j >= 0; $j--) {
                if (($instruction_map{$tokens[$j]} || '') eq 'loop_start') {
                    push @instructions, [$instruction, $j - 1];
                    last;
                }
                croak "mathing $token not found"
                    if $j == 0;
            }
        }
        else {
            push @instructions, [$instruction];
        }

        $i++;
    }

    \@instructions;
}

!!1;
