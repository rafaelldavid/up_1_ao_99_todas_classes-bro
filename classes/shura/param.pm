sub inicializarParametrosClasses {
    my %parametrosClasses = (
        idC1 => 4,
        idC2 => 8,
        idC2Alt => -1,
        idC1T => 4005,
        idC2T => 4016,
        idC2TAlt => -2,
        idC3 => 4070,
        idBC1 => 4027,
        idBC2 => 4038,
        idBC2Alt => -3
    );

    my $eventMacro = $eventMacro::Data::eventMacro;
    $eventMacro->set_full_hash('parametrosClasses', \%parametrosClasses);
}

