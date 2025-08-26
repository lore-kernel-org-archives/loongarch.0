Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB7E2F8BC3
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197639; cv=none; b=P2RdDBM4YrqLEapOcR7ydRqkMHiGnhvGBhkOMJELLSr3G1maRs9KhE9qXZBblvNzIHRcwrUTTdV9qCoGZk3B+V/vdhqx8B0h+Vq9kirRlNO2oayAXtamKtdEWZrOaqf7kUkbM2Til6bpEZFTldJuFm1+BTklsf/r8aXGdWto4Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197639; c=relaxed/simple;
	bh=ml7uVD5DRcxn+9bX3pvVGLbn5/HLiqMsHxdVboS7fR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtwThoLCYI66uglSTEqbSQ2at8JA01kVXwUGJ/ep4npuqPqYkSBARSwwyZuOPoscOoRomNQz41jFSqJ/Mf0YY+vNotwnkiwCtV16c6941y90bZykjnM14OvPtANA/aXmN5RgKLC9RSRDOCVrqCNgkZ6L8rCITSpIE5mb3HucLTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXHa2+p7; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXHa2+p7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6188b5ae1e8so6262759a12.0
        for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 01:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756197636; x=1756802436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUznInQ+he7CTGLbKkCgI51NqCENsR+GsS1zL5TwQYs=;
        b=KXHa2+p7YOWyQFhLmsy4VLpcU6o91RA0RsgG845pEhE2rCwC0AF8wzYM02ZXlI3Uwj
         bp7dCARfS3kntEeOuz+xdWuHJj9dTfFun4lEvYp5GsXWh3R7K20dkeIluzetZ3xyrSTN
         lT8eUYaVX1L3fdL69rWTgCLbDgItQpNvaL3cf/qiHrTHWsICqaE4/MuT0xPH6Qkq4uGq
         Mnkpvm/P3rDlB/1z6uQDlt3Wugdu2wbVNnsJiuSEAIh2JBiBwWHLFGOz3hxikEJWkDv6
         FyutZ+GcAEuSD6WK6kwG7AKh2IzGl8zmPOq2w6vxyTyWZ7op5dIPLn8C8n0VvyVawEKu
         XAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756197636; x=1756802436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUznInQ+he7CTGLbKkCgI51NqCENsR+GsS1zL5TwQYs=;
        b=deyW665FPWFmOQwMm/WuzO2lacU8RH1J0OrfKb2DCVSnWWWNgBZ67v6vjnTrN+LSo5
         ttpcPS6Szf996uFIPVpTdrGxSfFW4fwyK1B0FsKBiYfH5KZBmwSJQfPX+ZPxSbyTqM6j
         o1G49rEQLZsgX6zoIMfrCfeqr2JYt54yK873V1n6zeEYTPPJhDa3gAf5Bx2LOEBW7J36
         BIwhoMT96baup+oO3NhHRi/f5FMYN2QyU4TzNyccl3iMqZbyObkE4iRueYVmOeMxBudm
         B6PTiCE0jkBgj6FpaqJUkRYvRJBw5JVANCFZUiQ6AmIos2w6tD96TE0tmPi5JV+tZRmV
         MqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFFK9c1tfa+wD0H0PfNnJ/DWEH8MxEemqs6SnSSYZUJvIPi+BfaEjFNxZCkwc6a2r5WFwOcnoCypc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd1VZdH2S18WW1um4d7yNce0iOVZsU+e2rToZbNUcHVJMdXbV9
	ohkbugnH7qFMDsbq0JJxwouadYFTH9hLXaiIeI9o/Tj7uFvzLUhD97F8QE2jXhEAB0epBbTEH1S
	YjgMhOccwWWqgB6xoadni+ERJ00YtHnIW0TiWuUYHqA==
