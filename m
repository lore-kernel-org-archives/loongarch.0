Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD07C262D0C;
	Thu, 20 Nov 2025 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763637309; cv=none; b=usIHewXToFsWenOoKjiT1pPSCLvZOoF8q4zXam0JIhqKp+zjf2NUsPUm8eqb4gwgwy6COuMEntp+5JE2krVFjUFPbnTJWWNwEW+sU2hHVyzC+8krI+8+om6UsUjoIkm4SOHliZO4JEAZAM0edTrgo4Slf01szuZb8Kf1jg5q/PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763637309; c=relaxed/simple;
	bh=1Vg6DYW+hexc0MOfOWaOfb6WSnHE1cmSsy2nZHtVuwA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NSpeAdpLXfWWSgEEoORizOGPE9HI4Nx9nBqWbACnKbKGQu2TBTZOsXXnANJEOXV3hnN9XuK5+W/iVUmpYzNQ4IO4pHRUIGIZOfORK3LaeE7HOv8aMJxwkx13KxfXmqFkSPFSjiMKL5tQ0upFjVk+Ggts+9ucZGeyg3+GQLL8I5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=Z7nA1sfC; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="Z7nA1sfC"
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vM2cu-008aFj-3I; Thu, 20 Nov 2025 12:15:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=hS5k0J5KvFdKpV/+fNT+O4qCedTtvZpjST6nhDci7ts=; b=Z7nA1sfCM2SxNoVTfCPFmu01Za
	iLYeIxy1IvKw4vWQyxB+efWfKZnce3FUTxYgj8UD7vivyh6upmlIcKdbRSFLFcvRKdqsfSguLCUmP
	R5bP5IDjLDIb1SRntG7F20+ZO2XsGbbjnSI8sY1AdfriWOG0uNxP2BaT4h3A+i7G2Gkho3bi+2jOB
	ogYoSlztlXtIXDMwLQidKxBlTd2bbaos4FcqROaXaVsqElF+7e6Bti4rg+hxgiWrWd7/RdRkGtaQS
	vQUe5Z9L62mi+nads7NznZe3yiCxeamwHE163XNd/CVG0ij3l1a/EXFk7IwCWwl0UsEAKhBXfhuAY
	La4hKfSA==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vM2cs-00028n-1f; Thu, 20 Nov 2025 12:14:58 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vM2cX-00H2uu-Ga; Thu, 20 Nov 2025 12:14:37 +0100
Date: Thu, 20 Nov 2025 11:14:35 +0000
From: david laight <david.laight@runbox.com>
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, George Guo
 <guodongtai@kylinos.cn>
Subject: Re: [PATCH 1/2] LoongArch: Add 128-bit atomic cmpxchg support
Message-ID: <20251120111435.1382b52e@pumpkin>
In-Reply-To: <20251120-2-v1-1-705bdc440550@linux.dev>
References: <20251120-2-v1-0-705bdc440550@linux.dev>
	<20251120-2-v1-1-705bdc440550@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Nov 2025 15:45:44 +0800
George Guo <dongtai.guo@linux.dev> wrote:

> From: George Guo <guodongtai@kylinos.cn>
> 
> Implement 128-bit atomic compare-and-exchange using LoongArch's
> LL.D/SC.Q instructions.
> 
> At the same time, fix BPF scheduler test failures (scx_central scx_qmap)
> caused by kmalloc_nolock_noprof returning NULL due to missing
> 128-bit atomics. The NULL returns led to -ENOMEM errors during
> scheduler initialization, causing test cases to fail.
> 
> Verified by testing with the scx_qmap scheduler (located in
> tools/sched_ext/). Building with `make` and running
> ./tools/sched_ext/build/bin/scx_qmap.
> 
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/include/asm/cmpxchg.h | 46 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
> index 979fde61bba8a42cb4f019f13ded2a3119d4aaf4..5f8d418595cf62ec3153dd3825d80ac1fb31e883 100644
> --- a/arch/loongarch/include/asm/cmpxchg.h
> +++ b/arch/loongarch/include/asm/cmpxchg.h
> @@ -111,6 +111,43 @@ __arch_xchg(volatile void *ptr, unsigned long x, int size)
>  	__ret;								\
>  })
>  
> +union __u128_halves {
> +	u128 full;
> +	struct {
> +		u64 low;
> +		u64 high;
> +	};
> +};
> +
> +#define __cmpxchg128_asm(ld, st, ptr, old, new)				\
> +({									\
> +	union __u128_halves __old, __new, __ret;			\
> +	volatile u64 *__ptr = (volatile u64 *)(ptr);			\
> +									\
> +	__old.full = (old);                                             \
> +	__new.full = (new);						\
> +									\
> +	__asm__ __volatile__(						\
> +	"1:   " ld "  %0, %4          # 128-bit cmpxchg low  \n"	\
> +	"     " ld "  %1, %5          # 128-bit cmpxchg high \n"	\
> +	"     bne     %0, %z6, 2f			     \n"	\
> +	"     bne     %1, %z7, 2f                            \n"	\
> +	"     move    $t0, %z8				     \n"	\
> +	"     move    $t1, %z9				     \n"	\
> +	"     " st "  $t0, $t1, %2                           \n"	\
> +	"     beqz    $t0, 1b                                \n"	\
> +	"2:                                                  \n"	\
> +	__WEAK_LLSC_MB							\
> +	: "=&r" (__ret.low), "=&r" (__ret.high),			\
> +	  "=ZB" (__ptr[0]), "=ZB" (__ptr[1])				\
> +	: "ZB" (__ptr[0]), "ZB" (__ptr[1]),				\
> +	  "Jr" (__old.low), "Jr" (__old.high),				\
> +	  "Jr" (__new.low), "Jr" (__new.high)				\
> +	: "t0", "t1", "memory");					\

I'd add symbolic names for the asm registers to it easier to read.
eg: [ret_low] "=%r" (__ret.low) and replace %0 with %[rel_row]

	David

> +									\
> +	__ret.full;							\
> +})
> +
>  static inline unsigned int __cmpxchg_small(volatile void *ptr, unsigned int old,
>  					   unsigned int new, unsigned int size)
>  {
> @@ -198,6 +235,15 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, unsigned int
>  	__res;								\
>  })
>  
> +/* cmpxchg128 */
> +#define system_has_cmpxchg128()		1
> +
> +#define arch_cmpxchg128(ptr, o, n)					\
> +({									\
> +	BUILD_BUG_ON(sizeof(*(ptr)) != 16);				\
> +	__cmpxchg128_asm("ll.d", "sc.d", ptr, o, n);			\
> +})
> +
>  #ifdef CONFIG_64BIT
>  #define arch_cmpxchg64_local(ptr, o, n)					\
>    ({									\
> 

