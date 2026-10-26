Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793057846;
	b=4qe0ACu/pLUAHpl54GX0kp36gGbuoRSiBhm4k2i7zu5TKwi00ZEgq2ZLtjBkYGjeq+lr
	 5+KMm8CEDhWAW1SWUfjfI7Cs3zOI4CMWoHqTmNQinoNGUbN81jKf8hCPLPdb46OH7JGqo
	 r8NpbeXaf8haEsYqPy6Mo0pkqjEa+sHo9aHnYNxUQSt/6HRByN+137+bN6tfpYPeCH4iy
	 KO7w2bbsZzMCuaKGoTyGxlJBVPlDgPXfEVewFQpZKsfF/vrf8Tm/fjSHbd0rdhw50UE5Y
	 B/ddFhAiMmdudGobAisbBjy56g6Nu/mM5u/bg5fqBaJZcsbT2lAgd+SzY6DqaJ2iQ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057846;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=AaIKpNQIfrPFCLzEZEdAzQkcvbKlpQn4hnvsROxpiMY=;
	b=Yl03JmT1GwR2kCdovTO6ejtV4/PnG5U3XmwXMm5Kb1DRQH2AMVgSVrIuKKsxll5D74us
	 AWzmcHp+Zmh+sUkgvzLEgKelZ1ODxNHRkF/8vq5HlBGXUcnDWsOkD9bRd8nMosd0mtlq/
	 9u6RudRAAdhfkc1sBksHdVxriyQu11MFLgH2KY5D4PNRsKYlSwrhDZHSnnz3ecHoajMIW
	 tvtXVMBa2fMsFVxZn0V6l2xZFWorYld0LbkNou9RN5ML2yzoxz5W+9YWg0QgdS1MF2ioh
	 ELBQ8YT6w6tU9ZJEPZ9hwRGkA/NGYmxzaNjhKcIyHpKBqcCA0Z1XPNIqj9WpT6H0Niw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJwK65r+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5EC606A31A;
	Mon, 26 Oct 2026 23:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJwK65r+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD561F01825;
	Mon, 26 Oct 2026 23:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793057846;
	bh=AaIKpNQIfrPFCLzEZEdAzQkcvbKlpQn4hnvsROxpiMY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DJwK65r+TF98CR0XU61DdWXVtta/a6jIbkXuzfO6PqzzHoDnEgdUjiYtXtMSX2/J2
	 kGMJ0advjeJEuw2Gd8nPsb88xU7Z/ZMPnLe8IobavNran7oy1AhHpk8YsFEpp/Och4
	 DUayQTzCDYFY43rnbPmuTdqTJWRLtO/GJdYNx9lHq79Hb9gvtgOqRvRrhzXjd4pCpj
	 GmDqXijEswRtMywpI+zsX4aXtY0dtsJokdxrBp9rs2libGGkzysrtR8iq2S0zDp7jn
	 d9IblYj4DjGYTbZ3OUutP6HHlEUUZF5PbiQfoJ05S3Z8b5HOo1IiK5ZnW68rmZh9Y7
	 EpEcCxMypojUw==
Message-ID: <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
Date: Tue, 27 Oct 2026 00:37:13 +0100
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <at_f43oDv73y-t7O@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/26 00:25, Kiryl Shutsemau wrote:
> On Mon, Oct 26, 2026 at 06:45:48PM +0100, David Hildenbrand (Arm) wrote:
>> On 2/27/26 20:42, Kiryl Shutsemau (Meta) wrote:
>>> From: Kiryl Shutsemau <kas@kernel.org>
>>>
>>> With fake head pages eliminated in the previous commit, remove the
>>> supporting infrastructure:
>>>
>>>   - page_fixed_fake_head(): no longer needed to detect fake heads;
>>>   - page_is_fake_head(): no longer needed;
>>>   - page_count_writable(): no longer needed for RCU protection;
>>>   - RCU read_lock in page_ref_add_unless(): no longer needed;
>>
>> I have an AI report that removing RCU read-lock was wrong.
> 
> Ughh. Yes, it is a real bug.
> 
> My reasoning in the commit message was wrong. Nothing stops a
> speculative get from writing to one after the remap. On x86 even a
> failing cmpxchg faults there.
> 
> The fix I have in mind is to let the atomic fault.
> 
> If the update faults, the struct page is a read-only HVO tail with a
> zero refcount, so the get just fails. An exception table entry on the
> cmpxchg handles it. No RCU on either side, and the fast path stays the
> same lock cmpxchg loop.
> 
> Only x86, riscv and loongarch have HVO. Below is x86 only, to show the
> idea; riscv and loongarch need the same primitive in their LL/SC
> fetch_add_unless().
> 
> Lightly tested on x86 by hitting a real HVO tail page.
> 
> Does it look sane?

I'm sure x86 folks will have an opinion :) . Let me CC them whether something
like that would be acceptable.

