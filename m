Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A8224D6
	for <loongarch@lists.linux.dev>; Fri,  1 Aug 2025 02:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754013653; cv=none; b=Pih3/xBd46scl+ih6jKxGq7qrLyEqwTcdVKki7ehZbKawTZG1gjHObvRtZzjwV5dh8nseANF8vfTxkjktYQNWgyfkxG/7kqs4Kprz29P+pv5bANhQQHMlzIzvZw+2rtHSclNrNQcLbDTIInJvuPISTIj9vFXAVYim8YQmgPpu4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754013653; c=relaxed/simple;
	bh=IdoEn+Ajikie+hvuujEeHYl3fgChl6VHVhK8CF28nXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHs/MI2zs3fXNHgD/YyUDz/VRK0RNVszuHSX7k4bCFk5+hcu0ELoZjXL4TRdQ91DhYCB81fFZWcpyBKXIYTC0c/dERpoOMD2rd5bz0etg8p7FSzY9+QtpZp6N89D+bDUYtZqWEtiEUNTr1C+iDoxECS+cfwdP/P5fKR0t+CpKuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4BVlRLE; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4BVlRLE"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ab8e2c85d7so14188191cf.2
        for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 19:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754013650; x=1754618450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWYgZYH+W+Rl6GzXS8D+Tbb94feQh0UiIoXVOsQONwc=;
        b=V4BVlRLE8pf1R4flnKbrzKTjzx2vjPWrUQaXeFEVqlZE/D1y9sUnpvmPmWk/yV/H92
         EvGqKQkbCbVnJvJipdS3pVUEzgkoMclJ6rIsZR2/RGauvY7qk4dFTGu+2bch7EBxAO4c
         0bde8u5eezwXXsK64CLgf8SQXO6g1TkL89+VOkRMjoVgqRvgBoEUHzsnemkOJmFWp5I7
         OjK7rqwUpAPsZpSh/3PSlRCALb+kh9rNH6Vmim/clWtDcjWus6k+Qv2IwN3ApUoOstvJ
         hN7M4IKG31gsIhb0Y0TajV2V0EosGugP50W3yuqcXEipKI1moNEOSZnliTbM2F3tXFRw
         8oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754013650; x=1754618450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWYgZYH+W+Rl6GzXS8D+Tbb94feQh0UiIoXVOsQONwc=;
        b=FhWvMDQ6r3bc0RPtF6YhQtEqYuUIJPffpjoIQPgjwHXyQu48r0Ayd89EkZekHhRJLG
         4EUBPgEnO7dsMcgpK59ktpGvsJBeVK8htrvYk7LslWSk8oedCrcP+WPB1t46kGz5Sf/P
         5ejgVYqL7o5H0IZ67qd7G5m9SIuH9Th+CEW2Wc4Pz4804SeMu6K0TCeUo8hAx0qRJ6z0
         hY1iOeHTy1Sk3p+Q7BJJKqDjfRYYZkJ87gZD1LDQrwbxAsdYSgjIyPCX2JpNqy14OcX7
         gCOfT0zKUedjl35aDcHbQ4+EcvxIv3xPwvTQ7O1CQv9Q3sKB8v3qCDzr4+lnoZtRhvT/
         2jxg==
X-Forwarded-Encrypted: i=1; AJvYcCU0e9XGP3RplAy+vXSok4xCEhPom9w2oa/NEgH1v2I3JVhQfyvVDy99VihAesrOtkNRHL9Io4ClQtI=@lists.linux.dev
X-Gm-Message-State: AOJu0YynwlYuWpTsBNZcRPBB9VnCGnbyOtPjBhqJDsCvWe1AqLR/4VkJ
	6YlnqBr1oyLhzai/SzulWXvlWsaLG6he4jkoAJNeKIwgq7SP/KhQSD7lBllwXpfTy/moYfTwNEe
	pY8CWkP3ipqF09hNu5ZjZLT61pxVFyoeBzly9
