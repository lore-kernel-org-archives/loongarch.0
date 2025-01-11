Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E9E200CD
	for <loongarch@lists.linux.dev>; Sat, 11 Jan 2025 01:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736558239; cv=none; b=c2jrshBDYlytO5vxEWJM4a+W7Iu03xiLTXT+zQnlf8icGUxdkv22cQWN4bAlFX1FbvW7ms5ZJg5CNAgiEm3AZZwhSmZg7fv+NotblTaPivMKhTlmVPncNYs+QIA7CP2PwXLD1D2KNSPq7eJ2AKLDy0iwwrQ7N4MYhU4Yhr7p73E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736558239; c=relaxed/simple;
	bh=us44Uygq0YE3AaMfTOW5lXn8dsrshZ2hNa6WOsLiaUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XeLufRl8CX6z5MinBijTPVDKvyxS6Uc+SJ9i6u3+3t1VTRik2NOrpIbDxigV5oy2w5JPv7p0f7KxUEMR9H8XABP1F7JYsWyUvEjm+XRFo9CnY0mUOdDse6EG58J2FO58tLqAdBp1VgJrx9KTE3rYZF27W3xoV4j7iLr5T3JQcks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=muiE7kiQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muiE7kiQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2165448243fso51350745ad.1
        for <loongarch@lists.linux.dev>; Fri, 10 Jan 2025 17:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736558236; x=1737163036; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oFDqME3Q1nThGD1k29pkHgYDyzcQcez3iTxF/87K9DM=;
        b=muiE7kiQEPA8dR0HLxIoAniM0znqMSK2ASb0uXEeuVLFhwi0s8P/b/lJHxtTfZa1OL
         qxCXu8SsSBn5hB9EPUubhEwQMDu9cReVXlvT9BcquSQueUIf+ux5WQYL4VUC/XZM8+y6
         Z8c3cQD3LKMfVW2XU1KXdzW8VD+g4vHvHFhS7I7NIBw+bienVGqA9WY+0UikMZZK8Qm6
         QD3H/CKd70FFSYnpZKk7qndxZX09l0upOiyUfT+WXevJch0Zu5y/BYm4BxI53/FZVE71
         5/7IsP9HvmXFPKNstSqYkOl3XwJOzAsc4y0iJ0CbeGMbQ4PgxG4EOkSQt0WduiipFl+b
         PFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558236; x=1737163036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFDqME3Q1nThGD1k29pkHgYDyzcQcez3iTxF/87K9DM=;
        b=IYpao98ft6FMMiDvWrQ21q6ohY3f6ZBD4mr/aT8AvtYK7ko/UyFrmIghlmMsEstoW2
         ltpSUWdKMZlyI+K+9AMPjG+gYeqNZCp1zjkEKUjJJAAuQFzLXPUiSLOWEGxIqQO4GHu3
         eNL+ROTs8EI8KuEH3e6+pTDpVs25GZtfkpfqyjjxZERgi80XHDsbzZVcMZc9IGriv7/Y
         oIpQDuipaCBfT/VnfMPN6lyeYNYBo0YRr9+hUpQRNzO5OLrUGXdi2NLU/2uspsdwpyea
         g5zqKjA2weFny3vLXDw+mWY6rt+jCER+MohsTNb5/ShfeQR7lK0fqgVzXr0hxs1qULFy
         6Iug==
X-Forwarded-Encrypted: i=1; AJvYcCVCrFA9mfBJgSRgLqLBUKYNg8cIYkOXbdmouoiaLUjONCMPs7znN9PY1xw8PvuVF9G3Y15zGzGGrMU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA5bcatl76tQQWcR386+CXbztiSsH2ZVIjtXFwPJVjBqtaeA81
	qiCEq12QTCPYuaMyv1pC/MZv4JB4SsL8rSVZKLXs2HucNA/0TSvei7kNMfEbc7KTyRhILqcdSLN
	K
X-Gm-Gg: ASbGncvw8u2a1yjfZT5pDqZdYqGLsG2SJ9Fyb4gzUcvhrQ8cHPnecpOYFHp1OIoeK83
	6vuMtdcaGuE9KOvCn3PheyyP5sfGWodrJd+AC0ToxQ59SHPRGlSeaYxwjOHwHdxR/1IlCmN+d7S
	ueK0llmr1UKOuYJDwjG/NgmtRFbls77KxpszjByg8CkhDEBycUP7an/WIfXFzKt0jjqQXvVazUb
	ERsuvayokkOlV8W90lSgKnTfRESvgS+NdVo7e+M9D0UWVntJDETwLPvMTcsRQ7EGuWQK1VqmZO1
	A7lt4Zak8zuhGCdX8UzWZoEv//D2yDY=
X-Google-Smtp-Source: AGHT+IE452X910tVgFm5oJf0XtFxutdqQAAARDDjZaJsInDm3xqPn8tv471ky9X/6A5ID/0JjcVFfg==
X-Received: by 2002:a05:6a00:3913:b0:725:e309:7110 with SMTP id d2e1a72fcca58-72d21f1ab41mr18362201b3a.5.1736558236255;
        Fri, 10 Jan 2025 17:17:16 -0800 (PST)