> 
> I can prepare a proper patchset if looks reasonable.
> 
> diff --git a/arch/x86/include/asm/atomic.h b/arch/x86/include/asm/atomic.h
> index 75743f1dfd4e..5252b1382ed0 100644
> --- a/arch/x86/include/asm/atomic.h
> +++ b/arch/x86/include/asm/atomic.h
> @@ -108,6 +108,25 @@ static __always_inline bool arch_atomic_try_cmpxchg(atomic_t *v, int *old, int n
>  }
>  #define arch_atomic_try_cmpxchg arch_atomic_try_cmpxchg
>  
> +/*
> + * arch_atomic_fetch_add_unless_nofault() is arch_atomic_fetch_add_unless(),
> + * except that a fault on the access jumps to @label instead of oopsing.  It
> + * works in any context, including with IRQs disabled.
> + */
> +#define arch_atomic_fetch_add_unless_nofault(_v, _a, _u, label)	\
> +({									\
> +	atomic_t *__v = (_v);						\
> +	int __a = (_a), __u = (_u);					\
> +	int __c = arch_atomic_read(__v);				\
> +									\
> +	do {								\
> +		if (unlikely(__c == __u))				\
> +			break;						\
> +	} while (!__try_cmpxchg_nofault(&__v->counter, &__c,		\
> +					__c + __a, label));		\
> +	__c;								\
> +})
> +
>  static __always_inline int arch_atomic_xchg(atomic_t *v, int new)
>  {
>  	return arch_xchg(&v->counter, new);
> diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
> index a88b06f1c35e..685aab3edd3f 100644
> --- a/arch/x86/include/asm/cmpxchg.h
> +++ b/arch/x86/include/asm/cmpxchg.h
> @@ -232,6 +232,63 @@ extern void __add_wrong_size(void)
>  #define arch_try_cmpxchg_local(ptr, pold, new)				\
>  	__try_cmpxchg_local((ptr), (pold), (new), sizeof(*(ptr)))
>  
> +/*
> + * __try_cmpxchg_nofault() is arch_try_cmpxchg() on a 4-byte kernel variable,
> + * except that a fault on the access jumps to @label instead of oopsing.
> + */
> +#ifdef CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
> +#define __try_cmpxchg_nofault(_ptr, _pold, _new, label)		\
> +({									\
> +	bool success;							\
> +	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
> +	__typeof__(*(_ptr)) __old = *_old;				\
> +	__typeof__(*(_ptr)) __new = (_new);				\
> +									\
> +	if (sizeof(*(_ptr)) != 4)					\
> +		__cmpxchg_wrong_size();					\
> +	asm_goto_output("\n"						\
> +			"1: " LOCK_PREFIX "cmpxchgl %[new], %[ptr]\n"	\
> +			_ASM_EXTABLE(1b, %l[label])			\
> +			: "=@ccz" (success),				\
> +			  [ptr] "+m" (*(_ptr)),				\
> +			  [old] "+a" (__old)				\
> +			: [new] "r" (__new)				\
> +			: "memory"					\
> +			: label);					\
> +	if (unlikely(!success))						\
> +		*_old = __old;						\
> +	likely(success);						\
> +})
> +#else
> +#define __try_cmpxchg_nofault(_ptr, _pold, _new, label)		\
> +({									\
> +	int __err = 0;							\
> +	bool success;							\
> +	__typeof__(_ptr) _old = (__typeof__(_ptr))(_pold);		\
> +	__typeof__(*(_ptr)) __old = *_old;				\
> +	__typeof__(*(_ptr)) __new = (_new);				\
> +									\
> +	if (sizeof(*(_ptr)) != 4)					\
> +		__cmpxchg_wrong_size();					\
> +	asm volatile("\n"						\
> +		     "1: " LOCK_PREFIX "cmpxchgl %[new], %[ptr]\n"	\
> +		     "2:\n"						\
> +		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG,	\
> +					   %[errout])			\
> +		     : "=@ccz" (success),				\
> +		       [errout] "+r" (__err),				\
> +		       [ptr] "+m" (*(_ptr)),				\
> +		       [old] "+a" (__old)				\
> +		     : [new] "r" (__new)				\
> +		     : "memory");					\
> +	if (unlikely(__err))						\
> +		goto label;						\
> +	if (unlikely(!success))						\
> +		*_old = __old;						\
> +	likely(success);						\
> +})
> +#endif
> +
>  /*
>   * xadd() adds "inc" to "*ptr" and atomically returns the previous
>   * value of "*ptr".
> diff --git a/include/linux/page_ref.h b/include/linux/page_ref.h
> index 9f5c75d06f76..82a2fc445ce6 100644
> --- a/include/linux/page_ref.h
> +++ b/include/linux/page_ref.h
> @@ -246,9 +246,31 @@ static inline int folio_ref_dec_return(struct folio *folio)
>  	return page_ref_dec_return(&folio->page);
>  }
>  
> +#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> +/*
> + * HVO maps the tail struct pages of a hugetlb folio read-only.  A speculative
> + * caller can read a non-zero refcount, then the page gets freed, becomes a
> + * tail page of a hugetlb folio and is remapped before the update.  The
> + * atomic then faults.  A read-only struct page is a hugetlb tail page with a
> + * zero refcount, so the fault means no reference can be taken.
> + */
> +static __always_inline bool __page_ref_add_unless_zero(atomic_t *v, int nr)
> +{
> +	instrument_atomic_read_write(v, sizeof(*v));
> +	return arch_atomic_fetch_add_unless_nofault(v, nr, 0, fault) != 0;
> +fault:
> +	return false;
> +}
> +#else
> +static __always_inline bool __page_ref_add_unless_zero(atomic_t *v, int nr)
> +{
> +	return atomic_add_unless(v, nr, 0);
> +}
> +#endif
> +
>  static inline bool page_ref_add_unless_zero(struct page *page, int nr)
>  {
> -	bool ret = atomic_add_unless(&page->_refcount, nr, 0);
> +	bool ret = __page_ref_add_unless_zero(&page->_refcount, nr);
>  
>  	if (page_ref_tracepoint_active(page_ref_mod_unless))
>  		__page_ref_mod_unless(page, nr, ret);


-- 
Cheers,

David
