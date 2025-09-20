Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57F2AEE4
	for <loongarch@lists.linux.dev>; Sat, 20 Sep 2025 04:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758341820; cv=none; b=uW6CwlRUt8VMX8r301Sx1DagSMIUJ+ZDtghx+Dz0RDAIDc27NQNeXWyIUgkFTyT5ArkQysP/fQiYmMHAwIXSrdZBt/q1ynHpyFfEWxOccE9pUj6/iwAP7IDuf2KmrFpNhL9r/0VvfmaEwyGIQPfKPtuA0WgFDKHxysG9duhj9P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758341820; c=relaxed/simple;
	bh=tSImQ5S8KQ5zxkSXYpn9kVT5r6z9o4xsb0bBB/TBLZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+BXz45MqHQYGA5bh4673C7ijVrLg6fJeSXx4o9OTUdgl5bE6SW70I5negs57paanmSIcFV/2Oe6j/phtgT05ftawgolUEchYFLQ7yoQeq7r6LKJqaIu4PxIzsSFP3lvZkCeCzgbzjXRYQLymf+hBJmuzQoNX8iUQQkXtEYcj6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fer4Ic5o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fer4Ic5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11566C4CEFB
	for <loongarch@lists.linux.dev>; Sat, 20 Sep 2025 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758341820;
	bh=tSImQ5S8KQ5zxkSXYpn9kVT5r6z9o4xsb0bBB/TBLZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fer4Ic5ou7UCG4bODdFDoNsQT6lo9VBW2rmbZElKWtcNOp5hB/3DTYrogjf5Lm33j
	 HD0oekQITHkXBXInGkFmxKySzX9grE3N471QBIVWGGFAECQnvnF74TJCdgCN2iisFC
	 9UCrhdOXzmypiamIydih6+8VFEBJYWxIGzjNfBMTD3CJDzcrU8q/Ude2EPEJsSOZCp
	 nXzvvqRYfV23xfCPZfXfSgtRibzIJ3Xjbm3sst4Je+MKaulCTYnwNbMuPzcovCtwOr
	 LkODVXsEEmypUPpwzgZ1vUUq3K7oiI7odtmN9+CDEdo/CuG3J9DzoNXt6NWco0w1Em
	 Q+Wdnd824p+jg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so4153888a12.0
        for <loongarch@lists.linux.dev>; Fri, 19 Sep 2025 21:16:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQKFA2yOCbJckZZxytKInxn8PfXGgcuGLlKaiyMYM1xDOBWu8e+qMi/SWJQEQj/HKOcYhtz17t0MY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXSDbDlnxgz1sMEDbRkjr2LADkFH8hscBfTJTFZvdFhSqOAmYq
	OPEXHwSOD/QqjUuFzFi3tOZo+jjV2Y7k2PmyOvGNLDjGUf/JXDizQaQErebsxKHZtrEu/TLS01Z
	Ah17qYCwlksSw0+fkMLAUjPheLGU9un4=
X-Google-Smtp-Source: AGHT+IHFRYjPcFFqaQJRs/GmEbbnQLgKOjc01kovX2ViXuaMGSlL3lwb08LblWlH1Hx5WBTTbYM2HfKvlX28K/kSFhk=
X-Received: by 2002:a17:907:1b02:b0:b04:5200:5ebe with SMTP id
 a640c23a62f3a-b24f50a98f8mr555868866b.54.1758341818603; Fri, 19 Sep 2025
 21:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250919125829.37951-1-ziyao@disroot.org>
In-Reply-To: <20250919125829.37951-1-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 20 Sep 2025 12:16:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7fYA_B+XA2KU2RW7xsQmb=PFv5XFiAV3kCgLirXVijCw@mail.gmail.com>
X-Gm-Features: AS18NWADJ9hYPBmsqTOBlzxmJKewkZ7NAMZGRNjNcXdJABk07SVjb6JyhVbY_wo
Message-ID: <CAAhV-H7fYA_B+XA2KU2RW7xsQmb=PFv5XFiAV3kCgLirXVijCw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix bitflag conflict for TIF_FIXADE
To: Yao Zi <ziyao@disroot.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Thomas Huth <thuth@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 8:58=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> After LoongArch was converted to use the generic TIF bits in commit
> f9629891d407 ("loongarch: Use generic TIF bits"), its TIF_FIXADE flag
> takes the same bit with TIF_RESTORE_SIGMASK in thread_info.flags.
>
> Such conflict causes TIF_FIXADE being considered cleared when
> TIF_RESTORE_SIGMASK is cleared during deliver of a signal. And since
> TIF_FIXADE determines whether unaligned access emulation works for a
> task, userspace making use of unaligned access will receive unexpected
> SIGBUS (and likely terminate) after receiving its first signal.
>
> This conflict looks like a simple typo, let's just switch to a free bit.
>
> Fixes: f9629891d407 ("loongarch: Use generic TIF bits")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>
> Note the problematic commit is contained in next-20250918, but not
> master.
It will be more beautiful if this patch is squashed to the original one.

Huacai

>
>  arch/loongarch/include/asm/thread_info.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/thread_info.h b/arch/loongarch/in=
clude/asm/thread_info.h
> index def7cb14467e..4d7117fcdc78 100644
> --- a/arch/loongarch/include/asm/thread_info.h
> +++ b/arch/loongarch/include/asm/thread_info.h
> @@ -77,7 +77,7 @@ register unsigned long current_stack_pointer __asm__("$=
sp");
>  #define TIF_NOHZ               16      /* in adaptive nohz mode */
>  #define TIF_USEDFPU            17      /* FPU was used by this task this=
 quantum (SMP) */
>  #define TIF_USEDSIMD           18      /* SIMD has been used this quantu=
m */
> -#define TIF_FIXADE             10      /* Fix address errors in software=
 */
> +#define TIF_FIXADE             19      /* Fix address errors in software=
 */
>  #define TIF_LOGADE             20      /* Log address errors to syslog *=
/
>  #define TIF_32BIT_REGS         21      /* 32-bit general purpose registe=
rs */
>  #define TIF_32BIT_ADDR         22      /* 32-bit address space */
> --
> 2.50.1
>
