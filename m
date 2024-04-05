Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D4E15FA9B
	for <loongarch@lists.linux.dev>; Fri,  5 Apr 2024 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712309002; cv=none; b=isGC7uZqumAT55RNJGiptR6m2gkcZboe7mzQ1DyUipPu0ylXkpLg+RTtzVOTXBFWZv3TvNX1mBxLk+2sTPCh3BR5Wkzz2DAsPgwX3ZFEN6/m/rqaG+VkY0msZ0MvVY/hOdcEEnLRR1jVwlrK+BXZm+bJ/hJ7M7qrkQpEJ2iEavw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712309002; c=relaxed/simple;
	bh=1bRDGnQ98Dy9DeMf7Rucbz34Lbcn4+Nx2f9qpES7Gw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUg3w++0y1GiHhhudiAQPPcOrMdT9AGlW6xMBMjwcCxPz5s/JNRFwmIS9jw37I2U64V8feEgwHm7ZW38cid6b3pkRZNQAyadCWF62AzbpJdkRX++W4VqIwSCrYMqjPjGpVPOcEPSS9AuqRZDDEeafbPCl2/lm+BUkXVOMG/lMA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlRKCpz7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlRKCpz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F71C43394
	for <loongarch@lists.linux.dev>; Fri,  5 Apr 2024 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712309001;
	bh=1bRDGnQ98Dy9DeMf7Rucbz34Lbcn4+Nx2f9qpES7Gw4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dlRKCpz71aQ5fHw3cVfFgzI6cIqZSS57JE9yyb6PfrvHIElYO8EvWundVdVeG7XSo
	 QmqliMHpqOZevfVZCa3wMLyUm8ObP73O/L2xKiEf9yb10UAb4gFOJYmIJsLGxkNNfN
	 zI1iM7kkjZJUBmY+tfKUvs7lEh4M8Kkw1DPlLM8+IZHqhXBRuWB7Fsie3Etll/OZlw
	 DrtEQP/u0FcU1etlRGEos08pchTNOjc2S2lbV+hde/4KXDMrQTzSaSQ+y0pQIoSZ+v
	 M3xkbLijWT+iVsteojyd5J+HyMaZxc714sUDliD7s6oT2qLSdcFvuT8UAySu2+MZYF
	 UJstXOqD2SAyw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56bdf81706aso2640545a12.2
        for <loongarch@lists.linux.dev>; Fri, 05 Apr 2024 02:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpicMUpl2MC5s9e/DgehsYHxoLv9KHM2FCMI9M3p+AMmH50Tp1utomyktwSckeEJWJkg2QyZYtbkIw1RF71+OABzC2gT7J6TZl
X-Gm-Message-State: AOJu0YzOk842iV7w5CsVSiqOeXCh9crDf2PU+1HhYXFyGMltdWZwS7aB
	aHcVXk6P+5fSEE4M2UGHkbG2XMp4yJkWwLL3HfMYKuNV3NfyoR6dyMT28Tb1hCtP4qajm887/Ln
	Yfq846HUahnPudfM2mhkA25h6BuM=
X-Google-Smtp-Source: AGHT+IGcR9Secddqz+sf5M9kVG9dOvlOi3C+QIa70hz+ioTiddeUpW1r6DJPYtXrNuBTYdlIbjtlDIQ9C7kfd9NAaio=
X-Received: by 2002:a17:906:c142:b0:a47:3526:81a3 with SMTP id
 dp2-20020a170906c14200b00a47352681a3mr732056ejc.48.1712309000369; Fri, 05 Apr
 2024 02:23:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404045701.27284-1-rdunlap@infradead.org>
In-Reply-To: <20240404045701.27284-1-rdunlap@infradead.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Apr 2024 17:23:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5FOWKCB7kXQ4KT2cOc=MwucnQeK3+vPtv+QgwCQmc2sA@mail.gmail.com>
Message-ID: <CAAhV-H5FOWKCB7kXQ4KT2cOc=MwucnQeK3+vPtv+QgwCQmc2sA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: addrspace: add linux/sizes.h to prevent build errors
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Thu, Apr 4, 2024 at 12:57=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> LoongArch's include/asm/addrspace.h uses SZ_32M and SZ_16K, so add
> <linux/sizes.h> to provide those macros to prevent build errors:
>
> In file included from ../arch/loongarch/include/asm/io.h:11,
>                  from ../include/linux/io.h:13,
>                  from ../include/linux/io-64-nonatomic-lo-hi.h:5,
>                  from ../drivers/cxl/pci.c:4:
> ../include/asm-generic/io.h: In function 'ioport_map':
> ../arch/loongarch/include/asm/addrspace.h:124:25: error: 'SZ_32M' undecla=
red (first use in this function); did you mean 'PS_32M'?
>   124 | #define PCI_IOSIZE      SZ_32M
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: loongarch@lists.linux.dev
> ---
>  arch/loongarch/include/asm/addrspace.h |    1 +
>  1 file changed, 1 insertion(+)
>
> diff -- a/arch/loongarch/include/asm/addrspace.h b/arch/loongarch/include=
/asm/addrspace.h
> --- a/arch/loongarch/include/asm/addrspace.h
> +++ b/arch/loongarch/include/asm/addrspace.h
> @@ -11,6 +11,7 @@
>  #define _ASM_ADDRSPACE_H
>
>  #include <linux/const.h>
> +#include <linux/sizes.h>
>
>  #include <asm/loongarch.h>
>
