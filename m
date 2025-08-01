Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8B523F27B
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 17:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753982495; cv=none; b=aiYq5sA8vkxKwwKxl2dkexPvaD3Z7+X/wK+Mgf1mtOTcWq7QVE9JPb0nylscxsYUpOksVqjO+jSVUaHYag73NkKzlTF1AE+1321Ias1vJQj5asLVObGyUVWX6TqvZlM5f0/x0yC8NhSxjom/Zs+O3X5FmUE9a2280/PRatQk0l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753982495; c=relaxed/simple;
	bh=jJbwcSIyrX3SXaLtefWB3UaSbw9UzFTtcraEsD94D/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WH21gxA8/3IevChsHvsE8TFcakwBQfPxmxXsxJq3SQOuWQQwyHGFIM3otWjG7IRFly+PHd/bQHLMowM3kM4KsQrnS7s+sRONYXpCu1JGQD0bYaO0p9O5H2bEWw7EpXI7f2Wg3D9N+FH9nizkMiqoLwQE+0rHr2mWqj7urdvGYk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wo9/U5bh; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wo9/U5bh"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4abd3627e7eso7739371cf.0
        for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753982492; x=1754587292; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcOaHtczvWQ5LWltJ5cgOnzSxyXfggyVrLIrp4nu0Io=;
        b=Wo9/U5bh2R81fxh0FxuTbi6PDDdJ4CKC/0so5aZddbV5kqgEBQ5JzfMKnU5idZlDPD
         62j+ReCHNPz8KNJ/SZ3CsL9Q8fn77DiKa2nDY5MtA6yBaoWbyEvNt9jwq7AmYz85GEe0
         Gnv26STfJD41xJdSHP2lBb4QxXkUMXKKmh4c064yYZBk8LJNnU25nMhapMVeMgk+LJfQ
         BE/L7KaRFlgeYhUkXll8g3Tfl+q+BEpQvCvCbUQHqtdX8evrhw/ZD5zk4tYVT8hgzNqr
         P9mmPKFZo0e5XDHNftjfSKHYrCH33hR8x8EO/nkMfRHLvEGpZl7RSRGdvcPzOr7ocq/C
         HTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753982492; x=1754587292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcOaHtczvWQ5LWltJ5cgOnzSxyXfggyVrLIrp4nu0Io=;
        b=T/HVJU3U291pRrUmYoqz5aJBPSTvoN/cdPHAUgBEPCzGfWrUNBAxExlVjZWr3w4L8L
         JeTJ+oi7EkreOe+6xFwaUBxtb/llVtr8wnGefcgwJlRlSAMQG0baKIJJkaFIzoF0KL9G
         PqDUeefiwkobzRZHnwuNSAIXmdsWKRJpcnnZIhpQbU66BjMEriw8CCquNR17XSS0qFxV
         qak1BWRdSf4Qj2Dz3F2bQABHLnEBas4+4iOFB7Y8hrgg60UHauYNXVpKFK9GFIlsISce
         Iw3Ir3/8pAZ8b1qfSokGS1naYmRP07A+mxnTJQMgacrXLSo2M7qqeBqY17/bhuyLja41
         Sz4w==
X-Forwarded-Encrypted: i=1; AJvYcCXr2Iihwz5nDiCIQa01zn6TVR3J0x33Cb9jSYRxYLlzQKs7drQuFZm41VvcqupN7LH5bPpzx7PRrX0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0wxVbd+hDrsjPeNxxxxITyox37gCUWW2ViCrbmqQqB5I1qZ7q
	3EWMcXy0ouXCUxKluNmtJgUYccbU5Z8ASB5nzO/dEfsfLjRoM7zCeXsSr/WpdPoumkMdWMd71Y2
	83lKCl7xDj3DrKpQctZn+MTj0Sr1CxUw=
X-Gm-Gg: ASbGnctZVeKkRhEqmyeBSMlm3oswI9EAupmjSnLHEtdJYiCInwVwrtrINDuASngKoXR
	AY2fV+AxFtoWMC1+59zyEI9AvqsRNyeo4PrrNR7RVF3sObnYnkqeZNfCzGOQgwsYXPWEJ72ICrZ
	ZJF3wNJ36gNdrjxA0vvKYOzuM8NCKBNBHgywiv/JF2Z3g8KNj/5uIs3M8AkIKKSZ69Y01fkXkBP
	k/GwTs=
X-Google-Smtp-Source: AGHT+IGT9TMtU/DBO7hez15I6l4zXjVlfYVEacKNUe8f/kfUKm51xBHpsqnuq14vQrJ/z+tJxmbgWcvdALwtCcd8vho=
X-Received: by 2002:a05:6214:2e90:b0:707:6977:aa9e with SMTP id
 6a1803df08f44-7076977ba48mr88778436d6.28.1753982491506; Thu, 31 Jul 2025
 10:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730131257.124153-1-duanchenghao@kylinos.cn>
