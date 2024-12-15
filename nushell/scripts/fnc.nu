def removespace [] {
    def space_names [] {
        ls | where name =~ ' ' | get name
    }
    def replace_spaces [s_in] {
        $s_in | str replace -a ' ' ''
    }

    let sn = space_names
    for name in $sn {
        let newname = replace_spaces $name
        mv $name $newname
    }
}
