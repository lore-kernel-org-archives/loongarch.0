Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E420296A
	for <loongarch@lists.linux.dev>; Thu, 10 Jul 2025 07:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132557; cv=none; b=gL8EAsagOmB656fOu91tBn0OuuSjRWxjSxIWpPQWlnTHDTHRMyzCb01bS/8evduX/edAuWUbLJ5+f8/3Pfhashx0rPO2h97tC2EhUOeF3CbWiY9UgncmpSo0NR2ZERt+t1fij1qCJ9PnSdt75EbmRJv0HW4+5DHDwmTFPbbUZH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132557; c=relaxed/simple;
	bh=lLFwpKOTsYuOe3kYj8LTN41RY9+dACj4r9I2JiSYunA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmOW2pJPIWae0Bk2BZDBgkGfEymnQ/eG4PMeVYBUlQKPwGnngMjOLWsQViP971iTmGYNNzMRqhgKSoF1Ir8O80pxUefH6+kCpMPCfqfvLHOAS9bgx+SZmNBEKOcNBm4baiV9m9880OoU/InRL0+jDeYP1bmUBd0Bn04PQavPKP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ld+S2lcg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ld+S2lcg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C265C4CEFB
	for <loongarch@lists.linux.dev>; Thu, 10 Jul 2025 07:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752132557;
	bh=lLFwpKOTsYuOe3kYj8LTN41RY9+dACj4r9I2JiSYunA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ld+S2lcgBvZq1Iq9vx/pcngfPg+dijinRCQEiWAZOJM2x/igpXg0bnrfD5JJjP+Oo
	 VkUmwqq1wCSLoQaD8Vy8zSTmYZvSClWYUKo939JFrmoJWJqGd8e94GDIO7/OEgx7CE
	 zXO5BpV1h1hwDrkBQ2eD8fTLMFM2iTrsxA+bI0nR9s5+lkEhsqz7ufsFeqyGWh9Dmq
	 gRPS9taD9els0g9K6x7UywAg60TOfud28IL4Zeo0ElMhichJQCB08ldca3YAIaSBi9
	 41AGrW4TjQ1N4agzJDLreidoi5aewE40K69bL7wdib4uS1jLh+dvK6whNcglIPQwZr
	 UCpxj5JMptPMA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c01b983b6so1418949a12.0
        for <loongarch@lists.linux.dev>; Thu, 10 Jul 2025 00:29:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWumUfR4M9r+fgq+7EgCIZv4ndLmoDMrCbqJ9T4/BMVxhWeAv4Z0BRuSwRTmyj56aT0kXDnNREptmU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0Gbj15bO7EthKAVKFQ4EZ9rLslnjDw5pffyFBEEo+7eNytXBZ
	3mSc3xPbWIWG8AvimfRPUZ9iataFqhGHyEtdvG+fY8+05Yp1QJW/+RU5awa6Lc315E+YyxXiaPV
	ymvPd2xlLShyyatBJosJfjBgUCJSyXks=
X-Google-Smtp-Source: AGHT+IHzof8NaUfDdDnP7TgtCX5h262vfE6qHIFSIrx9RdxqYzOXcxPfAw96KImBWf81z7VoI6U5h02DfQeD3ddfSYQ=
X-Received: by 2002:a05:6402:2696:b0:60c:6a8d:8511 with SMTP id
 4fb4d7f45d1cf-611c1da3fb7mr1963630a12.12.1752132555470; Thu, 10 Jul 2025
 00:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn>
In-Reply-To: <20250709055029.723243-1-duanchenghao@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 10 Jul 2025 15:29:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5EWp+h0R=YuTivEZEK0diDT+U2u--RPdhtYYr_KB4Z4Q@mail.gmail.com>
X-Gm-Features: Ac12FXxigZp079odwKaNADsHQGhn0sj-dnFuYku5Zvn7n6k1t9iVXJEdm5hKmcI
Message-ID: <CAAhV-H5EWp+h0R=YuTivEZEK0diDT+U2u--RPdhtYYr_KB4Z4Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Support trampoline for LoongArch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, hengqi.chen@gmail.com, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu and Hengqi,

Could you please pay some time to review this series? I hope it can be
merged to 6.17.

Huacai

On Wed, Jul 9, 2025 at 1:50=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos.=
cn> wrote:
>
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
> -----------------------------------------------------------------------
> Historical Version:
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
> Chenghao Duan (5):
>   LoongArch: Add the function to generate the beq and bne assembly
>     instructions.
>   LoongArch: BPF: Update the code to rename validate_code to
>     validate_ctx.
>   LoongArch: BPF: Add EXECMEM_BPF memory to execmem subsystem
>   LoongArch: BPF: Add bpf_arch_xxxxx support for Loongarch
>   LoongArch: BPF: Add bpf trampoline support for Loongarch
>
>  arch/loongarch/include/asm/inst.h |   3 +
>  arch/loongarch/kernel/inst.c      |  60 ++++
>  arch/loongarch/mm/init.c          |   6 +
>  arch/loongarch/net/bpf_jit.c      | 491 +++++++++++++++++++++++++++++-
>  arch/loongarch/net/bpf_jit.h      |   6 +
>  5 files changed, 565 insertions(+), 1 deletion(-)
>
> --
> 2.43.0
>
>
