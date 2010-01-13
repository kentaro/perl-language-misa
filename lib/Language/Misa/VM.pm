package Language::Misa::VM;
use strict;
use warnings;
use base qw(Language::Misa::Thing);

__PACKAGE__->mk_accessors(qw(
    stack
    sp
    ip
    instructions
));

sub new {
    my $class = shift;
    my $self  = $class->SUPER::new(@_);
       $self->stack = [];
       $self->sp    = 0;
       $self->ip    = 0;
       $self;
}

sub current : lvalue {
    my $self = shift;
    $self->stack->[$self->sp];
}

sub size { scalar @{shift->instructions} }

sub run {
    my ($class, $instructions) = @_;
    my $self = $class->new({ instructions => $instructions });
    while ($self->ip < $self->size) {
        my $insn   = $self->instructions->[$self->ip][0];
        my $length = scalar @{$self->instructions->[$self->ip]};
        my @args   = @{$self->instructions->[$self->ip]}[1..$length];
        $self->can($insn)->($self, @args);
        $self->ip++;
    }
}

sub jump_to {
    my ($self, $to) = @_;
    $self->ip = $to;
}

# instructions
sub incr { shift->sp++                           }
sub decr { shift->sp--                           }
sub add  { shift->current++                      }
sub sub  { shift->current--                      }
sub put  { print chr (shift->current || 0)       }
sub set  { shift->current = substr <STDIN>, 0, 1 }

sub loop_start {
    my ($self, $end) = @_;
    if (!$self->current) {
        $self->jump_to($end);
    }
}

sub loop_end {
    my ($self, $start) = @_;
    $self->jump_to($start);
}

!!1;
