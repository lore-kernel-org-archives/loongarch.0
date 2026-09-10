Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB53CF046
	for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021915; cv=none; b=jLJul97MDjIjpZMwXQxVg7DozQ3aCVDOxJO5crgvLvzoIpVSvNOWsE9RNmAVAHKunuzwNi4q23Jmbuq+Y3F0Hycqg4gjQ8HAN9oIrowptTl+EPxxUzx9b9Xzi+M4Zcp3RZ+TbQBDsI0tO+ogwt3RIQPt48p+PoSEPDblsrnQ/eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021915; c=relaxed/simple;
	bh=4Tvd6TLKSh4VlsuaCKI+5gByiR6tEcXdxBcXIv/rcnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nW9krxkK1WACeLWDKsdpVHOJlmnrkk43DsDZIBBJAGmEjfPbr0Vi6yCyuX2UjH+Ue82uIPDyYYgax2SmQr2zaN45nL+MSW47qQNBEKqkFUlQ3Bj4bnpw+zew5NuEnW76F0u1gAwMjHhP9BJNesWcFdD+OqA+gCZwbYExppW3EvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxSY3Vfk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxSY3Vfk"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so70404045ad.2
        for <loongarch@lists.linux.dev>; Wed, 09 Sep 2026 23:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021910; x=1789626710; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1toCXFJJyIGT7Bi3z+gvDkztm6+uDMf7He5yX/dqQdk=;
        b=cxSY3Vfk0vUkYvQ1DMfCUJ8ltY8t+fxnkUBmz/61U6bhqFtz4zARzb+Cl5e577OhMa
         HLaxQOKZGqRTnLA9bjEuyQiCQS5MfVTrrDXYKphxfF8oUINTU0hn4a3PXxJJyfQTvTwn
         VePMpjmznxGFjLyTCsU2GLRUVBK4t1BQa5B3f9yl+cMo8weT2ighT8GblFBHSp4uiU4T
         yA4Yyb1Q6Pz1Jzy5WzpEw2moAlYWuR44tF8M/aj5EvlP9g2tWIl00o8NUoGb6vowFHFf
         lL618/uEi2QqYeYhoCuOUe905G8Ie97l7ygG8rKxvVKTGCmsMpkhxquxsvxCK5ZCZgw4
         UvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021910; x=1789626710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1toCXFJJyIGT7Bi3z+gvDkztm6+uDMf7He5yX/dqQdk=;
        b=LuzC9xwLviFIvjAK5RMupaOJSPfpp6U2xOlj22SXq016P/BSzeZISF3DsnGQRLxaHg
         nRyG6y6ZhoWWnsZ8aRhNzL7wasn6gfPCokxpo3EBbOAIaaPa9GRUDRxOkCF3u8tCIhCt
         Xh3MoS3JnNhtY4GCiJU0TujKqJxq126/d0TtM2FjekabqaHZLIdoUmiYNl1NNjBz4qQK
         Ppa02JSsWtokaetyNIYLVokEsXb4QskG1JJKEIhn58K2Mi9hAzwvnT9jOLIDDK3TMXA7
         YevQFcn6aXP/ESNNrCBRteB8SPL6S7yy4IYKq+pVNhQA5e05c5cs1t25nPR59DIDz5x9
         vWCA==
X-Forwarded-Encrypted: i=1; AKwUvBxpt5k3CIuMPyB2qxAou0U3r90kTgP366sw5tkC2IjIOdr49cgr/NgmNVZ7qXHaEN8tPSvYF+HtL1M=@lists.linux.dev
X-Gm-Message-State: AFuF++kT8VSYaAbkcET9ANsrkQmoeuEVjgOAWuLd6pLXcv6NGWdzjj4d
	L76plAM6k5HI8BZnAmYsH/S7JqnaLfJ00ecuTJ1B7FnSTTIuEi83XIwy
X-Gm-Gg: AYBFou2B8N6iKCEQGvzed1lkXHwRWbTCdtYEalsZpf5WHup6wIaABPALeXxo2q/D7Wi
	xYIsaz+US4DoMGOpraNmTqfOa29MJOrBWH7aNvTnrTKJdHVB2IxvA5Rumoi0IsTwPiksSZI54cF
	E5S6+qKruuFYGY1yY/cdfabvgTwSWP06UEiwdPhdLeEopju30IrSvAef8jvc6R/1ZBrZic6gzVF
	1xzS9BmrtwG618751ez/1QAXucKFMiO3yVBDbdzDVyh2X29AFVV9Smx49PUIpOdW8Gw/PUJ+jch
	rczczjgT9lUL8J9T2pI/78b5goAikLu/tHt+sFkwvf3j+k/4jaOPlObPtvOnakSZLYnDv3YkPVo
	C0f71BDUc55zjS8XxziyLj0nMDf7kqpe6qzuo3m22m8I14v3T6ZA9pHITT51Hs2+zSPnErawbQq
	QORo7qaHBUcTDaTls3puDYcj/angYh2NeJkxfBE2fkv76c1li8YujKkrAyN0jgcY8aXsaEF5Uck
	wuhh6TgL7ISz/jM6LsjOAEbwbSI7kj7oTu4yZkQbI0=
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr64061526a91.11.1789021909725;
        Wed, 09 Sep 2026 23:31:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e834319sm2507639a91.10.2026.09.09.23.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:31:49 -0700 (PDT)
Date: Thu, 10 Sep 2026 12:01:26 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 01/24] elf, uapi: Add a header for relocation constants
Message-ID: <aqJOscgnnevybiKO@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-vdso-absolute-reloc-v5-1-3a93791af1cf@linutronix.de>

On Tue, Sep 08, 2026 at 08:33:35AM +0200, Thomas Weiﬂschuh wrote:
> While the numeric constants for relocations are architecture specific,
> it is still useful to get access to them from other architectures.
> Also the definitions are useful for userspace in general.
> For example tools processing elf files during a kernel cross-compilation
> can make use of them.
> 
> Introduce a dedicated header for them, similar to the elf-em.h header.
> For now the header is empty but it will be filled step by step in
> upcomming commits.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  include/uapi/linux/elf-r.h | 5 +++++
>  include/uapi/linux/elf.h   | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
> new file mode 100644
> index 000000000000..2c382c8a4807
> --- /dev/null
> +++ b/include/uapi/linux/elf-r.h
> @@ -0,0 +1,5 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_LINUX_ELF_R_H
> +#define _UAPI_LINUX_ELF_R_H
> +
> +#endif /* _UAPI_LINUX_ELF_R_H */
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index ee30dcd80901..b3e312255552 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/elf-em.h>
> +#include <linux/elf-r.h>
>  
>  /* 32-bit ELF base types. */
>  typedef __u32	Elf32_Addr;
> 
> -- 
> 2.55.0
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
