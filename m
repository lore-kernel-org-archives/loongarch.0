Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4EC2BD5A7
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 22:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767133238; cv=none; b=f74VPqF3yTIVyimf3D9qQ4l9xRNN8vq6tTZo74jpYlT9aEKRSpTxx56/a2uhYkbYeAVzgA0uGXSwLDXqSSnWM2KfZuqgBu+F97byXDLmFZlUERcTT3dWlDEf8cJxJ0YEdGJ1QjCFaGTLGNJ26uTgL3k5YfbxxdZ/zAmO7ikdbp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767133238; c=relaxed/simple;
	bh=aG9PLgg82U6P9AM4BOkscJSic0V0CYVFeXctYaE5/f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=IelpvsdLZx9ZxCiQ1cvSviDmjdakrX5J0lhYRG62hvc83WksgDF9IxNAMAs/+57mj4DYFNh4KlvZKmlOc1tDe9/A4VNWQ1MfdsUlUX6FTJDMRBoCnyFHf8cAdKT0oTeHy7Ji3FJ1af6Kx2WqCTG4jnc7IIxRcn/HkXhJelMlFys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSCzXjk6; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSCzXjk6"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4eda26a04bfso135860661cf.2
        for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 14:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767133235; x=1767738035; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMRgnb5H/P8RRDQkjwS/Xs5OiM+E3ejxN3iOpQlwRC8=;
        b=cSCzXjk6zgfNYLdxlYCxF8V+O/G4QyPplBmCmggj0ud7kLH0G1ivCgmVRK2OjAzp1w
         b7plSDcnv3AHt5rDyfuSDtT6wgid9E5eZQsITryurjEohc+fIabmk789D+6KVuI1ahfj
         17BGXZcr/WrT/xHpyFYFgNVN2N3t9z3rxfGzFHVzOcOJ+zn8Zb7g5a0FleVVS9ivBD1i
         k8S1IUSoVGdeIV4tVPGUIHC96YdFGfTLeG5Mk1FmI1X+6gPQQ4Qdgt0cu2R2EArt7v5E
         xeUVpSretlhcwSiUdlMPiahCpQHmNF5n70i88AZ+YEPDxEMu8ZKQtsVBUQMT6VIMPj3w
         iToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767133235; x=1767738035;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iMRgnb5H/P8RRDQkjwS/Xs5OiM+E3ejxN3iOpQlwRC8=;
        b=DWl4+NTdzc0s/pf+gt6QZeNOl0bXLptNbk9MP2cwXrOj+Spwl8hrVvLR71mY3IF8jy
         qnde1kbdt7ER8Vw3Gn7DsUiyeJCSgia8tcz7w5KSOfLMjATAHf6gwLsMClNPNEVQn9Lk
         RS+ipv0j6CGy3kSDAKcG9AtNDiWxzGnnSoGtk0oIxYXaIUPy9I14vbcckxugx5Lt2LNy
         tJrxTZ5ebkDWlPm7SKim74s+raTovxYHR6PzzJidcWoOcUHztF0Dan1nSrT5WEPLe2hR
         KtuADSUuozpmFLqkrt2XBpSlAhMHR149hjZPd2k99ASiqf/AtwTzEgqjMkS29T1TjGOT
         +qug==
X-Forwarded-Encrypted: i=1; AJvYcCUcYcYw6Wxd4VYD3wofcmjGD9QfB04pn4VnzxLPRxWik1wVxtefo9Qi3ycCQm4v141+73SymZtTMWM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6A/dZE4foGsFx8LazNESnqwjiImIcatf5BWNSxdD5KRbOsY7/
	Ex/jNkSCCMYXJ4y3uaflUpy8XZ57cie5Rnc7poxd3oOSDiu/0+ie5td5IQEZ2FiHTQ9NWcQrXAm
	kGpjSBcu7ANPE0Hpx+0ofS0IbpeJP/gwlXNtm