In-Reply-To: <20250730131257.124153-1-duanchenghao@kylinos.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 31 Jul 2025 22:21:03 -0700
X-Gm-Features: Ac12FXxC75xo88VGRma6v6WmcZGlQh4igVsj-f4NuG3ZLr_iCKyzKMZhKhQSdMg
Message-ID: <CAK3+h2wG-++Np7e-CZMbdjkL9tbuRi4bx+DP4RzLvJqu_+UY8A@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support trampoline for LoongArch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, loongarch@lists.linux.dev, guodongtai@kylinos.cn, 
	youling.tang@linux.dev, jianghaoran@kylinos.cn, geliang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chenghao,

I trimmed the email recipients only to the loongarch mailing list and
folks who might pay attention to this, I personally don't like to
bother other people who may not be interested in this :). Folks let me
know if this  is not ok. anyway, please check my bpf selftest result
inline.  The fentry_attach_stress results in kernel lockup.

On Wed, Jul 30, 2025 at 6:13=E2=80=AFAM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> v5:
> 1. Modify the internal implementation of larch_insn_text_copy by
>    removing the while loop processing. There is a while loop inside
>    copy_to_kernel_nofault that handles and copies all data.
>
> 2. text_mutex has been added to all usage contexts of
> larch_insn_text_copy, and the relevant tests have passed.
>
> -----------------------------------------------------------------------
> Historical Version:
> v4:
> 1. Delete the #3 patch of version V3.
>
> 2. Add 5 NOP instructions in build_prologue().
>    Reserve space for the move_imm + jirl instruction.
>
> 3. Differentiate between direct jumps and ftrace jumps of trampoline:
>    direct jumps skip 5 instructions.
>    ftrace jumps skip 2 instructions.
>
> 4. Remove the generation of BL jump instructions in emit_jump_and_link().
>    After the trampoline ends, it will jump to the specified register.
>    The BL instruction writes PC+4 to r1 instead of allowing the
>    specification of rd.
>
> URL for version v4:
> https://lore.kernel.org/all/20250724141929.691853-1-duanchenghao@kylinos.=
cn/
> ---------
> v3:
> 1. Patch 0003 adds EXECMEM_BPF memory type to the execmem subsystem.
>
> 2. Align the size calculated by arch_bpf_trampoline_size to page
> boundaries.
>
> 3. Add the flush icache operation to larch_insn_text_copy.
>
> 4. Unify the implementation of bpf_arch_xxx into the patch
> "0004-LoongArch-BPF-Add-bpf_arch_xxxxx-support-for-Loong.patch".
>
> 5. Change the patch order. Move the patch
> "0002-LoongArch-BPF-Update-the-code-to-rename-validate_.patch" before
> "0005-LoongArch-BPF-Add-bpf-trampoline-support-for-Loon.patch".
>
> URL for version v3:
> https://lore.kernel.org/all/20250709055029.723243-1-duanchenghao@kylinos.=
cn/
> ---------
> v2:
> 1. Change the fixmap in the instruction copy function to set_memory_xxx.
>
> 2. Change the implementation method of the following code.
>         - arch_alloc_bpf_trampoline
>         - arch_free_bpf_trampoline
>         Use the BPF core's allocation and free functions.
>
>         - bpf_arch_text_invalidate
>         Operate with the function larch_insn_text_copy that carries
>         memory attribute modifications.
>
> 3. Correct the incorrect code formatting.
>
> URL for version v2:
> https://lore.kernel.org/all/20250618105048.1510560-1-duanchenghao@kylinos=
.cn/
> ---------
> v1:
> Support trampoline for LoongArch. The following feature tests have been
> completed:
>         1. fentry
>         2. fexit
>         3. fmod_ret
>

 I ran ./test_progs  --list to test the following, and the
fentry_attach_stress caused kernel lockup, so I had to power reset the
machine.

fentry_attach_btf_presence

fentry_attach_stress

fentry_fexit

fentry_test

fexit_bpf2bpf

fexit_noreturns

fexit_sleep

fexit_stress

fexit_test


[root@fedora bpf]# ./test_progs -a fexit_test
#112/1   fexit_test/fexit:OK
fexit_many_args:PASS:fexit_many_args_skel_load 0 nsec
libbpf: prog 'test2': failed to attach: -ENOTSUPP
libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
fexit_many_args:FAIL:fexit_many_args_attach unexpected error: -524 (errno 5=
24)
#112/2   fexit_test/fexit_many_args:FAIL
#112     fexit_test:FAIL

All error logs:
fexit_many_args:PASS:fexit_many_args_skel_load 0 nsec
libbpf: prog 'test2': failed to attach: -ENOTSUPP
libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
fexit_many_args:FAIL:fexit_many_args_attach unexpected error: -524 (errno 5=
24)
#112/2   fexit_test/fexit_many_args:FAIL
#112     fexit_test:FAIL
Summary: 0/1 PASSED, 0 SKIPPED, 1 FAILED

