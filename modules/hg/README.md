Mercurial
===

Enhances the [Mercurial][1] distributed version control system by providing aliases,
functions and by exposing repository status information to prompts.

### Status

Functions
---------

  - `hg-info` exposes repository information via the `$hg_info` associative
    array.

Theming
-------

To display information about the current repository in a prompt, define the
following styles in the `prompt_name_setup` function, where the syntax for
setting a style is as follows.

```sh
zstyle ':prezto:module:hg:info:context:subcontext' format 'string'
```

### Main Contexts

| Name      | Format Code | Description
| --------- | :---------: | ---------------------------------------------------
| action    |     %s      | Special action name (merge)
| branch    |     %b      | Branch name
| commit    |     %c      | Commit hash

### Concise Contexts

| Name      | Format Code | Description
| --------- | :---------: | ---------------------------------------------------
| clean     |     %C      | Clean state
| dirty     |     %D      | Dirty files count
| untracked |     %u      | Untracked files count
| resolved  |     %R      | Resolved files count
| unresolved|     %U      | Unresolved files count
| added     |     %a      | Added files count
| clean     |     %C      | Clean state
| deleted   |     %d      | Deleted files count
| dirty     |     %D      | Dirty files count
| modified  |     %m      | Modified files count
| renamed   |     %r      | Renamed files count
| untracked |     %u      | Untracked files count
| stashed   |     %S      | Stashed states count


First, format the repository state attributes. For example, to format the branch
and remote names, define the following styles.

```sh
zstyle ':prezto:module:hg:info:branch' format 'branch:%b'
zstyle ':prezto:module:hg:info:remote' format 'remote:%R'
```

Second, format how the above attributes are displayed in prompts.

```sh
zstyle ':prezto:module:hg:info:keys' format \
  'prompt'  ' hg(%b)' \
  'rprompt' '[%R]'
```

Last, add `$hg_info[prompt]` to `$PROMPT` and `$hg_info[rprompt]` to
`$RPROMPT` respectively and call `hg-info` in the `prompt_name_preexec` hook
function.
