Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625A218638;
	Sat, 15 Jun 2024 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718441141; cv=none; b=Q13BT3PxT9ILiyJFJwtLBe7k1z6O/Pw562GDh+x4SOkPx8HccoxZDqmWte7z6UV5lSuSfvSb5pVFnLXHwtrhbxhbi//hAryHKWf02Qpvmjl0TDRRCNpTcYJkovKgPOIKg/DNcmrhUO8VLDm+i+w1U6kgpsng/7qss1lGYL4+9/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718441141; c=relaxed/simple;
	bh=GdLmPax7aWiaByiSGY+x7MgyDxVdt9d2Knc1iA0FO3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itzB8reQJfVr9GfHSZ+RjheTrG+KB/7a2SAHM+tPRB6NYtMWeoddIsZHhPHUcCYVZlof72Sdf86YI285YI0mZj3GXN72prew+3X3Qp56pn/CMDMEK70XYIOcsYO1lP8tKLAvlM23LFGVUDzZEg0p+S0qV+YAUsj6xfmzQ3t1ejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMpItWwv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMpItWwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E81C4AF48;
	Sat, 15 Jun 2024 08:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718441140;
	bh=GdLmPax7aWiaByiSGY+x7MgyDxVdt9d2Knc1iA0FO3w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aMpItWwvJgnpkAOQeCyLBgqLctYaWoJYcR3Dr/9gHMfLIfu+NqXiMcZ0qdi5zgPhq
	 DRn6/ha8jSVxlMZBSBytIexowTeSuYpYvye1KrE2qs8jaZ8p0/HyFe2xzqSZ6SDxRU
	 8wv8x5B6E8jC4hx+ZjXaT/WKR+Xpe2JdCM5MyHcwwNz1A+xeowitt4K1voVzuRNQIH
	 bP7xiD4Q6eETxMgYz7zbFMy0tRpCXjyQIUoZIuOOAb0K6L2imq/oSdZ9TNNbszqVwv
	 0Vta5HvOzCAu5cw2tcpZi7DRkqLHg1lMttsFMpf0ARbWkumf4CvqmWHlTFVNa2fwBT
	 VYmuUWCxB9S8g==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ebd95f136bso31151621fa.0;
        Sat, 15 Jun 2024 01:45:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTFxEbOiio56vF9KUj4txoJH6H3V6We8WilG1dQ+KA3Go1OHskkEh9oVaOOqt/P6X9tRQzIalxk9f/RA9iFRD/YFt0mUyiV9lw8VJwIeGJR4cVjYGXx9XW8GG2VLj6+w==
X-Gm-Message-State: AOJu0YyZZB7z/SDw5yHOxfqhq8T4XtbbCJFw7rfxGHb/AH7f3W9YtY6H
	OK+kIz4nnZA3gHUFMegv1Gr0qtgGELR1oBt3EzY20yt8L9NFvu8sixdE0K8rbfONjlwxGwtBYUB
	JLi1gXhM/ygCLpbuPA+DVpvzKuh0=
X-Google-Smtp-Source: AGHT+IEVM22B/EuKUmrelPZLEXzizCVWyeA9QiNIHwKIOQYWvp6+DfuEyUVZbFamRHdNm2nfmNSC4hDTvVd3JQbS0No=
X-Received: by 2002:a2e:9cc8:0:b0:2eb:fd86:f141 with SMTP id
 38308e7fff4ca-2ec0e5b87f8mr29134151fa.6.1718441139247; Sat, 15 Jun 2024
 01:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240604150741.30252-1-xry111@xry111.site> <20240605054328.GA279426@thelio-3990X>
 <b55b8cb2c52f2c3701c83353586130b8dc237ee2.camel@xry111.site>
 <20240605062548.GF279426@thelio-3990X> <f8ef61773b0119b8573fc0fed9ad0a8b43061efd.camel@xry111.site>
 <444ec2031ef6ca016cbfa8dfedc51bddc8529ba7.camel@xry111.site>
 <ada035690e446909c3cdbf9a43a92def96020615.camel@xry111.site>
 <82b7e6ea-c2cb-6364-ebe9-bff928028408@loongson.cn> <1c132209a612e2e8953f0b458fc01853120db9a9.camel@xry111.site>
 <2bf11cd2-8449-acda-f5ad-659c38cb018e@loongson.cn> <96a2e8a80c06772b64fcbdba42e1dae2d68a53a7.camel@xry111.site>
 <2bd6ae20-ec56-c1a2-c5dd-e8c978a376d3@loongson.cn> <329dac82e09dfc75e77ae93ebbeacdec1dc9ff7f.camel@xry111.site>
In-Reply-To: <329dac82e09dfc75e77ae93ebbeacdec1dc9ff7f.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 15 Jun 2024 16:45:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Wz=U4kbX+tXt1qoCr6RaEDkzZXV7B=tgU_8o+X-NtVQ@mail.gmail.com>
Message-ID: <CAAhV-H5Wz=U4kbX+tXt1qoCr6RaEDkzZXV7B=tgU_8o+X-NtVQ@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Only select HAVE_OBJTOOL and allow ORC
 unwinder if the inline assembler supports R_LARCH_{32,64}_PCREL
To: Xi Ruoyao <xry111@xry111.site>
Cc: Jinyang He <hejinyang@loongson.cn>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, WANG Xuerui <kernel@xen0n.name>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Youling Tang <tangyouling@kylinos.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, mengqinggang@loongson.cn, 
	cailulu@loongson.cn, wanglei@loongson.cn, luweining@loongson.cn, 
	Yujie Liu <yujie.liu@intel.com>, Heng Qi <hengqi@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ruoyao and Jinyang,

On Fri, Jun 7, 2024 at 4:29=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrote=
:
>
> On Fri, 2024-06-07 at 15:14 +0800, Jinyang He wrote:
> > >      Note: on RISC-V and LoongArch, the stack slot for the previous f=
rame
> > >      pointer is stored at fp[-2] instead of fp[0]. See [Consider
> > >      standardising which stack slot fp points
> > >      to](https://github.com/riscv-non-isa/riscv-elf-psabi-doc/issues/=
18)
> > >      for the RISC-V discussion.
> >
> > In most cases the $fp is saved at cfa-16. But for va args, something
> > becomes different at LoongArch (I do not know the case of riscv), the
> > $fp isn't saved at cfa-16. (e.g. printk?)
>
> Oops indeed.  Even with a very simple case:
>
> int sum(int a, int b) {
>         return a + b;
> }
>
> with -fno-omit-frame-pointer we get:
>
> sum:
>         addi.d  $r3,$r3,-16
>         st.d    $r22,$r3,8
>         addi.d  $r22,$r3,16
>         ld.d    $r22,$r3,8
>         add.w   $r4,$r4,$r5
>         addi.d  $r3,$r3,16
>         jr      $r1
>
> So for leaf functions (where we don't save $ra) $fp is saved at cfa-8.
>
> > I feel that the update_cfi_state should be arch specific. I believe
> > that some logic can be reused, but each arch may have its own logic.
>
> I agree it now.
What is the conclusion about the clang part now? And for the original
-mno-thin-add-sub problem, do you have some way to fix it in the root?
I think we needn't rush, there are some weeks before 6.10 released.

Huacai

>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
>
