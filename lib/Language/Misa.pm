package Language::Misa;
use 5.008_001;
use strict;
use warnings;
use base qw(Language::Misa::Thing);
use Language::Misa::VM;
use Language::Misa::Compiler;

our $VERSION = '0.01';

sub run {
    my ($class, $code) = @_;
    my $instructions   = Language::Misa::Compiler->compile($code);
    Language::Misa::VM->run($instructions);
}

!!1;

__END__

=encoding utf-8

=head1 NAME

Language::Misa - A Perl implementation of programming language Misa.

=head1 SYNOPSIS

  use Language::Misa;

  Language::Misa->run(<'EOS');
  ごっ、ごぉおっ、ご～きげんよおぉおおぉおほっ。ほおぉおぉおっ。

  「ごきげん☆みゃぁああ”あ”ぁ”ぁああ～っ」

  さわやかな朝の☆ご挨拶！ お挨拶がっ。
  澄みきった青空にこだましちゃうぉ～ああぉおおおぉん。

  「は、はひっ、はろおぉっ☆わぁるどおおぉっぉ～っ」

  こ、この文章は☆おサンプル！ おおぉおぉおおサンプルプログラム！！
  どんなおプログラム言語でも基本のご挨拶させていただくのぉぉおッ！

  「ぽうっ」

  長々と書くのがこ、ここでの～、ここでのぉおおぉおぉぉおたしなみぃぃいぃ。

  「長いぃ。長すぎましゅう。ご挨拶にこんなプログラム長すぎまひゅぅうぅ☆
   んおおぉぉ、ばかになる、おばかになっちゃいましゅ～ッ」

  長いのがっ、バッファの奥まで入ってきましゅたぁあぁあっ！
  ばっふぁ☆溢れちゃいまひゅぅ～。あみゃぁあ”あ”ぁ”ぁああ”あ”ぁぁ。

  「で、出ます☆ んおおぉぉおおっ、エラー出ちゃいまひゅっ」

  ほひぃ☆！ え、えらーっ、んお”お”ぉお”お”ぉおぉおおぉっっ。

  「出た☆ 出た出た出た出たぁぁあっ えらあぴゅるーっって出たあぁっ」

  はしたない☆！ ぉおおぉはしたないっ！ おはしたない言語ですっっっっっっっ！
  おほっほおぉっっっほおぉっっっっっっっっっ！

  「えらあらいしゅきぃぃぃいぃっっ」

  止まらない すごい エラーみるく
  こってりしたのがいっぱい出てるよぉぉぉおおぉぉおおぉぉおっっ。

  「んほぉっ☆ っおぉぉぉおお国が分からなくなっちゃいまひゅう～っ」

  ま、まだ出るぅ☆ 出てるのおぉっ☆ エラーまだまだ出ましゅぅぅ！
  ばんじゃ～ぁぁあい、ばんじゃいぃぃ、ばんにゃんじゃぁんじゃあぁぁああぁい！
  EOS

  #=> prints "HelloWorld!"

=head1 DESCRIPTION

Language::Misa is  blah, blah, blah...

=head1 METHODS

=head2 run ( I<$code> )

=over 4

  Language::Misa->run($code);

Execute given I<$code> as Misa code.

=back

=head1 SEE ALSO

=over 4

=item * Programming Language Misa

http://homepage2.nifty.com/kujira_niku/okayu/misa.html

=back

=head1 AUTHOR

Kentaro Kuribayashi E<lt>kentaro@cpan.orgE<gt>

=head1 SEE ALSO

=head1 COPYRIGHT AND LICENSE (The MIT License)

Copyright (c) Kentaro Kuribayashi E<lt>kentaro@cpan.orgE<gt>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=cut
