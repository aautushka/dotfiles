# archive-protect

Creates a SHA-256 integrity manifest and PAR2 recovery set for a directory.
Designed for archival: the source directory is never modified.

## Dependencies

```
brew install par2
```

`sha256sum` or `shasum` (both ship with macOS/Linux).

## Usage

```sh
archive-protect <directory> [redundancy%]
```

```sh
archive-protect ~/archive/photos-2024        # 10% redundancy (default)
archive-protect ~/archive/photos-2024 20     # 20% redundancy
```

Output goes to `<dirname>.parset/` alongside the directory:

```
photos-2024/
photos-2024.parset/
  photos-2024.sha256        # SHA-256 manifest, one path per line
  photos-2024.par2          # PAR2 index
  photos-2024.vol000+N.par2 # PAR2 recovery blocks
  verify.sh                 # run from anywhere to check integrity
  repair.sh                 # run from anywhere to restore damaged files
```

## Verify integrity

```sh
photos-2024.parset/verify.sh
```

Runs the SHA-256 manifest check first (fast, detects any change), then PAR2
verification. Works from any path as long as `photos-2024/` and
`photos-2024.parset/` remain siblings.

## Repair damaged files

```sh
photos-2024.parset/repair.sh
```

PAR2 restores damaged or missing files in-place. Originals of damaged files
are saved as `<filename>.1` in the source directory. After a successful repair,
re-run `verify.sh` to confirm.

## Relocation

Move both sibling directories together and everything keeps working:

```sh
mv photos-2024 photos-2024.parset /new/location/
/new/location/photos-2024.parset/verify.sh   # still works
```

The `.parset/` scripts resolve paths from their own location at runtime.

## Redundancy guidance

| Redundancy | Recovers up to       | Recommended for              |
|------------|----------------------|------------------------------|
| 5%         | minor corruption     | low-risk, space-constrained  |
| 10%        | moderate corruption  | default, everyday archives   |
| 20–30%     | significant damage   | critical / long-term storage |
| 50%+       | half the data lost   | master copies, off-site cold |

PAR2 can only recover data up to the redundancy you set at creation time.
You cannot add more redundancy later without recreating the set.

## Constraints and caveats

- **Re-running** overwrites the existing `.parset/` without warning. If you
  need to update after adding files, just re-run the command.
- **After repair**, PAR2 writes into the source directory (the `.1` backup
  files). If the directory has strict write protection, repair will fail.
- **The `.parset/` itself is unprotected.** Storing it on the same physical
  medium as the archive only helps against accidental corruption — not drive
  failure. For disaster recovery, keep a copy of `.parset/` on a separate
  medium or in the cloud.
- **par2 file path limit**: all file paths (relative to the parent directory)
  must stay the same for verify/repair to match. Renaming files inside the
  archive invalidates the set.

## Test

```sh
bin/test-archive-protect
```

Full end-to-end: creates a fixture, protects it, relocates both dirs, corrupts
a file, verifies detection, repairs, and confirms the restored file is
byte-for-byte identical to the original.