X-Gm-Gg: AY/fxX5XscCLubW+39k+bwMJr+IbhqLD9ZsBwCDfvdvc75S/MEq2DqLTNqVE8tjXYTL
	RlCphqdi2J5sV/4dBKw/LBr8iaWsstgtKbdScgAkal/V2PiYUjhc5Grglcv9g7JbprSva2q9WLM
	d1Razpoo1hCyvC/ZEF7Hi+D6v1pWX0gvbNfSYiCdegztXN5P+7ZJlMTS6SXCEA8Obt/ZDOunm4B
	pqt534zKiAULYvftvvC+t2vGfpDiFmUIxEeiGS9rQjFp46rsxDlVH8Av6P5JeGSI3RnKnJBLktK
	UAHBVQ==
X-Google-Smtp-Source: AGHT+IEDLAwTWF1Ac7qhXFhPfWeacx6vYM7Cr36OrFeZ9WenHm5Hz+tA2giZpWw1fjBlE9nIFjU7dzZLwpkPWLev6J4=
X-Received: by 2002:a05:622a:4:b0:4ed:8fa:6fc4 with SMTP id
 d75a77b69052e-4f4abdc91b7mr514981991cf.78.1767133234683; Tue, 30 Dec 2025
 14:20:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2xa4imA5hmQnrnfXt3ek1Rag89sL8mO9aGYjZWtZ3ckfw@mail.gmail.com>
In-Reply-To: <CAK3+h2xa4imA5hmQnrnfXt3ek1Rag89sL8mO9aGYjZWtZ3ckfw@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Tue, 30 Dec 2025 14:20:23 -0800
X-Gm-Features: AQt7F2q6MPQhtp1ihIcUG8rQev7cE6jI7dKiqzmMMw7Q7myZul6FeEOIDKKs5XQ
Message-ID: <CAK3+h2zJk7V-VNA9cG4C1BX02Dphyt_XXN8i_ERLAQbmJn++JQ@mail.gmail.com>
Subject: Re: x86 bpf selftests report for reference
To: Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Chenghao Duan <duanchenghao@kylinos.cn>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 1:27=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> Hi Huacai,
>
> I did a manual full bpf selftests on x86 machine, no ns_bpf_qdisc
> failure, so indeed like you said, it seems loongarch bpf is
> deteriorating. Here is x86 failed bpf test report for reference, there
> is no hang up or anything like that during the test.
>
After testing 6.16, 6.17, 6.18-rc1, I am not sure about the loongarch
bpf deteriorating any more :)

Test results:
6.16 ns_bpf_qdisc not supported
6.17 some patches enabled ns_bpf_qdisc support, but ns_bpf_qdisc panic
6.18-rc1 ns_bpf_qdisc panic fix commit merged (8b51b11), ns_bpf_qdisc
mq test failed with WATCHDOG messaging on the screen.

test steps:

for x where x is 16, 17, 18-rc1 (new branch may have new bpf config
added, if compiling error related to config, run
./scripts/kconfig/merge_config.sh .config
tools/testing/selftests/bpf/config)
git checkout -b v6.x v6.x
make clean; make -j8; make modules_install; make install
grub2-mkconfig -o /boot/grub2/grub.cfg,  then manually edit grub.cfg
to put v6.x to be the first boot entry
reboot
Go to branch 6.x tools/testing/selftests/bpf
make clean; make -j8
./test_progs -t ns_bpf_qdisc

test screen shot:

[root@fedora bpf]# uname -a

Linux fedora 6.16.0 #6 SMP PREEMPT_DYNAMIC Tue Dec 30 11:42:24 PST
2025 loongarch64 GNU/Linux

[root@fedora bpf]#

[root@fedora bpf]# ./test_progs -t ns_bpf_qdisc

test_fifo:PASS:bpf_qdisc_fifo__open_and_load 0 nsec

libbpf: map 'fifo': failed to auto-attach: -ENOTSUPP

test_fifo:FAIL:bpf_qdisc_fifo__attach unexpected error: -524 (errno 524)