X-Gm-Gg: ASbGncstpLMw4NkCKM7lpUJeBeMPMG5LQVvhPF57EkFdSoWie+/dAeCDSN13YvrGu9V
	QZacVpJbQlW1eW497HP6wQXBa7fvRDi1XH3HU4Cc5UWMXRzpnm9p+ZL7tqu3wuNBv1QqBjMByr1
	21Ai3Pd9ZQildVYg5UhQg5DcDmaxLPjykvupvOWm8gE7HLYrsknhhz+iOVb2901CboHQ2a9vvem
	L1z3jw3/mRRynmTmw==
X-Google-Smtp-Source: AGHT+IGyL6rwmC3gau41lmER0A7k1SC9yJ/AKXl3Qt8VAbhF/Iobe9h0dKUH57hbnJeeqHjDXhm71cgLZbh9yHlzkrk=
X-Received: by 2002:a05:622a:1815:b0:4ab:65ae:410d with SMTP id
 d75a77b69052e-4af00908324mr11041501cf.43.1754013649923; Thu, 31 Jul 2025
 19:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730131257.124153-1-duanchenghao@kylinos.cn> <CAK3+h2wG-++Np7e-CZMbdjkL9tbuRi4bx+DP4RzLvJqu_+UY8A@mail.gmail.com>
In-Reply-To: <CAK3+h2wG-++Np7e-CZMbdjkL9tbuRi4bx+DP4RzLvJqu_+UY8A@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 31 Jul 2025 19:00:38 -0700
X-Gm-Features: Ac12FXwGItNJkOm0cgnbEcYZz468Jzuqzz7qRwgRL6cTNjI79Ulc5V-3jqwfYzA
Message-ID: <CAK3+h2w8ic_7G0-p++ePj=RjSBNpShhmoczVeL-ET_ab7gi8eQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn, 
	youling.tang@linux.dev, jianghaoran@kylinos.cn, geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 10:21=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.co=
m> wrote:
>
> Hi Chenghao,
>
> I trimmed the email recipients only to the loongarch mailing list and
> folks who might pay attention to this, I personally don't like to
> bother other people who may not be interested in this :). Folks let me
> know if this  is not ok. anyway, please check my bpf selftest result
> inline.  The fentry_attach_stress results in kernel lockup.
>
> On Wed, Jul 30, 2025 at 6:13=E2=80=AFAM Chenghao Duan <duanchenghao@kylin=
os.cn> wrote:
> >
> > v5:
> > 1. Modify the internal implementation of larch_insn_text_copy by
> >    removing the while loop processing. There is a while loop inside
> >    copy_to_kernel_nofault that handles and copies all data.
> >
> > 2. text_mutex has been added to all usage contexts of
> > larch_insn_text_copy, and the relevant tests have passed.
> >
> > -----------------------------------------------------------------------
> > Historical Version:
> > v4:
> > 1. Delete the #3 patch of version V3.
> >
> > 2. Add 5 NOP instructions in build_prologue().
> >    Reserve space for the move_imm + jirl instruction.
> >
> > 3. Differentiate between direct jumps and ftrace jumps of trampoline:
> >    direct jumps skip 5 instructions.
> >    ftrace jumps skip 2 instructions.
> >
> > 4. Remove the generation of BL jump instructions in emit_jump_and_link(=
).
> >    After the trampoline ends, it will jump to the specified register.
> >    The BL instruction writes PC+4 to r1 instead of allowing the
> >    specification of rd.
> >
> > URL for version v4:
> > https://lore.kernel.org/all/20250724141929.691853-1-duanchenghao@kylino=
s.cn/
> > ---------
> > v3:
> > 1. Patch 0003 adds EXECMEM_BPF memory type to the execmem subsystem.
> >
> > 2. Align the size calculated by arch_bpf_trampoline_size to page
> > boundaries.
> >
> > 3. Add the flush icache operation to larch_insn_text_copy.
> >
> > 4. Unify the implementation of bpf_arch_xxx into the patch
> > "0004-LoongArch-BPF-Add-bpf_arch_xxxxx-support-for-Loong.patch".
> >
> > 5. Change the patch order. Move the patch
> > "0002-LoongArch-BPF-Update-the-code-to-rename-validate_.patch" before
> > "0005-LoongArch-BPF-Add-bpf-trampoline-support-for-Loon.patch".
> >
> > URL for version v3:
> > https://lore.kernel.org/all/20250709055029.723243-1-duanchenghao@kylino=
s.cn/
> > ---------
> > v2:
> > 1. Change the fixmap in the instruction copy function to set_memory_xxx=
.
> >
> > 2. Change the implementation method of the following code.
> >         - arch_alloc_bpf_trampoline
> >         - arch_free_bpf_trampoline
> >         Use the BPF core's allocation and free functions.
> >
> >         - bpf_arch_text_invalidate
> >         Operate with the function larch_insn_text_copy that carries
> >         memory attribute modifications.
> >
> > 3. Correct the incorrect code formatting.
> >
> > URL for version v2:
> > https://lore.kernel.org/all/20250618105048.1510560-1-duanchenghao@kylin=
os.cn/
> > ---------
> > v1:
> > Support trampoline for LoongArch. The following feature tests have been
> > completed:
> >         1. fentry
> >         2. fexit
> >         3. fmod_ret
> >
>
>  I ran ./test_progs  --list to test the following, and the
> fentry_attach_stress caused kernel lockup, so I had to power reset the
> machine.
>
> fentry_attach_btf_presence
>
> fentry_attach_stress
>
> fentry_fexit
>
> fentry_test
>
> fexit_bpf2bpf
>
> fexit_noreturns
>
> fexit_sleep
>
> fexit_stress
>
> fexit_test
>
>
> [root@fedora bpf]# ./test_progs -a fexit_test
> #112/1   fexit_test/fexit:OK
> fexit_many_args:PASS:fexit_many_args_skel_load 0 nsec
> libbpf: prog 'test2': failed to attach: -ENOTSUPP
> libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
> fexit_many_args:FAIL:fexit_many_args_attach unexpected error: -524 (errno=
 524)
