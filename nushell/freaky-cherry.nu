# Retrieve the theme settings
export def main [] {
    return {
        binary: '#02e8fb'
        block: '#883cdc'
        cell-path: '#ececec'
        closure: '#f0ea0d'
        custom: '#e4838d'
        duration: '#ffd16f'
        float: '#da6bac'
        glob: '#e4838d'
        int: '#ffb7f8'
        list: '#ff5314'
        nothing: '#d94085'
        range: '#ffd16f'
        record: '#cb45ff'
        string: '#fc5982'

        bool: {|| if $in { '#ff919d' } else { '#ffd16f' } }

        date: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#d94085' attr: 'b' }
            } else if $in < 6hr {
                '#d94085'
            } else if $in < 1day {
                '#ffd16f'
            } else if $in < 3day {
                '#2ab250'
            } else if $in < 1wk {
                { fg: '#2ab250' attr: 'b' }
            } else if $in < 6wk {
                '#ffb7f8'
            } else if $in < 52wk {
                '#883cdc'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#fff8de'
            } else if $e < 1mb {
                '#9586f4'
            } else {{ fg: '#883cdc' }}
        }

        shape_and: { fg: '#ececec' attr: 'b' }
        shape_binary: { fg: '#ececec' attr: 'b' }
        shape_block: { fg: '#883cdc' attr: 'b' }
        shape_bool: '#02e8fb'
        shape_closure: { fg: '#f0ea0d' attr: 'b' }
        shape_custom: '#2ab250'
        shape_datetime: { fg: '#00e488' attr: 'b' }
        shape_directory: '#9586f4'
        shape_external: '#ff5314'
        shape_external_resolved: '#ff919d'
        shape_externalarg: { fg: '#2ab250' attr: 'b' }
        shape_filepath: '#b0a4ff'
        shape_flag: { fg: '#883cdc' attr: 'b' }
        shape_float: { fg: '#da6bac' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF'  attr: 'b' }
        shape_glob_interpolation: { fg: '#9a81d9' attr: 'b' }
        shape_globpattern: { fg: '#ff3abd' attr: 'b' }
        shape_int: { fg: '#ffb7f8' attr: 'b' }
        shape_internalcall: { fg: '#f0ea0d' attr: 'b' }
        shape_keyword: { fg: '#02e8fb' attr: 'b' }
        shape_list: { fg: '#9a81d9' attr: 'b' }
        shape_literal: '#883cdc'
        shape_match_pattern: '#2ab250'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#d94085'
        shape_operator: '#e90020'
        shape_or: { fg: '#ececec' attr: 'b' }
        shape_pipe: { fg: '#e6041e' attr: 'b' }
        shape_range: { fg: '#ffd16f' attr: 'b' }
        shape_raw_string: { fg: '#fc5982' attr: 'b' }
        shape_record: { fg: '#cb45ff' attr: 'b' }
        shape_redirection: { fg: '#ececec' attr: 'b' }
        shape_signature: { fg: '#2ab250' attr: 'b' }
        shape_string: '#2ab250'
        shape_string_interpolation: { fg: '#9a81d9' attr: 'b' }
        shape_table: { fg: '#883cdc' attr: 'b' }
        shape_vardecl: { fg: '#883cdc' attr: 'u' }
        shape_variable: '#e6041e'

        foreground: '#ffb7f8'
        background: '#000000'
        cursor: '#e90020'

        empty: '#883cdc'
        header: { fg: '#2ab250' attr: 'b' }
        hints: '#ffb7f8'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#2ab250' attr: 'b' }
        search_result: { fg: '#d94085' bg: '#fff8de' }
        separator: '#fff8de'
    }
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Update terminal colors
export def "update terminal" [] {
    let theme = (main)

    # Set terminal colors
    let osc_screen_foreground_color = '10;'
    let osc_screen_background_color = '11;'
    let osc_cursor_color = '12;'

    $"
    (ansi -o $osc_screen_foreground_color)($theme.foreground)(char bel)
    (ansi -o $osc_screen_background_color)($theme.background)(char bel)
    (ansi -o $osc_cursor_color)($theme.cursor)(char bel)
    "
    # Line breaks above are just for source readability
    # but create extra whitespace when activating. Collapse
    # to one line and print with no-newline
    | str replace --all "\n" ''
    | print -n $"($in)\r"
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate
