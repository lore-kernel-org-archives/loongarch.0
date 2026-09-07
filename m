Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE8C4CA29E
	for <loongarch@lists.linux.dev>; Mon,  7 Sep 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789944; cv=none; b=W6GPPzdCmfMrURQsAOOoMk3JSDiv5GpsNYDKKyfpf05sI0arULID/kUotn4IFvCFbPSdcaXCCORaY7W1lQ+hIWy4vLwXZHUuDcNjRKiGBndtzAHP+rAJLCDDn6qgGvU4GXs6eXt+eVkknc+SMcXH+HiGpQFlfxQ6fEpka8ywpv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789944; c=relaxed/simple;
	bh=wnXSaGKIkgNw5FXdj1eClPdWMhPCH5UarkCydfrn1kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnji4FAPmkN7P9AAb1WFqueF6H1idx0Y1YGkprSR7IcscpF/J0Jh1HNg7qe7VBviSPNcbx2h1IGI4PVqGfUEcFNiH5p5r01ufeP6z7uDg9R2HalkV0yayPurDtVXyKC9huzhrc/J/3ay1TwpHTTfb3kLt0/Wou7806PdEavfhtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyoR6vUa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyoR6vUa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B18D1F00A3D
	for <loongarch@lists.linux.dev>; Mon,  7 Sep 2026 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788789942;
	bh=J8wgTvZrkyOjbsQqIGG8z/GcZBW64PcNCuag9I7xU18=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jyoR6vUapKR5jhLivfmjBARU8B+F+OcyChINsEiyQcmcncqmoFh4nR/WY1xMB4qbW
	 SZ6/c1u/JlA4H5CX7f7mlQ5R5r6FFJHSnxuNy68TOL7Exjt9L/8POCTmlIZek5NDf/
	 vSQEPBTauZHGg2dpZN0RAsf8QHru/GLRGxXYBNPhH557FULtQLKshtNyFaJ1TLf/FR
	 VGO2DtvomYcv02EDInTSZEUOULBvYtXC+eZfgGqXpn1gPpLf/be4t5h3x0JZUmfEJH
	 j+M5kMyrlnOjjNbLDdri8qTidxOrlcEQQvkPs8w7ifuMeVCQ/Hmb/aPT2UlzUZZvC8
	 CXYUXx3AtE5dA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a61910369bso3802900a12.0
        for <loongarch@lists.linux.dev>; Mon, 07 Sep 2026 07:05:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlc+zJ8MGs86CyficHSoja8Ro0nR5wc4ipfeXBSOtSh5uKZ/Wq5DVow35ZBrMizeoP0oClh2OAXTc=@lists.linux.dev
X-Gm-Message-State: AFuF++litiSCkUFF62knC4qs8W1fhYb2NZQiu8OWyM5wlE+QByw5FdAt
	BjAPWoWd9gelgFkqJON1X8YubD3+hlzy0tQtEd4YIjsuTILRdBNPXyIseDgEJXr6hSLzQZLjCUQ
	LWKpFRuUYGA0rj5nH7uCaC6r3k+DTHzY=
X-Received: by 2002:a05:6402:44db:b0:6a6:7fa6:f0ac with SMTP id
 4fb4d7f45d1cf-6a7e8f9e843mr12416286a12.22.1788789941040; Mon, 07 Sep 2026
 07:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907125404.922123-1-ruanjinjie@huawei.com> <20260907125404.922123-6-ruanjinjie@huawei.com>
In-Reply-To: <20260907125404.922123-6-ruanjinjie@huawei.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 7 Sep 2026 22:05:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7qjJ7BPnJ2KoQZSyMUvX_6i9H=EfdadXnmXtNiiB4ROA@mail.gmail.com>
X-Gm-Features: AcwNN1WbqzVfALnNIkIUg_l9MiYgRfsYFTxDDEyu_aV6t47lWMUK_7ZDBokn7zg
Message-ID: <CAAhV-H7qjJ7BPnJ2KoQZSyMUvX_6i9H=EfdadXnmXtNiiB4ROA@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] LoongArch: kexec_file: Fix CMA page leaks in
 segment placement retry loops
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org, 
	baoquan.he@linux.dev, rppt@kernel.org, pasha.tatashin@soleen.com, 
	pratyush@kernel.org, ruirui.yang@linux.dev, kees@kernel.org, thuth@redhat.com, 
	jic23@kernel.org, tan.shaopeng@jp.fujitsu.com, zengheng4@huawei.com, 
	james.morse@arm.com, ardb@kernel.org, leitao@debian.org, yeoreum.yun@arm.com, 
	sourabhjain@linux.ibm.com, robh@kernel.org, coxu@redhat.com, 
	tangyouling@kylinos.cn, hbathini@linux.ibm.com, adityag@linux.ibm.com, 
	djbw@kernel.org, seanjc@google.com, liaoyuanhong@vivo.com, 
	vishal.l.verma@intel.com, fuqiang.wang@easystack.cn, makb@juniper.net, 
	piliu@redhat.com, ebiggers@kernel.org, jbouron@amazon.com, 
	mclapinski@google.com, me@linux.beauty, graf@amazon.com, bgwin@google.com, 
	takahiro.akashi@linaro.org, palmer@rivosinc.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jinjie,

On Mon, Sep 7, 2026 at 8:53=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:
>
> During kexec image placement retry loops, any midway failure causes
> the loader to truncate `image->nr_segments` back to its initial state
> to purge the failed segments.
>
> However, this truncation introduces a memory leak. The CMA pages
> allocated via kexec_add_buffer() during the failed attempt are tracked
> in the `image->segment_cma` array. Because the subsequent cleanup paths
> only iterate up to the truncated `nr_segments` boundary, these allocated
> CMA pages outside the new boundary are permanently leaked.
>
> Fix this by explicitly releasing the associated CMA buffers in
> the failure paths before `image->nr_segments` is reduced.
I'm not sure but does the elf version have similar problems as the efi vers=
ion?

Huacai

>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Youling Tang <tangyouling@kylinos.cn>
> Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/patchset/20260729031235.2840255-1-ruanjinjie%=
40huawei.com
> Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/loongarch/kernel/kexec_efi.c          | 1 +
>  arch/loongarch/kernel/machine_kexec_file.c | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/kexec_efi.c b/arch/loongarch/kernel/ke=
xec_efi.c
> index 5ee78ebb1546..15fd797ff3de 100644
> --- a/arch/loongarch/kernel/kexec_efi.c
> +++ b/arch/loongarch/kernel/kexec_efi.c
> @@ -86,6 +86,7 @@ static void *efi_kexec_load(struct kimage *image,
>                  * We couldn't find space for the other segments; erase t=
he
>                  * kernel segment and try the next available hole.
>                  */
> +               kexec_free_segment_cma(image, kernel_segment_number);
>                 image->nr_segments -=3D 1;
>                 kbuf.buf_min =3D kernel_segment->mem + kernel_segment->me=
msz;
>                 kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/=
kernel/machine_kexec_file.c
> index 5412aa9f3568..62a5be102065 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
> @@ -217,7 +217,11 @@ int load_other_segments(struct kimage *image,
>         return 0;
>
>  out_err:
> -       image->nr_segments =3D orig_segments;
> +       while (image->nr_segments > orig_segments) {
> +               kexec_free_segment_cma(image, image->nr_segments - 1);
> +               image->nr_segments--;
> +       }
> +
>         kfree(modified_cmdline);
>         return ret;
>  }
> --
> 2.34.1
>