> #112/2   fexit_test/fexit_many_args:FAIL
> #112     fexit_test:FAIL
>
> All error logs:
> fexit_many_args:PASS:fexit_many_args_skel_load 0 nsec
> libbpf: prog 'test2': failed to attach: -ENOTSUPP
> libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
> fexit_many_args:FAIL:fexit_many_args_attach unexpected error: -524 (errno=
 524)
> #112/2   fexit_test/fexit_many_args:FAIL
> #112     fexit_test:FAIL
> Summary: 0/1 PASSED, 0 SKIPPED, 1 FAILED
>
> [root@fedora bpf]# ./test_progs -a fexit_stress
> #111     fexit_stress:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fexit_sleep
> #110     fexit_sleep:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
>
> [root@fedora bpf]# ./test_progs -a fexit_noreturns
> #109/1   fexit_noreturns/noreturns:OK
> #109     fexit_noreturns:OK
> Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED
> [root@fedora bpf]# ./test_progs -a fexit_bpf2bpf
> #108/1   fexit_bpf2bpf/target_no_callees:OK
> #108/2   fexit_bpf2bpf/target_yes_callees:OK
> #108/3   fexit_bpf2bpf/func_replace:OK
> #108/4   fexit_bpf2bpf/func_replace_verify:OK
> #108/5   fexit_bpf2bpf/func_sockmap_update:OK
> #108/6   fexit_bpf2bpf/func_replace_return_code:OK
> #108/7   fexit_bpf2bpf/func_map_prog_compatibility:OK
> #108/8   fexit_bpf2bpf/func_replace_unreliable:OK
> #108/9   fexit_bpf2bpf/func_replace_multi:OK
> #108/10  fexit_bpf2bpf/fmod_ret_freplace:OK
> #108/11  fexit_bpf2bpf/func_replace_global_func:OK
> (cgroup_helpers.c:100: errno: Invalid argument) Enabling controller
> cpu: /mnt/cgroup.subtree_control
> #108 fexit_bpf2bpf: Failed to setup cgroup environment
> test_fentry_to_cgroup_bpf:FAIL:cgroup_fd unexpected cgroup_fd: actual
> -1 < expected 0
> #108/12  fexit_bpf2bpf/fentry_to_cgroup_bpf:FAIL
> #108/13  fexit_bpf2bpf/func_replace_progmap:OK
> #108     fexit_bpf2bpf:FAIL
>
> All error logs:
> (cgroup_helpers.c:100: errno: Invalid argument) Enabling controller
> cpu: /mnt/cgroup.subtree_control
> #108 fexit_bpf2bpf: Failed to setup cgroup environment
> test_fentry_to_cgroup_bpf:FAIL:cgroup_fd unexpected cgroup_fd: actual
> -1 < expected 0
> #108/12  fexit_bpf2bpf/fentry_to_cgroup_bpf:FAIL
> #108     fexit_bpf2bpf:FAIL
> Summary: 0/12 PASSED, 0 SKIPPED, 1 FAILED
>
> [root@fedora bpf]# ./test_progs -a fentry_test
> #107/1   fentry_test/fentry:OK
> fentry_many_args:PASS:fentry_many_args_skel_load 0 nsec
> libbpf: prog 'test2': failed to attach: -ENOTSUPP
> libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
> fentry_many_args:FAIL:fentry_many_args_attach unexpected error: -524 (err=
no 524)
> #107/2   fentry_test/fentry_many_args:FAIL
> #107     fentry_test:FAIL
>
> All error logs:
> fentry_many_args:PASS:fentry_many_args_skel_load 0 nsec
> libbpf: prog 'test2': failed to attach: -ENOTSUPP
> libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
> fentry_many_args:FAIL:fentry_many_args_attach unexpected error: -524 (err=
no 524)
> #107/2   fentry_test/fentry_many_args:FAIL
> #107     fentry_test:FAIL
> Summary: 0/1 PASSED, 0 SKIPPED, 1 FAILED
> [root@fedora bpf]# ./test_progs -a fentry_fexit
> #106     fentry_fexit:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
>
> [root@fedora bpf]# ./test_progs -a fentry_attach_btf_presence
> #104     fentry_attach_btf_presence:OK
> Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
>
> [root@fedora bpf]# ./test_progs -a fentry_attach_stress. <-----kernel
> locked up after this
> client_loop: send disconnect: Broken pipe
>