[root@fedora bpf]# ./test_progs -a fexit_stress
#111     fexit_stress:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fexit_sleep
#110     fexit_sleep:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

[root@fedora bpf]# ./test_progs -a fexit_noreturns
#109/1   fexit_noreturns/noreturns:OK
#109     fexit_noreturns:OK
Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED
[root@fedora bpf]# ./test_progs -a fexit_bpf2bpf
#108/1   fexit_bpf2bpf/target_no_callees:OK
#108/2   fexit_bpf2bpf/target_yes_callees:OK
#108/3   fexit_bpf2bpf/func_replace:OK
#108/4   fexit_bpf2bpf/func_replace_verify:OK
#108/5   fexit_bpf2bpf/func_sockmap_update:OK
#108/6   fexit_bpf2bpf/func_replace_return_code:OK
#108/7   fexit_bpf2bpf/func_map_prog_compatibility:OK
#108/8   fexit_bpf2bpf/func_replace_unreliable:OK
#108/9   fexit_bpf2bpf/func_replace_multi:OK
#108/10  fexit_bpf2bpf/fmod_ret_freplace:OK
#108/11  fexit_bpf2bpf/func_replace_global_func:OK
(cgroup_helpers.c:100: errno: Invalid argument) Enabling controller
cpu: /mnt/cgroup.subtree_control
#108 fexit_bpf2bpf: Failed to setup cgroup environment
test_fentry_to_cgroup_bpf:FAIL:cgroup_fd unexpected cgroup_fd: actual
-1 < expected 0
#108/12  fexit_bpf2bpf/fentry_to_cgroup_bpf:FAIL
#108/13  fexit_bpf2bpf/func_replace_progmap:OK
#108     fexit_bpf2bpf:FAIL

All error logs:
(cgroup_helpers.c:100: errno: Invalid argument) Enabling controller
cpu: /mnt/cgroup.subtree_control
#108 fexit_bpf2bpf: Failed to setup cgroup environment
test_fentry_to_cgroup_bpf:FAIL:cgroup_fd unexpected cgroup_fd: actual
-1 < expected 0
#108/12  fexit_bpf2bpf/fentry_to_cgroup_bpf:FAIL
#108     fexit_bpf2bpf:FAIL
Summary: 0/12 PASSED, 0 SKIPPED, 1 FAILED

[root@fedora bpf]# ./test_progs -a fentry_test
#107/1   fentry_test/fentry:OK
fentry_many_args:PASS:fentry_many_args_skel_load 0 nsec
libbpf: prog 'test2': failed to attach: -ENOTSUPP
libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
fentry_many_args:FAIL:fentry_many_args_attach unexpected error: -524 (errno=
 524)
#107/2   fentry_test/fentry_many_args:FAIL
#107     fentry_test:FAIL

All error logs:
fentry_many_args:PASS:fentry_many_args_skel_load 0 nsec
libbpf: prog 'test2': failed to attach: -ENOTSUPP
libbpf: prog 'test2': failed to auto-attach: -ENOTSUPP
fentry_many_args:FAIL:fentry_many_args_attach unexpected error: -524 (errno=
 524)
#107/2   fentry_test/fentry_many_args:FAIL
#107     fentry_test:FAIL
Summary: 0/1 PASSED, 0 SKIPPED, 1 FAILED
[root@fedora bpf]# ./test_progs -a fentry_fexit
#106     fentry_fexit:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

[root@fedora bpf]# ./test_progs -a fentry_attach_btf_presence
#104     fentry_attach_btf_presence:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

[root@fedora bpf]# ./test_progs -a fentry_attach_stress. <-----kernel
locked up after this
client_loop: send disconnect: Broken pipe


> TODO: The support for the struct_ops feature will be provided in
> subsequent patches.
>
> URL for version v1:
> https://lore.kernel.org/all/20250611035952.111182-1-duanchenghao@kylinos.=
cn/
> -----------------------------------------------------------------------
>
> Chenghao Duan (4):
>   LoongArch: Add larch_insn_gen_{beq,bne} helpers
>   LoongArch: BPF: Update the code to rename validate_code to
>     validate_ctx
>   LoongArch: BPF: Implement dynamic code modification support
>   LoongArch: BPF: Add bpf trampoline support for Loongarch
>
> Tiezhu Yang (1):
>   LoongArch: BPF: Add struct ops support for trampoline
>
>  arch/loongarch/include/asm/inst.h |   3 +
>  arch/loongarch/kernel/inst.c      |  54 +++
>  arch/loongarch/net/bpf_jit.c      | 527 +++++++++++++++++++++++++++++-
>  arch/loongarch/net/bpf_jit.h      |   6 +
>  4 files changed, 589 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
