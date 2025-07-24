Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F054264A74
	for <loongarch@lists.linux.dev>; Thu, 24 Jul 2025 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753371049; cv=none; b=cTrfoCsNOssNeQ02fEMKxcowBKCuynEd56xbugFKiC2XMR3FJ6XMnQAcSzFvE9oLVpSjudXsnuRyHGMBPT9z5NN7xYexSK3x9uJ4JJMUqO4b8jiEgtq13uyBq/GGgumS8fRWJfEwf1R880FKUWWM3RToEi2kERMt3TU/XVUNSIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753371049; c=relaxed/simple;
	bh=s6n0+4J3j3E/bwSmPKHNNlPN0uXRfALwz6qCZuavh+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0FRVgPwoTYM2AFJix7+46mr00iSCU/S8EREOGux1yH3eJmxMxujVUxEN6pizwtZf5sTGEu8FI7Gb/GN0siRF6UZlmfwUKPq+npUf0zHb8n8+sPIp7BfpVrkfoKotEPZaDRILRlaDXRM7QuavtvKCOEo8bxlbIGvR3Vku0QX4iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R15zXXK+; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R15zXXK+"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ab61ecc1e8so9675911cf.1
        for <loongarch@lists.linux.dev>; Thu, 24 Jul 2025 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753371047; x=1753975847; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bns7Kk0Rpa4pq4zt0eqAHfJ1qsmgjPeI84GDNp5EYCw=;
        b=R15zXXK+d6Otyqo9h7uF/8EiflAoAq/r4RKGorTAEqM2rDiM2pTBINNUG89AYicJUo
         NrQdRv6iWfO7KoBTepSBvFYAagPBQJL7LB+Hhyu4BNtamF8XdXowbo9+OF16ZRPUcx8u
         XHP/wrg34XtYk2cO5jB6EiPVHWsI4TI5JlJtAnCfVxwAPHMR6s6bZv1DgDXZem8iz6FR
         JPoB/ojghZKkwmo0Zj/UanCaGGOg+ifqCUVTVCpNgP/EWMhhD0d6swMz784lu5RDvhCY
         4OvcuJynj3J7ia+amaaD15fsnt9a+o6jRHMQH8FgXt/plKJNuvlBall1VZP+OdLhuTxa
         dKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753371047; x=1753975847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bns7Kk0Rpa4pq4zt0eqAHfJ1qsmgjPeI84GDNp5EYCw=;
        b=pbkeWhMUROiT8ZJ9oWRmPyt9LFXbFVuTlYnHo0aRbfGRyL/hnDMFlGy6U2uH5BI2zm
         5aFimkanmiNSfTJ7EupFMhGSdydWXWcrXKpa2bdi7MFOi7x8EsXLw3wxUQMQFeQuFIEM
         XoMHsGM0j/i+6s9e/Xfyu1BrH6CbJqXdweOXyla7FJSONK2jRWkcFb3gngjtSSQ2qmiN
         alN7shUtLyEKGickKFtt6okkZijSqlES2Osom+s0/PMhBFc4bN+PhAS4icEos4EfLTdP
         Kk5J4AM+Q6u6iweEaFZbA/BROwCSfGVC6zZQUYWmf9Wngx0V9FzD2A0o57wh/yjVaO54
         km5A==
X-Forwarded-Encrypted: i=1; AJvYcCWWw/HUF+ZSWQhbchv2WgV66Nfb1UtBwvR/EBv+CIaThKi1aBHeRnUkChewoD3621ZVreY8tKsSlgg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/UFME5oH1tNr9B4DLoxC0rHw2S9eExThI5uTbrldpODuVi3Xr
	FH/2MajWWQnACx7Lrf8U9EZdytdgfYuFjf5wmc8uN8aM/OaopxV46ENH6ymrivUetkwCG1LX/p1
	czSWUQ82R6q5uDL2soN2GkPu/UWHmenE9Fn/U
X-Gm-Gg: ASbGnctJeXeeL5gDHrE4yCjy9tvdfvR7NWzdu0qUDd7zQQoxiNiSezdgFo6BtQASnKi
	fuug/hLcm2Ir5642plOCoz53A8XG2AgRbYdzF046ArBAdU97hi/uIuNFLs9zzwoId86oJSh1i4M
	TBt19biN4dC+4/Knn7jy+alroy21yKIwLtH6IzVSPShucU2qUamt4CjAEum4pHAK40CmQjW3bJy
	zZlzR0=
X-Google-Smtp-Source: AGHT+IFneajSujJFQ97vJcxifdOb9B3fL1wtrAniITfCV3VYjoOZ3QlmTUWuT4bgBenSgy2Gnd2jFCXUqEkPtzVI9bw=
X-Received: by 2002:a05:622a:10e:b0:4ab:5429:f961 with SMTP id
 d75a77b69052e-4ae6df467a1mr98689901cf.35.1753371046736; Thu, 24 Jul 2025
 08:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724141929.691853-1-duanchenghao@kylinos.cn>
In-Reply-To: <20250724141929.691853-1-duanchenghao@kylinos.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 24 Jul 2025 08:30:35 -0700
X-Gm-Features: Ac12FXzYVMc9LtJ5ub-Hay_uu6iwvZYf5WJFpfcdpSQsl15oaprz3hONyJyeCuw
Message-ID: <CAK3+h2zirm6cV2tAbd38RSYSF3=B1qZ+9jm_GZPsAPrMtaozmg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Support trampoline for LoongArch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, hengqi.chen@gmail.com, chenhuacai@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 7:19=E2=80=AFAM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
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
> -----------------------------------------------------------------------
> Historical Version:
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
>   LoongArch: BPF: Add bpf_arch_xxxxx support for Loongarch
>   LoongArch: BPF: Add bpf trampoline support for Loongarch
>
> Tiezhu Yang (1):
>   LoongArch: BPF: Add struct ops support for trampoline
>
>  arch/loongarch/include/asm/inst.h |   3 +
>  arch/loongarch/kernel/inst.c      |  60 ++++
>  arch/loongarch/net/bpf_jit.c      | 521 +++++++++++++++++++++++++++++-
>  arch/loongarch/net/bpf_jit.h      |   6 +
>  4 files changed, 589 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>

Tested the whole patch series and it resolved the xdp-tool xdp-filter issue

[root@fedora ~]# xdp-loader status
CURRENT XDP PROGRAM STATUS:

Interface        Prio  Program name      Mode     ID   Tag
  Chain actions
---------------------------------------------------------------------------=
-----------
lo                     xdp_dispatcher    skb      53   4d7e87c0d30db711
 =3D>              10     xdpfilt_alw_all           62
320c53c06933a8fa  XDP_PASS
dummy0                 <No XDP program loaded!>
sit0                   <No XDP program loaded!>
enp0s3f0               <No XDP program loaded!>
wlp3s0                 <No XDP program loaded!>

you can add Tested-by: Vincent Li <vincent.mc.li@gmail.com>
