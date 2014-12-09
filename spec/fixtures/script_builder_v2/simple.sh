set -o pipefail

RED="\033[31m"
NORMAL="\033[0;39m"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export LC_ALL=en_US.UTF8
export DEBIAN_FRONTEND=noninteractive
export TERM=xterm

cd ~/

rm -rf ~/citool
git clone -q --depth=1 --branch=master https://github.com/vexor/vx-citool.git ~/citool || (
  rs=$?

  echo -e "${RED}The command 'git clone -q --depth=1 --branch=master https://github.com/vexor/vx-citool.git ~/citool' failed with code $rs${NORMAL}"

  exit $rs
)



echo LS0tCi0gbmFtZTogY2xvbmUKICB2YXJzOgogICAgc3NoX2tleTogfAogICAgICAtLS0tLUJFR0lOIFJTQSBQUklWQVRFIEtFWS0tLS0tCiAgICAgIE1JSUVwQUlCQUFLQ0FRRUFwTWthbSttaHdDZENRZHF0dTdVOXA1VlJGbWtyYmk5SGFBM3ZhZ3BoTXZ5cnlXcXgKICAgICAgQzlzWSthbjhqQ05SVXBlbHlqSjhmNmI2L1Y1aDRXY25sd3BPdlZHR25zNEhPYm5Zajg5R0tvQkYrUXBUMjhtcAogICAgICBDTWkwa3pITlNXTVJaZy9kOXgzQWYyY0RJZ0poZ0dLZEtMaE9iK1NKMmlSektBNnl3bXlOVHJVQjR0SmhwZ0ovCiAgICAgIFBBMWxHbFlYa0dhZDJLUkFmZzdtVGN1UXJxTEo0cWkyWGRnQUhjdElTTjl3VWRiRTF4NUhGUHl6dWt3S3VCQUUKICAgICAgaDdtNlZWckp6c2tLTnJCc3VPVlNadVE2cnY5VGlxV1hWcEFYZ3JXdkt6dGxmM1NOQXR0bUFCYjVkMnVQT2EyKwogICAgICByZUNXRXpIYldPRmdNUURRc1hzUzNycUMzZnp3NFZNS1JRd1hJUUlEQVFBQkFvSUJBRGdaT3BUUGtjQmYzUitjCiAgICAgIE9iOEljWWZtdm1jNXdJNVBUQ2p4YllzVkk0Zi9HdUNFRU9mdlcrNUszMjQ1NjhxSlUraWxEVnRMMW5DQlBDTkgKICAgICAgUWVRYW56bTJVblVud0svM1EvR1paOUs2UHBnTTJ3V2MvbzI5L2pPS0pkQVJDUEJOQUl6TE5TaHFRbGZHcGJqVwogICAgICBXWmh1UGsyN2FPNjVyL1o0SW9Vci9XTkpIZTVBa3Y1Rk1mc2VBWit6bEFIQTMyUXFOZ2dPZWl0NjVHaW8yY0l1CiAgICAgIFlES0k1TnIxaWlTcTNKTWZFWnZtYy81UWVkVTlVN0RJZU5Xd2ppOHBHekZrRjh4aHU2RXk5aHBHUjJVN2dFcVIKICAgICAgK2R5U253aTgrcWFzcG9mOHJndUdlU1VaVm1vVEdtZllVRW56MVpwSlZhUWlBQmthVlh3QURhaGh2ZTh0ZDFUcgogICAgICA3aDFiK1EwQ2dZRUExdkRwN09rbFd5dkZpZVBZdTRybG5talZLTnY2a2JVVUx0T2l4OXlLV2JBcFk2bGpwWWhTCiAgICAgIHlpZ2lxVjZqaVZvckMxQ2xjWFBXcFdzSG9zZCtwNkRSYWEwTWlxRDJXSlBTWG5kQ29tR1JzT3JDZU83RHJMV2wKICAgICAgVUNSSGwxT2xjUkhjdXhTcVZESCtDQ3FXK05DNEp4VUtjMjJPekkra2FLVHJ1ajNzOVhrZWZJTUNnWUVBeEVONgogICAgICBCN3hBTlk5Y2ViMVhvZXYzWjdBV0loTFBROEdQWjNLU1NtejFaZHAxMU1Ob3V4UkpCekRTNGs2NFF2Mm40NEpQCiAgICAgIFUra2JYU2p2bkN5SVRDalRldkRJc0t4SHRPMHdPTEV3QjVMQ0J6cEpURXNqd0daY1RQMEFPdjZkcXdKd0xQcG0KICAgICAgeXNpVHJMRkJINVNkVnNUTXQ4VUpGeFozM3NEV0hadlNvMHAyMUlzQ2dZQjY4OHJNazcyanZwRThSSkxwRFJZMgogICAgICBuSDg2NVVNYmNIc0FJbDRlZCtESVYwWUYxWkxEMFF5U3lZeXlXQW15ZTFyZUdSN2FuRW52ekI3TkZkTTByb0M4CiAgICAgIE01cFYvcWVNbWRxZjRSYkQ3bzQ1cHNEaURxcnVNK1pCeHM4UkdHOHVFK3F4TmF3Tmg1OXFLbnE4RUNFWGNpak4KICAgICAgU0tHRUVMTWFqU1N2SDlkWndCUVpZd0tCZ1FDY0JoaUk5YnNGMlVabThZTXRFbTNJWEUvOEhuL3ZHWDFyZThXWQogICAgICByUzRaSHFiMTBiTDhwbyszeTdTYWZJSTNuM2RNZ2xlV0dZYkxkTE9uc0M5YWZFcERQaEFOZzZndHlUSEFuL3ZTCiAgICAgIHlYUytValBiRnhFQTcxOEpSVWhkbmZTeDhtcERGMzJJVUJRMkFXUUlPeGtwMWFINXBnWW4rSkNxNFJwV3gzMlkKICAgICAgbXFZRktRS0JnUUNiRXN2WWxmZVdKRGkrQ0JIK3poZmtmV0lZOVNpeXVIRVVRYTRoTmJhUy9Ea0RNZ3FONThDdQogICAgICA4Z1hHU2Z0RWlUY0xhdDBhMFA2dmVhY2dQS3VoQUhlMUs3aDg0K1IwckUvY3YxUVRCcFczOFJRZ2FiTHMrZXh5CiAgICAgIGp5RjVSMU5ISS9MWHNEQk5haVIwNXNyWGRpU1p1bUwwYXdYN3JpQzREeklrNlpaWVJkYm5iUT09CiAgICAgIC0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCiAgdGFza3M6CiAgLSBzc2hfYWdlbnQ6CiAgICAgIGtleTogIiRzc2hfa2V5IgogIC0gZ2l0X2Nsb25lOgogICAgICByZXBvOiBnaXRAZ2l0aHViLmNvbTp2ZXhvci92eC10ZXN0LXJlcG8uZ2l0CiAgICAgIGRlc3Q6ICJ+L3ZleG9yL3Z4LXRlc3QtcmVwbyIKICAgICAgYnJhbmNoOiB0ZXN0L3B1bGwtcmVxdWVzdAogICAgICBzaGE6IDhmNTNjMDc3MDcyNjc0OTcyZTIxYzgyYTI4NmFjYzA3ZmFkYTkxZjUKLSBuYW1lOiBpbml0CiAgY2hkaXI6ICJ+L3ZleG9yL3Z4LXRlc3QtcmVwbyIKICBlbnZpcm9ubWVudDoKICAgIENJOiAnMScKICAgIENJX0pPQl9JRDogMQogICAgQ0lfSk9CX05VTUJFUjogMTAwCiAgICBDSV9CVUlMRF9JRDogMTIKICAgIENJX0JVSUxEX05VTUJFUjogMTAxCiAgICBDSV9QUk9KRUNUX05BTUU6IHZleG9yL3Z4LXRlc3QtcmVwbwogICAgQ0lfQlVJTERfU0hBOiA4ZjUzYzA3NzA3MjY3NDk3MmUyMWM4MmEyODZhY2MwN2ZhZGE5MWY1CiAgICBDSV9CUkFOQ0g6IHRlc3QvcHVsbC1yZXF1ZXN0CiAgICBESVNQTEFZOiAiOjk5IgogICAgQ0lfUEFSQUxMRUxfSk9CUzogMwogICAgQ0lfUEFSQUxMRUxfSk9CX05VTUJFUjogMAogICAgZ2xvYmFsOiAnJwogICAgbWF0cml4OiAnJwogICAgUkFJTFNfRU5WOiB0ZXN0CiAgICBSQUNLX0VOVjogdGVzdAogICAgR0VNX0hPTUU6ICJ+Ly5ydWJ5Z2VtcyIKICAgIFRSQVZJU19QWVRIT05fVkVSU0lPTjogcHlfdmVyc2lvbgogIHRhc2tzOgogIC0gc2VydmljZXM6CiAgICAtIHJhYmJpdG1xLXNlcnZlcgogIC0gY2FjaGVfZmV0Y2g6CiAgICAgIHVybDoKICAgICAgLSBodHRwOi8vbG9jYWxob3N0OjMwMDEvdGVzdC9wdWxsLXJlcXVlc3Qvc2NhbGEtMi4xMC4zLXJ2bS0yLjAuMC1nZW1maWxlLW5vZGVqcy0wLjEwLXJ1c3QtMC4xMS4wLXB5dGhvbi0yLjcudGd6CiAgICAgIC0gaHR0cDovL2xvY2FsaG9zdDozMDAxL21hc3Rlci9zY2FsYS0yLjEwLjMtcnZtLTIuMC4wLWdlbWZpbGUtbm9kZWpzLTAuMTAtcnVzdC0wLjExLjAtcHl0aG9uLTIuNy50Z3oKICAtIGNhY2hlX2FkZDoKICAgICAgZGlyOgogICAgICAtICJ+Ly5jYWNoZSIKICAgICAgLSAifi8uc2J0IgogICAgICAtICJ+Ly5pdnkyIgogICAgICAtICJ+Ly5ydWJ5Z2VtcyIKICAgICAgLSBub2RlX21vZHVsZXMKICAgICAgLSBib3dlcl9jb21wb25lbnRzCiAgICAgIC0gIn4vLnBpcC1kb3dubG9hZHMiCi0gbmFtZTogYmVmb3JlX2luc3RhbGwKICB0YXNrczoKICAtIHNoZWxsOiBlY2hvIGJlZm9yZV9pbnN0YWxsCi0gbmFtZTogaW5zdGFsbAogIGVudmlyb25tZW50OgogICAgUEFUSDogIiR7UEFUSH06JHtQV0R9L25vZGVfbW9kdWxlcy9iaW4iCiAgdGFza3M6CiAgLSBzY2FsYToKICAgICAgYWN0aW9uOiBpbnN0YWxsCiAgICAgIHNjYWxhOiAyLjEwLjMKICAtIHJ1Ynk6CiAgICAgIGFjdGlvbjogaW5zdGFsbAogICAgICBydWJ5OiAyLjAuMAogIC0gcnVieTogYW5ub3VuY2UKICAtIHZ4dm06IG5vZGVqcyAwLjEwCiAgLSBzaGVsbDogbnBtIGNvbmZpZyBzZXQgc3BpbiBmYWxzZQogIC0gc2hlbGw6IG5vZGUgLS12ZXJzaW9uCiAgLSBzaGVsbDogbnBtIC0tdmVyc2lvbgogIC0gdnh2bTogcnVzdCAwLjExLjAKICAtIHNoZWxsOiBydXN0YyAtLXZlcnNpb24KICAtIHB5dGhvbjoKICAgICAgYWN0aW9uOiBpbnN0YWxsCiAgICAgIHB5dGhvbjogJzIuNycKICAtIHB5dGhvbjogdmlydHVhbGVudgogIC0gcHl0aG9uOiBhbm5vdW5jZQogIC0gc2hlbGw6IGVjaG8gaW5zdGFsbAotIG5hbWU6IGRhdGFiYXNlCiAgdGFza3M6CiAgLSBydWJ5OiByYWlsczpkYXRhYmFzZQotIG5hbWU6IGJlZm9yZV9zY3JpcHQKICB0YXNrczoKICAtIHNoZWxsOiBlY2hvIGJlZm9yZV9zY3JpcHQKLSBuYW1lOiBzY3JpcHQKICB0YXNrczoKICAtIHNoZWxsOiBSQUlMU19FTlY9dGVzdCBscyAtMSAmJiBlY2hvIERPTkUhCi0gbmFtZTogYWZ0ZXJfc3VjY2VzcwogIHRhc2tzOgogIC0gc2hlbGw6IGVjaG8gYWZ0ZXIgc3VjY2VzcwotIG5hbWU6IHRlYXJkb3duCiAgdGFza3M6CiAgLSBjYWNoZV9wdXNoOgogICAgICB1cmw6IGh0dHA6Ly9sb2NhbGhvc3Q6MzAwMS90ZXN0L3B1bGwtcmVxdWVzdC9zY2FsYS0yLjEwLjMtcnZtLTIuMC4wLWdlbWZpbGUtbm9kZWpzLTAuMTAtcnVzdC0wLjExLjAtcHl0aG9uLTIuNy50Z3oK \
  | base64 --decode | ~/citool/bin/vx-citool -

exit $?