#210/1   ns_bpf_qdisc/fifo:FAIL

test_fq:PASS:bpf_qdisc_fq__open_and_load 0 nsec

libbpf: map 'fq': failed to auto-attach: -ENOTSUPP

test_fq:FAIL:bpf_qdisc_fq__attach unexpected error: -524 (errno 524)

#210/2   ns_bpf_qdisc/fq:FAIL

test_qdisc_attach_to_mq:PASS:bpf_qdisc_fifo__open_and_load 0 nsec

libbpf: map 'fifo': failed to auto-attach: -ENOTSUPP

test_qdisc_attach_to_mq:FAIL:bpf_qdisc_fifo__attach unexpected error:
-524 (errno 524)

#210/3   ns_bpf_qdisc/attach to mq:FAIL

test_qdisc_attach_to_non_root:PASS:bpf_qdisc_fifo__open_and_load 0 nsec

libbpf: map 'fifo': failed to auto-attach: -ENOTSUPP

test_qdisc_attach_to_non_root:FAIL:bpf_qdisc_fifo__attach unexpected
error: -524 (errno 524)

#210/4   ns_bpf_qdisc/attach to non root:FAIL

#210/5   ns_bpf_qdisc/incompl_ops:OK

#210     ns_bpf_qdisc:FAIL


All error logs:

test_fifo:PASS:bpf_qdisc_fifo__open_and_load 0 nsec

libbpf: map 'fifo': failed to auto-attach: -ENOTSUPP

test_fifo:FAIL:bpf_qdisc_fifo__attach unexpected error: -524 (errno 524)

#210/1   ns_bpf_qdisc/fifo:FAIL

test_fq:PASS:bpf_qdisc_fq__open_and_load 0 nsec

libbpf: map 'fq': failed to auto-attach: -ENOTSUPP

test_fq:FAIL:bpf_qdisc_fq__attach unexpected error: -524 (errno 524)

#210/2   ns_bpf_qdisc/fq:FAIL

test_qdisc_attach_to_mq:PASS:bpf_qdisc_fifo__open_and_load 0 nsec

libbpf: map 'fifo': failed to auto-attach: -ENOTSUPP

test_qdisc_attach_to_mq:FAIL:bpf_qdisc_fifo__attach unexpected error:
-524 (errno 524)

#210/3   ns_bpf_qdisc/attach to mq:FAIL

test_qdisc_attach_to_non_root:PASS:bpf_qdisc_fifo__open_and_load 0 nsec

libbpf: map 'fifo': failed to auto-attach: -ENOTSUPP

test_qdisc_attach_to_non_root:FAIL:bpf_qdisc_fifo__attach unexpected
error: -524 (errno 524)

#210/4   ns_bpf_qdisc/attach to non root:FAIL

#210     ns_bpf_qdisc:FAIL

Summary: 0/1 PASSED, 0 SKIPPED, 1 FAILED