X-Gm-Gg: ASbGnctIy4slt3AIyr+07+TF80z8WRf/0At8mjTATNHVagrWtFs1wRtorG4R10AICRx
	ljzUSg8LxHinWM7bRcVa9/x4LD35ZOOP1lHcsroiNdbFVwLnO5iLaK11TVLJ5GvU2kRksyCZybz
	oUg3aOtNJfr1mHViXTL1F3Eg8gicsoOMpX1N4DTF5nmylvcGeVq0ATU9LUqozLy7uBDaje8zAlB
	5IR8QVPpid8OJ9a0sP5jzd8NZNMlrzXBW/YZV2Y8umxOGpat08OnXN/mOTOqpkye3tzyU6KzmK5
	1QvKEoP23b5kIiNk7Fg+R409pbtc1pVGV/C6LP30rqdRlOwtjaKJPfQ=
X-Google-Smtp-Source: AGHT+IFViBToBz8KQVACO+Zo3R9SVs9VHYtIQ/Gqv75jKhOBsfcB/SlIujQazaI+0CvTngCa+ykKREpzxIkr0qUtXws=
X-Received: by 2002:a05:6402:21c1:b0:61b:ff85:398b with SMTP id
 4fb4d7f45d1cf-61c1b4a2163mr12823828a12.14.1756197635743; Tue, 26 Aug 2025
 01:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819111953.3197428-1-chenhuacai@loongson.cn> <1378057e-4fc1-2bcd-4d60-1a10bd98e5bb@loongson.cn>
In-Reply-To: <1378057e-4fc1-2bcd-4d60-1a10bd98e5bb@loongson.cn>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Tue, 26 Aug 2025 16:40:21 +0800
X-Gm-Features: Ac12FXxf-4Mbv86G81MkWYAbsoZgs8HhVE-23zzhyxDMTXP0prtcdtpVv3BGBGs
Message-ID: <CAAhV-H7UnPBpa7jK4WwqQJGnAP+cnsoggxkt1T3spoed4OfkTw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Fix uninitialized symbol 'retval_off'
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, bpf@vger.kernel.org, 
	Hengqi Chen <hengqi.chen@gmail.com>, George Guo <guodongtai@kylinos.cn>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, loongarch@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 3:08=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/8/19 =E4=B8=8B=E5=8D=887:19, Huacai Chen wrote:
> > In __arch_prepare_bpf_trampoline(), retval_off is meaningful only when
> > save_ret is not 0, so the current logic is correct. But it may cause a
> > build warning:
> >
> > arch/loongarch/net/bpf_jit.c:1547 __arch_prepare_bpf_trampoline() error=
: uninitialized symbol 'retval_off'.
> >
> > So initialize retval_off unconditionally to fix it.
> >
> > Fixes: f9b6b41f0cf3 ("LoongArch: BPF: Add basic bpf trampoline support"=
)
> > Closes: https://lore.kernel.org/r/202508191020.PBBh07cK-lkp@intel.com/
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   arch/loongarch/net/bpf_jit.c | 9 ++++-----
> >   1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index abfdb6bb5c38..a73f6ea4ed4a 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -1504,11 +1504,10 @@ static int __arch_prepare_bpf_trampoline(struct=
 jit_ctx *ctx, struct bpf_tramp_i
> >       stack_size +=3D 16;
> >
> >       save_ret =3D flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FEN=
TRY_RET);
> > -     if (save_ret) {
> > -             /* Save BPF R0 and A0 */
> > -             stack_size +=3D 16;
> > -             retval_off =3D stack_size;
> > -     }
> > +     if (save_ret)
> > +             stack_size +=3D 16; /* Save BPF R0 and A0 */
> > +
> > +     retval_off =3D stack_size;
>
> Just init retval_off as 0 at the beginning of this function?
> What is the difference? which is better?
This patch is more like ARM64 does.

In addition, if save_ret is true, "init retval_off as 0" causes
retval_off to be evaluated twice, while this patch is only evaluated
once. But surely this is not a big deal.

Huacai

>
> Thanks,
> Tiezhu
>
