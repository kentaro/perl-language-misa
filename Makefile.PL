use inc::Module::Install;

name     'Language-Misa';
author   'Kentaro Kuribayashi, <kentarok@cpan.org>';
license  'MIT';
all_from 'lib/Language/Misa.pm';

requires 'Class::Accessor::Lvalue';

author_tests   'xt';
auto_set_repository;
auto_include_deps;
WriteAll;