the fentry_attach_stress seems to  trigger race condition in
bpf_arch_text_poke(), see

commit d459dbbbfa323165849451edb9690a933c210bac
Author: Ilya Leoshkevich <iii@linux.ibm.com>
Date:   Wed Jul 16 21:35:07 2025 +0200

    selftests/bpf: Stress test attaching a BPF prog to another BPF prog

    Add a test that invokes a BPF prog in a loop, while concurrently
    attaching and detaching another BPF prog to and from it. This helps
    identifying race conditions in bpf_arch_text_poke().

    Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
    Link: https://lore.kernel.org/r/20250716194524.48109-3-iii@linux.ibm.co=
m
    Signed-off-by: Alexei Starovoitov <ast@kernel.org>

>
> > TODO: The support for the struct_ops feature will be provided in
> > subsequent patches.
> >
> > URL for version v1:
> > https://lore.kernel.org/all/20250611035952.111182-1-duanchenghao@kylino=
s.cn/
> > -----------------------------------------------------------------------
> >
> > Chenghao Duan (4):
> >   LoongArch: Add larch_insn_gen_{beq,bne} helpers
> >   LoongArch: BPF: Update the code to rename validate_code to
> >     validate_ctx
> >   LoongArch: BPF: Implement dynamic code modification support
> >   LoongArch: BPF: Add bpf trampoline support for Loongarch
> >
> > Tiezhu Yang (1):
> >   LoongArch: BPF: Add struct ops support for trampoline
> >
> >  arch/loongarch/include/asm/inst.h |   3 +
> >  arch/loongarch/kernel/inst.c      |  54 +++
> >  arch/loongarch/net/bpf_jit.c      | 527 +++++++++++++++++++++++++++++-
> >  arch/loongarch/net/bpf_jit.h      |   6 +
> >  4 files changed, 589 insertions(+), 1 deletion(-)
> >
> > --
> > 2.25.1
> >