[[root@fedora bpf]#

[root@fedora bpf]# uname -a

Linux fedora 6.17.0 #7 SMP PREEMPT_DYNAMIC Tue Dec 30 12:57:55 PST
2025 loongarch64 GNU/Linux

[root@fedora bpf]#


[root@fedora bpf]# ./test_progs -t ns_bpf_qdisc

Read from remote host 10.0.0.15: Operation timed out

Connection to 10.0.0.15 closed.

client_loop: send disconnect: Broken pipe

[root@fedora bpf]# uname -a

Linux fedora 6.18.0-rc1 #8 SMP PREEMPT_DYNAMIC Tue Dec 30 13:47:34 PST
2025 loongarch64 GNU/Linux



[root@fedora bpf]# ./test_progs -t ns_bpf_qdisc


libbpf: loading object 'tc_bpf' from buffer

libbpf: elf: section(2) .symtab, size 168, link 1, flags 0, type=3D2

libbpf: elf: section(3) tc, size 144, link 0, flags 6, type=3D1

libbpf: sec 'tc': found program 'tc_ingress' at insn offset 0 (0
bytes), code size 18 insns (144 bytes)

libbpf: elf: section(4) .rodata, size 36, link 0, flags 2, type=3D1

libbpf: elf: section(5) license, size 4, link 0, flags 3, type=3D1

libbpf: license of tc_bpf is GPL

libbpf: elf: section(6) .reltc, size 16, link 2, flags 40, type=3D9

libbpf: elf: section(7) .BTF, size 2108, link 0, flags 0, type=3D1

libbpf: elf: section(8) .BTF.ext, size 284, link 0, flags 0, type=3D1

libbpf: looking for externs among 7 symbols...

libbpf: collected 0 externs total

libbpf: map 'tc_bpf.rodata' (global data): at sec_idx 4, offset 0, flags 80=
.

libbpf: map 0 is "tc_bpf.rodata"

libbpf: sec '.reltc': collecting relocation for section(3) 'tc'

libbpf: sec '.reltc': relo #0: insn #12 against '.rodata'

libbpf: prog 'tc_ingress': found data map 0 (tc_bpf.rodata, sec 4, off
0) for insn 12

libbpf: object 'tc_bpf': failed (-95) to create BPF token from
'/sys/fs/bpf', skipping optional step...

libbpf: loaded kernel BTF from '/sys/kernel/btf/vmlinux'

libbpf: sec 'tc': found 5 CO-RE relocations

libbpf: CO-RE relocating [2] struct __sk_buff: found target candidate
[10506] struct __sk_buff in [vmlinux]

libbpf: prog 'tc_ingress': relo #0: <byte_off> [2] struct
__sk_buff.protocol (0:4 @ offset 16)

libbpf: prog 'tc_ingress': relo #0: matching candidate #0 <byte_off>
[10506] struct __sk_buff.protocol (0:4 @ offset 16)

libbpf: prog 'tc_ingress': relo #0: patched insn #0 (LDX/ST/STX) off 16 -> =
16

libbpf: prog 'tc_ingress': relo #1: <byte_off> [2] struct
__sk_buff.data (0:15 @ offset 76)

libbpf: prog 'tc_ingress': relo #1: matching candidate #0 <byte_off>
[10506] struct __sk_buff.data (0:15 @ offset 76)

libbpf: prog 'tc_ingress': relo #1: patched insn #2 (LDX/ST/STX) off 76 -> =
76

libbpf: prog 'tc_ingress': relo #2: <byte_off> [2] struct
__sk_buff.data_end (0:16 @ offset 80)

libbpf: prog 'tc_ingress': relo #2: matching candidate #0 <byte_off>
[10506] struct __sk_buff.data_end (0:16 @ offset 80)

libbpf: prog 'tc_ingress': relo #2: patched insn #3 (LDX/ST/STX) off 80 -> =
80

libbpf: CO-RE relocating [19] struct iphdr: found target candidate
[28470] struct iphdr in [vmlinux]

libbpf: prog 'tc_ingress': relo #3: <byte_off> [19] struct iphdr.ttl
(0:6 @ offset 8)

libbpf: prog 'tc_ingress': relo #3: matching candidate #0 <byte_off>
[28470] struct iphdr.ttl (0:6 @ offset 8)

libbpf: prog 'tc_ingress': relo #3: patched insn #9 (LDX/ST/STX) off 8 -> 8

libbpf: prog 'tc_ingress': relo #4: <byte_off> [19] struct
iphdr.tot_len (0:3 @ offset 2)

libbpf: prog 'tc_ingress': relo #4: matching candidate #0 <byte_off>
[28470] struct iphdr.tot_len (0:3 @ offset 2)

libbpf: prog 'tc_ingress': relo #4: patched insn #10 (LDX/ST/STX) off 2 -> =
2

libbpf: map 'tc_bpf.rodata': created successfully, fd=3D5

Successfully started! Please run `sudo cat
/sys/kernel/debug/tracing/trace_pipe` to see output of the BPF
program.

..........WATCHDOG: test case ns_bpf_qdisc/attach to mq executes for
10 seconds...

...........................................................................=
...................................WATCHDOG:
test case ns_bpf_qdisc/attach to mq executes for 120 seconds,
terminating with SIGSEGV

#214     ns_bpf_qdisc:FAIL

Caught signal #11!

Stack trace:

./test_progs(crash_handler+0x28)[0x120594cc4]

linux-vdso.so.1(__vdso_rt_sigreturn+0x0)[0x7ffffd385084]

/lib64/libc.so.6(wait4+0x84)[0x7ffff2e98b98]

/lib64/libc.so.6(+0x4da54)[0x7ffff2e09a54]

./test_progs[0x120195024]

./test_progs(test_ns_bpf_qdisc+0x58)[0x120196874]

./test_progs[0x120595404]

./test_progs(main+0x6c0)[0x120597488]

/lib64/libc.so.6(+0x2882c)[0x7ffff2de482c]

/lib64/libc.so.6(__libc_start_main+0xa8)[0x7ffff2de4918]

./test_progs(_start+0x48)[0x12013a0a0]

..........................


.^C#214/1   ns_bpf_qdisc/fifo:OK

#214/2   ns_bpf_qdisc/fq:OK

test_qdisc_attach_to_mq:PASS:bpf_qdisc_fifo__open_and_load 0 nsec

test_qdisc_attach_to_mq:PASS:bpf_qdisc_fifo__attach 0 nsec

test_qdisc_attach_to_mq:PASS:ip link add veth0 type veth peer veth1 0 nsec

#214/3   ns_bpf_qdisc/attach to mq:FAIL

#214/4   ns_bpf_qdisc/attach to non root:OK

#214/5   ns_bpf_qdisc/incompl_ops:OK

#214     ns_bpf_qdisc:FAIL


All error logs:

test_qdisc_attach_to_mq:PASS:bpf_qdisc_fifo__open_and_load 0 nsec

test_qdisc_attach_to_mq:PASS:bpf_qdisc_fifo__attach 0 nsec

test_qdisc_attach_to_mq:PASS:ip link add veth0 type veth peer veth1 0 nsec

#214/3   ns_bpf_qdisc/attach to mq:FAIL

#214     ns_bpf_qdisc:FAIL

Summary: 0/4 PASSED, 0 SKIPPED, 1 FAILED


> root@r210:/mnt/sdb1/linux/tools/testing/selftests/bpf#test_progs
> --json-summary=3D"./bpf_selftests.json"
>
> root@r210:/mnt/sdb1/linux/tools/testing/selftests/bpf#cat
> bpf_selftests.json | jq . | grep -B4 '"failed": true'  | grep -v
> '"message":'
>     {
>       "name": "bpf_cookie",
>       "number": 19,
>       "failed": true,
> --
>         {
>           "name": "lsm",
>           "number": 9,
>           "failed": true
> --
>     {
>       "name": "cgroup1_hierarchy",
>       "number": 52,
>       "failed": true,
> --
>         {
>           "name": "test_cgroup1_hierarchy",
>           "number": 1,
>           "failed": true
> --
>         {
>           "name": "test_invalid_level",
>           "number": 3,
>           "failed": true
> --
>         {
>           "name": "test_invalid_cgid",
>           "number": 4,
>           "failed": true
> --
>         {
>           "name": "test_invalid_hid",
>           "number": 5,
>           "failed": true
> --
>         {
>           "name": "test_invalid_cgrp_name",
>           "number": 6,
>           "failed": true
> --
>         {
>           "name": "test_invalid_cgrp_name2",
>           "number": 7,
>           "failed": true
> --
>     {
>       "name": "cgroup_tcp_skb",
>       "number": 69,
>       "failed": true,
> --
>     {
>       "name": "cgroup_xattr",
>       "number": 71,
>       "failed": true,
> --
>         {
>           "name": "read_cgroupfs_xattr",
>           "number": 8,
>           "failed": true
> --
>     {
>       "name": "deny_namespace",
>       "number": 96,
>       "failed": true,
> --
>         {
>           "name": "userns_create_bpf",
>           "number": 2,
>           "failed": true
> --
>     {
>       "name": "exceptions",
>       "number": 104,
>       "failed": true,
> --
>         {
>           "name": "reject_exception_cb_type_1",
>           "number": 1,
>           "failed": true
> --
>         {
>           "name": "reject_exception_cb_type_2",
>           "number": 2,
>           "failed": true
> --
>         {
>           "name": "reject_exception_cb_type_3",
>           "number": 3,
>           "failed": true
> --
>         {
>           "name": "reject_exception_cb_type_4",
>           "number": 4,
>           "failed": true
> --
>         {
>           "name": "reject_async_callback_throw",
>           "number": 5,
>           "failed": true
> --
>         {
>           "name": "reject_with_rcu_read_lock",
>           "number": 8,
>           "failed": true
> --
>         {
>           "name": "reject_subprog_with_rcu_read_lock",
>           "number": 9,
>           "failed": true
> --
>         {
>           "name": "reject_with_reference",
>           "number": 11,
>           "failed": true
> --
>         {
>           "name": "reject_with_cb_reference",
>           "number": 12,
>           "failed": true
> --
>         {
>           "name": "reject_with_cb",
>           "number": 13,
>           "failed": true
> --
>         {
>           "name": "reject_with_subprog_reference",
>           "number": 14,
>           "failed": true
> --
>         {
>           "name": "reject_throwing_exception_cb",
>           "number": 15,
>           "failed": true
> --
>         {
>           "name": "reject_exception_throw_cb",
>           "number": 19,
>           "failed": true
> --
>         {
>           "name": "reject_exception_throw_cb_diff",
>           "number": 20,
>           "failed": true
> --
>         {
>           "name": "reject_set_exception_cb_bad_ret2",
>           "number": 22,
>           "failed": true
> --
>         {
>           "name": "check_assert_eq_int_min",
>           "number": 23,
>           "failed": true
> --
>         {
>           "name": "check_assert_eq_int_max",
>           "number": 24,
>           "failed": true
> --
>         {
>           "name": "check_assert_eq_zero",
>           "number": 25,
>           "failed": true
> --
>         {
>           "name": "check_assert_eq_llong_min",
>           "number": 26,
>           "failed": true
> --
>         {
>           "name": "check_assert_eq_llong_max",
>           "number": 27,
>           "failed": true
> --
>         {
>           "name": "check_assert_lt_pos",
>           "number": 28,
>           "failed": true
> --
>         {
>           "name": "check_assert_lt_zero",
>           "number": 29,
>           "failed": true
> --
>         {
>           "name": "check_assert_lt_neg",
>           "number": 30,
>           "failed": true
> --
>         {
>           "name": "check_assert_le_pos",
>           "number": 31,
>           "failed": true
> --
>         {
>           "name": "check_assert_le_zero",
>           "number": 32,
>           "failed": true
> --
>         {
>           "name": "check_assert_le_neg",
>           "number": 33,
>           "failed": true
> --
>         {
>           "name": "check_assert_gt_pos",
>           "number": 34,
>           "failed": true
> --
>         {
>           "name": "check_assert_gt_zero",
>           "number": 35,
>           "failed": true
> --
>         {
>           "name": "check_assert_gt_neg",
>           "number": 36,
>           "failed": true
> --
>         {
>           "name": "check_assert_ge_pos",
>           "number": 37,
>           "failed": true
> --
>         {
>           "name": "check_assert_ge_zero",
>           "number": 38,
>           "failed": true
> --
>         {
>           "name": "check_assert_ge_neg",
>           "number": 39,
>           "failed": true
> --
>         {
>           "name": "check_assert_range_s64",
>           "number": 40,
>           "failed": true
> --
>         {
>           "name": "check_assert_range_u64",
>           "number": 41,
>           "failed": true
> --
>         {
>           "name": "check_assert_single_range_s64",
>           "number": 42,
>           "failed": true
> --
>         {
>           "name": "check_assert_single_range_u64",
>           "number": 43,
>           "failed": true
> --
>         {
>           "name": "check_assert_generic",
>           "number": 44,
>           "failed": true
> --
>         {
>           "name": "check_assert_with_return",
>           "number": 45,
>           "failed": true
> --
>     {
>       "name": "fexit_stress",
>       "number": 115,
>       "failed": true,
> --
>     {
>       "name": "file_reader",
>       "number": 118,
>       "failed": true,
> --
>         {
>           "name": "on_open_expect_fault",
>           "number": 1,
>           "failed": true
> --
>         {
>           "name": "on_open_validate_file_read",
>           "number": 2,
>           "failed": true
> --
>     {
>       "name": "fs_kfuncs",
>       "number": 130,
>       "failed": true,
> --
>         {
>           "name": "user_xattr",
>           "number": 1,
>           "failed": true
> --
>         {
>           "name": "security_bpf_xattr",
>           "number": 2,
>           "failed": true
> --
>         {
>           "name": "set_remove_xattr",
>           "number": 5,
>           "failed": true
> --
>     {
>       "name": "get_branch_snapshot",
>       "number": 131,
>       "failed": true,
> --
>     {
>       "name": "iters",
>       "number": 148,
>       "failed": true,
> --
>         {
>           "name": "css_task",
>           "number": 85,
>           "failed": true
> --
>     {
>       "name": "kernel_flag",
>       "number": 151,
>       "failed": true,
> --
>     {
>       "name": "kfunc_dynptr_param",
>       "number": 154,
>       "failed": true,
> --
>         {
>           "name": "dynptr_data_null",
>           "number": 1,
>           "failed": true
> --
>     {
>       "name": "libbpf_get_fd_by_id_opts",
>       "number": 168,
>       "failed": true,
> --
>     {
>       "name": "lookup_key",
>       "number": 185,
>       "failed": true,
> --
>     {
>       "name": "lsm_cgroup",
>       "number": 187,
>       "failed": true,
> --
>         {
>           "name": "functional",
>           "number": 1,
>           "failed": true
> --
>     {
>       "name": "migrate_reuseport",
>       "number": 206,
>       "failed": true,
> --
>         {
>           "name": "IPv4 TCP_SYN_RECV     inet_csk_listen_stop",
>           "number": 2,
>           "failed": true
> --
>         {
>           "name": "IPv4 TCP_NEW_SYN_RECV reqsk_timer_handler",
>           "number": 3,
>           "failed": true
> --
>         {
>           "name": "IPv4 TCP_NEW_SYN_RECV inet_csk_complete_hashdance",
>           "number": 4,
>           "failed": true
> --
>         {
>           "name": "IPv6 TCP_SYN_RECV     inet_csk_listen_stop",
>           "number": 6,
>           "failed": true
> --
>         {
>           "name": "IPv6 TCP_NEW_SYN_RECV reqsk_timer_handler",
>           "number": 7,
>           "failed": true
> --
>         {
>           "name": "IPv6 TCP_NEW_SYN_RECV inet_csk_complete_hashdance",
>           "number": 8,
>           "failed": true
> --
>     {
>       "name": "ptr_untrusted",
>       "number": 284,
>       "failed": true,
> --
>     {
>       "name": "res_spin_lock_failure",
>       "number": 369,
>       "failed": true,
> --
>         {
>           "name": "res_spin_lock_var_off",
>           "number": 12,
>           "failed": true
> --
>     {
>       "name": "send_signal",
>       "number": 376,
>       "failed": true,
> --
>         {
>           "name": "send_signal_perf",
>           "number": 2,
>           "failed": true
> --
>         {
>           "name": "send_signal_nmi",
>           "number": 3,
>           "failed": true
> --
>         {
>           "name": "send_signal_perf_thread",
>           "number": 5,
>           "failed": true
> --
>         {
>           "name": "send_signal_nmi_thread",
>           "number": 6,
>           "failed": true
> --
>         {
>           "name": "send_signal_perf_remote",
>           "number": 8,
>           "failed": true
> --
>         {
>           "name": "send_signal_nmi_remote",
>           "number": 9,
>           "failed": true
> --
>         {
>           "name": "send_signal_perf_thread_remote",
>           "number": 11,
>           "failed": true
> --
>         {
>           "name": "send_signal_nmi_thread_remote",
>           "number": 12,
>           "failed": true
> --
>     {
>       "name": "setget_sockopt",
>       "number": 378,
>       "failed": true,
> --
>     {
>       "name": "sk_assign",
>       "number": 381,
>       "failed": true,
> --
>     {
>       "name": "sockmap_basic",
>       "number": 399,
>       "failed": true,
> --
>         {
>           "name": "sockmap vsock delete on close",
>           "number": 3,
>           "failed": true
> --
>         {
>           "name": "sockmap skb_verdict vsock poll",
>           "number": 29,
>           "failed": true
> --
>     {
>       "name": "sockmap_listen",
>       "number": 401,
>       "failed": true,
> --
>         {
>           "name": "sockmap IPv4 TCP test_reuseport_select_listening",
>           "number": 33,
>           "failed": true
> --
>         {
>           "name": "sockmap IPv6 TCP test_reuseport_select_listening",
>           "number": 71,
>           "failed": true
> --
>         {
>           "name": "sockhash IPv4 TCP test_reuseport_select_listening",
>           "number": 109,
>           "failed": true
> --
>         {
>           "name": "sockhash IPv6 TCP test_reuseport_select_listening",
>           "number": 147,
>           "failed": true
> --
>     {
>       "name": "sockmap_redir",
>       "number": 402,
>       "failed": true,
> --
>     {
>       "name": "stream_success",
>       "number": 422,
>       "failed": true,
> --
>         {
>           "name": "stream_cond_break",
>           "number": 2,
>           "failed": true
> --
>         {
>           "name": "stream_deadlock",
>           "number": 3,
>           "failed": true
> --
>     {
>       "name": "tcpbpf_user",
>       "number": 460,
>       "failed": true,
> --
>     {
>       "name": "test_bpffs",
>       "number": 467,
>       "failed": true,
> --
>     {
>       "name": "test_bprm_opts",
>       "number": 469,
>       "failed": true,
> --
>     {
>       "name": "test_ima",
>       "number": 472,
>       "failed": true,
> --
>     {
>       "name": "test_local_storage",
>       "number": 473,
>       "failed": true,
> --
>     {
>       "name": "test_lsm",
>       "number": 474,
>       "failed": true,
> --
>         {
>           "name": "lsm_basic",
>           "number": 1,
>           "failed": true
> --
>     {
>       "name": "token",
>       "number": 485,
>       "failed": true,
> --
>         {
>           "name": "obj_priv_prog",
>           "number": 5,
>           "failed": true
> --
>     {
>       "name": "unpriv_bpf_disabled",
>       "number": 498,
>       "failed": true,
> --
>     {
>       "name": "verifier_private_stack",
>       "number": 576,
>       "failed": true,
> --
>         {
>           "name": "Private stack, exception in main prog",
>           "number": 5,
>           "failed": true
> --
>         {
>           "name": "Private stack, exception in subprog",
>           "number": 6,
>           "failed": true
> --
>     {
>       "name": "verif_scale_pyperf600",
>       "number": 625,
>       "failed": true,
> --
>     {
>       "name": "verify_pkcs7_sig",
>       "number": 642,
>       "failed": true,
> --
>         {
>           "name": "pkcs7_sig_from_map",
>           "number": 1,
>           "failed": true
> --
>         {
>           "name": "pkcs7_sig_fsverity",
>           "number": 2,
>           "failed": true
