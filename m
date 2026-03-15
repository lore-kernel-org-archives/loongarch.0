Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445F7145355
	for <loongarch@lists.linux.dev>; Sun, 15 Mar 2026 03:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773545278; cv=pass; b=WTgapNpoQXJZC4Z+YYe9Cl1zOQrLazYmkG41vGCopcPOJGf0Xbnq9yISoe/L0TbjqgoDvI/fSSnsMfGhpbencii+G5UIpXNuTLaT85GtJXFyT9yWp7ZQMp2SznJcgutVJ+6EgYv6djmV2RuMIDZtX2HRDuGg+USJpwrOSxpCy0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773545278; c=relaxed/simple;
	bh=vLo0aTBULrldpWshfCrk+12BbGo5LOKzzi1Eoz+QGms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bls4OpYItZq2q3JW9HJKaDwfFS5IQEJSyvsACKFZMe+M/2dYRmQ4YvRUcCuGV4ZOE9yTqCZ2bWGQWatSEsVGDva3cyiVH1lRbJgmlnl6/a2Y/1jfZ9Gw6yyfFYskkTNYZuvsYGud39EDLQAvRyWFvtksAvfN6leho1z5bmMdI7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwinKk7G; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwinKk7G"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d738fe814cso2891089a34.3
        for <loongarch@lists.linux.dev>; Sat, 14 Mar 2026 20:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773545276; cv=none;
        d=google.com; s=arc-20240605;
        b=d2kVo9Ef6SYTGVKibhjSAyOE8v7pGarckMJhwBVQdfwC2nYycjUR1/KjtSY7Z9xTK5
         SYSz2fVkoOEJmy+DMpvN4Jq44DPcieJik0UcpaNPNIxGS7QmANgWK9oV3Tx5ouXbgKMN
         LKTd83tdXNhO+e1CCplKuT8+BemcOKa9KjQ8DEfZjWbKRSo+htW4E6i8qOFCLeJ1lcFO
         fyNrtbqr50nTTMpHv8dzeCCO7LXbXlZMw7PFI87JT8Cg4BIaVb5jxoy+B1XggZk00GfF
         p73vhYJuXD8tKiKHliMwql88ZpV/SHD2zyHv0WI9Jqo8MMvZuUmNXw5dlc/l+IqU8KXg
         DpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZnPH3VGFWMUcHKF0SMZcxSg4Tfm6cTcFIpi0Zio6Tig=;
        fh=ftVcrEppHuVGj/ET/wN9YWlZ3078vtv1Dozqy7Bs8Cc=;
        b=HGhlza4Ae7djOEhEv8vpQUs/kvPMApDlYWjgIVFbY2G0/U/xFWzr+KZu7CwKCokNnC
         TmUSnKiQTjkgQUo4b5DTTwMOILDBmhZQWU1wfA5ANLcZbw6gORaG8blJPGS3nm4UAOUE
         s1O5+36fiUL1AcyqT3GWQGY7pcCMM2F2xRdX3jRoq9Abo4BwkIkPtX4qKnUx6y0njdOH
         v/u9/PMY0K161Vyp3OnedYBZz8V/1L230A6naS4nCMAZEHyiA1Vo5mci9xVcveaUpKoW
         TLifyB6Qzt0J6T5tZOeA2Bw2bDzLJ7LabHREAEZWHoSvMWVr0Qu4SFRKkMUGQ8F/X+hf
         J9ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773545276; x=1774150076; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnPH3VGFWMUcHKF0SMZcxSg4Tfm6cTcFIpi0Zio6Tig=;
        b=EwinKk7G+HqZgV9DhUY6/oDBahkC1hyrW0KJ2kLNQfiNJvyOwf89T+JIWxpfez65we
         iaJOoBxFNbs0cDP3kHe0n2gZ2ywUNnPU87KNAuL+GIMFumlo07dcfKxmQZRChEPCaV4g
         R004meoZFGV2hI3JSfsL5uN2ex4Ci3GMRwSIuall4Rs2+90ANb9OqDJ6kLPJAEmANDUn
         qLFaN38JFA6fJmLRg4IPf6IiW5kWHG+tpSzqcupfYd0Rd2FRIcXwDhdqRpVWnRdsWuBX
         1dai0rV4GncaLEVmcNH8gK8MgBY5BZWs/IWTbHl5KEh1vCFrdHicnttMDewNeQwMgqYj
         rx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773545276; x=1774150076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZnPH3VGFWMUcHKF0SMZcxSg4Tfm6cTcFIpi0Zio6Tig=;
        b=GqVdJOglemzzi62AKzbVEhBbXo1DryIycNd357zIZqLf2rMQCPplRDQnQHlR0m/NgA
         rTVqroUEsEktGjMyeq3dncUKJ1DeFnxH8CYFKDnZzGT546MMbd/VP8HJs+mDzTHaXZ/n
         VhaJzf8Xx+hHNO6JSeiGdutIYdGUBINB5Lwr/j95EKpcecrXiwCcMr5L0j3lQ+/3SzM7
         bzTOWRrsB7NS4mEcLPXp3HTyLLPbruFg0fAlIEHa4q8gByVqj9lXisa82/SdzzSvBG49
         yl4cHq63QWfiFydVFaLEngZXU7DsXsXd8coBUPmE5F6kH4HfKgUfWEzrfeISeV8mLHc/
         Az4g==