Received: from [192.168.132.227] (76-14-228-138.or.wavecable.com. [76.14.228.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056ac96sm2194946b3a.65.2025.01.10.17.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 17:17:15 -0800 (PST)
Message-ID: <4931d683-bebd-4617-ac55-f40f578f2e18@linaro.org>
Date: Fri, 10 Jan 2025 17:17:12 -0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] alpha/elf: Fix misc/setarch test of util-linux by
 removing 32bit support
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
 Kees Cook <kees@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-alpha@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>,
 Sam James <sam@gentoo.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Chris Hofstaedtler <zeha@debian.org>, util-linux@vger.kernel.org,
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
 <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
 <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
 <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/25 16:16, Eric W. Biederman wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes[1]:
> 
>> There was a Spec benchmark (I forget which) which was memory bound and ran
>> twice as fast with 32-bit pointers.
>>
>> I copied the idea from DEC to the ELF abi, but never did all the other work
>> to allow the toolchain to take advantage.
>>
>> Amusingly, a later Spec changed the benchmark data sets to not fit into a
>> 32-bit address space, specifically because of this.
>>
>> I expect one could delete the ELF bit and personality and no one would
>> notice. Not even the 10 remaining Alpha users.
> 
> In [2] it was pointed out that parts of setarch weren't working
> properly on alpha because it has it's own SET_PERSONALITY
> implementation.  In the discussion that followed Richard Henderson
> pointed out that the 32bit pointer support for alpha was never
> completed.
> 
> Fix this by removing alpha's 32bit pointer support.
> 
> As a bit of paranoia refuse to execute any alpha binaries that hafe
> the EF_ALPHA_32BIT flag set.  Just to fail explicitly in case someone
> somewhere has binaries that trying to use alpha's 32bit pointer
> support.
> 
> [1] https://lkml.kernel.org/r/CAFXwXrkgu=4Qn-v1PjnOR4SG0oUb9LSa0g6QXpBq4ttm52pJOQ@mail.gmail.com
> [2] https://lkml.kernel.org/r/20250103140148.370368-1-glaubitz@physik.fu-berlin.de
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

Thanks for cleaning this up.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


> ---
>   arch/alpha/include/asm/elf.h       |  6 +-----
>   arch/alpha/include/asm/pgtable.h   |  2 +-
>   arch/alpha/include/asm/processor.h |  8 ++------
>   arch/alpha/kernel/osf_sys.c        | 11 ++---------
>   4 files changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/elf.h b/arch/alpha/include/asm/elf.h
> index 4d7c46f50382..50c82187e60e 100644
> --- a/arch/alpha/include/asm/elf.h
> +++ b/arch/alpha/include/asm/elf.h
> @@ -74,7 +74,7 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
>   /*
>    * This is used to ensure we don't load something for the wrong architecture.
>    */
> -#define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)
> +#define elf_check_arch(x) (((x)->e_machine == EM_ALPHA) && !((x)->e_flags & EF_ALPHA_32BIT))
>   
>   /*
>    * These are used to set parameters in the core dumps.
> @@ -137,10 +137,6 @@ extern int dump_elf_task(elf_greg_t *dest, struct task_struct *task);
>   	: amask (AMASK_CIX) ? "ev6" : "ev67");	\
>   })
>   
> -#define SET_PERSONALITY(EX)					\
> -	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
> -	   ? PER_LINUX_32BIT : PER_LINUX)
> -
>   extern int alpha_l1i_cacheshape;
>   extern int alpha_l1d_cacheshape;
>   extern int alpha_l2_cacheshape;
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
> index 635f0a5f5bbd..02e8817a8921 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -360,7 +360,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>   
>   extern void paging_init(void);
>   
> -/* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
> +/* We have our own get_unmapped_area */
>   #define HAVE_ARCH_UNMAPPED_AREA
>   
>   #endif /* _ALPHA_PGTABLE_H */
> diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
> index 55bb1c09fd39..5dce5518a211 100644
> --- a/arch/alpha/include/asm/processor.h
> +++ b/arch/alpha/include/asm/processor.h
> @@ -8,23 +8,19 @@
>   #ifndef __ASM_ALPHA_PROCESSOR_H
>   #define __ASM_ALPHA_PROCESSOR_H
>   
> -#include <linux/personality.h>	/* for ADDR_LIMIT_32BIT */
> -
>   /*
>    * We have a 42-bit user address space: 4TB user VM...
>    */
>   #define TASK_SIZE (0x40000000000UL)
>   
> -#define STACK_TOP \
> -  (current->personality & ADDR_LIMIT_32BIT ? 0x80000000 : 0x00120000000UL)
> +#define STACK_TOP (0x00120000000UL)
>   
>   #define STACK_TOP_MAX	0x00120000000UL
>   
>   /* This decides where the kernel will search for a free chunk of vm
>    * space during mmap's.
>    */
> -#define TASK_UNMAPPED_BASE \
> -  ((current->personality & ADDR_LIMIT_32BIT) ? 0x40000000 : TASK_SIZE / 2)
> +#define TASK_UNMAPPED_BASE (TASK_SIZE / 2)
>   
>   /* This is dead.  Everything has been moved to thread_info.  */
>   struct thread_struct { };
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 86185021f75a..a08e8edef1a4 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1210,8 +1210,7 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user *, txc_p)
>   	return ret;
>   }
>   
> -/* Get an address range which is currently unmapped.  Similar to the
> -   generic version except that we know how to honor ADDR_LIMIT_32BIT.  */
> +/* Get an address range which is currently unmapped. */
>   
>   static unsigned long
>   arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
> @@ -1230,13 +1229,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>   		       unsigned long len, unsigned long pgoff,
>   		       unsigned long flags, vm_flags_t vm_flags)
>   {
> -	unsigned long limit;
> -
> -	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
> -	if (current->personality & ADDR_LIMIT_32BIT)
> -		limit = 0x80000000;
> -	else
> -		limit = TASK_SIZE;
> +	unsigned long limit = TASK_SIZE;
>   
>   	if (len > limit)
>   		return -ENOMEM;