X-Forwarded-Encrypted: i=1; AJvYcCU+CdRQyZpH1bKLMupa5OP8sp62RMIwxNVow66Md3DFZh0lFwP3Po7m36Sc4UTwow1JctoA6splfPg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbZ1RvyJvDP/Zuc0vWGHghFDHJqEkPqsK+3A+gbXI8TqPJNFZ0
	rxqOUrlEO4aBFP3ZAeUswwzj6E1rx7WlrJkr5wGwj1lH3GbLrAsVDN3/GIw7bcfPZrfoE2CPSu2
	QgbvgtYvO5PdJlA+h6YJ0NBUQnpJwVOQ=
X-Gm-Gg: ATEYQzzXa7o0grQ9GxX5RT5XPwt555qjIjOLOzRsRS673HtPQ9FhcTc245EZoGzlm6c
	jfpFHJCTa3azTjajv7UC2baeEusjLJCWP8HtV9+MaZsQcjOvgrF265/G/lm0yP/afbv1BfXBCoR
	lIi3ptw0RLG37KLFTHvfYpUFE+PJ8ouCvi/TrBvakbK+9abRoT5j42zblD2Dqm7FFbvIpG1RRg8
	NHvZ22K/xXwWk9TxvtNgNixgJ246kNlDU3ekpVFiN4LKNThuEHh6eXVUIS+fnEtGXE3OH8eiAL8
	KamEBgD8nBuWYXyjH1c=
X-Received: by 2002:a05:6830:258c:b0:7d1:586a:32a2 with SMTP id
 46e09a7af769-7d78232b1a0mr6066286a34.0.1773545276088; Sat, 14 Mar 2026
 20:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310064706.4985-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260310064706.4985-1-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sun, 15 Mar 2026 11:27:44 +0800
X-Gm-Features: AaiRm53o26SQ9HtIxoiUSju9Rqix7VoyfBCQjRfv1lRMcCvaqROe5BiuSA5Mj9g
Message-ID: <CAEyhmHQiz510vQMu-WRZ==Q71mW70UEDvyedqe8giXF=0hXSHw@mail.gmail.com>
Subject: Re: [PATCH v1] LoongArch: BPF: Make arch_protect_bpf_trampoline()
 return 0
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 2:47=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Occasionally, there exists "text_copy_cb: operation failed" when executin=
g
> bpf selftests, the reason is copy_to_kernel_nofault() failed and the ecod=
e
> of estat register is 0x4 (PME: Page Modification Exception) due to the pt=
e
> is not writeable, the root cause is that there is another place to set pt=
e
> readonly which is in the generic weak arch_protect_bpf_trampoline().
>
> There are two ways to fix this race condition issue, the direct way is to
> modify the generic weak arch_protect_bpf_trampoline() to add a mutex lock
> for set_memory_rox(), but the other simple and proper way is to just make
> arch_protect_bpf_trampoline() return 0 in the arch-specific code because
> LoongArch already uses BPF prog pack allocator for trampoline.
>
> Here are the trimmed kernel log messages:
>
>   copy_to_kernel_nofault: memory access failed, ecode is 0x4
>   copy_to_kernel_nofault: caller is text_copy_cb+0x50/0xa0
>   text_copy_cb: operation failed
>   ------------[ cut here ]------------
>   bpf_prog_pack bug: missing bpf_arch_text_invalidate?
>   WARNING: kernel/bpf/core.c:1008 at bpf_prog_pack_free+0x200/0x228
>   ...
>   Call Trace:
>   [<9000000000248914>] show_stack+0x64/0x188
>   [<9000000000241308>] dump_stack_lvl+0x6c/0x9c
>   [<90000000002705bc>] __warn+0x9c/0x200
>   [<9000000001c428c0>] __report_bug+0xa8/0x1c0
>   [<9000000001c42b5c>] report_bug+0x64/0x120
>   [<9000000001c7dcd0>] do_bp+0x270/0x3c0
>   [<9000000000246f40>] handle_bp+0x120/0x1c0
>   [<900000000047b030>] bpf_prog_pack_free+0x200/0x228
>   [<900000000047b2ec>] bpf_jit_binary_pack_free+0x24/0x60
>   [<900000000026989c>] bpf_jit_free+0x54/0xb0
>   [<900000000029e10c>] process_one_work+0x184/0x610
>   [<900000000029ef8c>] worker_thread+0x24c/0x388
>   [<90000000002a902c>] kthread+0x13c/0x170
>   [<9000000001c7dfe8>] ret_from_kernel_thread+0x28/0x1c0
>   [<9000000000246624>] ret_from_kernel_thread_asm+0xc/0x88
>
>   ---[ end trace 0000000000000000 ]---
>
> Here is a simple shell script to reproduce:
>
>   #!/bin/bash
>
>   for ((i=3D1; i<=3D1000; i++))
>   do
>     echo "under testing $i ..."
>     dmesg -c > /dev/null
>     ./test_progs -t fentry_attach_stress > /dev/null
>     dmesg -t | grep "text_copy_cb: operation failed"
>     if [ $? -eq 0 ]; then
>       break
>     fi
>   done
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

>  arch/loongarch/net/bpf_jit.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 3bd89f55960d..4f1af3b7a363 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1568,6 +1568,11 @@ void arch_free_bpf_trampoline(void *image, unsigne=
d int size)
>         bpf_prog_pack_free(image, size);
>  }
>
> +int arch_protect_bpf_trampoline(void *image, unsigned int size)
> +{
> +       return 0;
> +}
> +
>  /*
>   * Sign-extend the register if necessary
>   */
> --
> 2.42.0
>
