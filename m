Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57FA2874E0
	for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 08:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048229; cv=none; b=mVt4PNEkRKvnfYoHThdvzgitnHkDZuU+V2xna3/RG/Fjxr1UV6h4R2KIFSq+utO0CmZ1sGO/nTMzqwebc1j4oE0YdILoivyNOHtGoRgK7qQpQJncGPfTEKkvk02ncPDUAMj3m2+YFtjajBoecNm86C5tOzuvHo4TMJmhlpWKpMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048229; c=relaxed/simple;
	bh=8cpHviOPww/expwKvscZSgFbVpKCt/48hlVZlKbDKf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2h9yqEKMTRHlsK9Ghxlb3K2+VMrBSZ+XPnKDeNPfpw8j5z4Xly6Jgxiqtqz4/dTzdJdC82r2bZ8AxxON0XLTIha0CBpJpwGTV9hrwwuyPufTtwgdp5y5lIarm4QhqzjDnBY2XCaGBZxt47OWVm+PF/Ilhs4J6HJJ2IbTlmVOG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M3pekfK1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M3pekfK1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso2552515e9.1
        for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 00:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766048223; x=1766653023; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQSScrHGocujKud+xiMEi7IrZhWMIzDGmWhBlDWcW1w=;
        b=M3pekfK1gOsGoyfj4p5qv1jlfrrZ+PM8Wcqrfz1ojDI9SMmYS3MoZ4wFHwi/7ij63K
         bE4vRcV5BaosTxuMSl8QjCvA2VrYZTOHQsIUeW73WqkJAtfxTd7kkHjIUmULP9xgtBvD
         6OXp35bWhng9hVtSbtX0BXk5UMrtKADf0cKwfyfXx9mEcov6z+Kim7g16RkvxTgB3+79
         ZuJS6gwKTXY6o5UMvSwe4JBmJJaHtz8axFBaWolP0UHEvx1iXzovElgEO99MSV27+dhF
         IpNCa8PqTY87rIr44Rzj0YeXxfY/b2reVRLWIrurYd3zNyin2MDyH09r0D1zpJgga4E9
         zYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766048223; x=1766653023;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQSScrHGocujKud+xiMEi7IrZhWMIzDGmWhBlDWcW1w=;
        b=GPPv1NwtbinM5mIoUY6H8rkShfKxG3J75sv2jZinwVaAdFO2RK+mUzk3hxwpNjyUBG
         UEcv/JLKgBnZwO+UO+rdCkXT/RChGzDV6scOQs7zfHSJ6QzF71uG/Dno02o+GQcOv58V
         BsQWfAwWdSmil4EjgNB0Wv9QHyJl3FOwZF51VsGWljqmNgDTaQJCpa/dT6vwZSnloIcY
         JoS1si8kGWCpE7jNOOqknbJ907ULDSOxyQaCgoB6UqGHrA7zI3z0M6Jj5bD2k1RA5mzB
         VL5241vMBuLEwT6Qz9chYiQrPYibqyddpDN+folFPWFY13mbRC8NDby8iMRzgBWnyWW6
         G1UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu8k4/A0II6WzB0h0qJ9axLEL/K/zxm70fcFSd2wAmy4oLjTeNUqvbr/qaSvxbPQ06g7oJFGy4gQA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPVkdGCw5XgqwpDwXdIvPbu64Yhu+enmhqn6AHtL+1jTSTgcpR
	Eg+i8NipRiwE7hJedUR+IsP5xZMnYY6FVU9kUGw4IIc4FBBo7Jo53zirW3JqCis/jA==
X-Gm-Gg: AY/fxX5KsxBhbzT7h3T4zjConId/DQ7qqJUxGeWvWZ8GjJQLGWml5AqFW/EOLIvRczO
	+ydfA8pRO3HOxwQdSel/4Hn0bHCT264qf2mXDNAnQG0knLk4SqZWc8+J2MucXBH6tGYs3fBrNtM
	Oi1av3jU4UhbdDQSY1UKMCo6WdXni+BcqrXB2PfPWGSlQ+ccKZyTk0ZOCp4w1z6gd4P0V6NH3wJ
	qKonw3w8aVVbkUGCQIFMeVW88CoRLtSRaqxNaKmD8vTl07bVxUcVqgDDtFMam3dGCqjNtyzOkRE
	/K5rzOYSChZvV9i8SqxKaZfwhoyyJ31iMQ8ROvFkOGaxek/57J+GcBw9Vy8xvlEy6qJAY1EQECP
	CrLE62GbvC0P6k01eGYNwVxGlFYccnRQPIUCUWuk4SMwcGYwohEGUY47kXFLlpi5gi6RGA3ICXm
	d+zNR/ymtWVoWp9Pto7rdFIq82OmNQkUM0MXCYU7ykeOmYH/39
X-Google-Smtp-Source: AGHT+IGpBD4WMpC0/xgz/Q/hvvTr7xggeD09+wqcInauchGlEAY2Uj8VJqyBRZ11TmR8Uk2ZjfXOPQ==
X-Received: by 2002:a05:600c:45ca:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-47a8f8a80bemr200448785e9.1.1766048222784;
        Thu, 18 Dec 2025 00:57:02 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:fea4:c93d:2b17:7eac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3af6dbdsm9753695e9.19.2025.12.18.00.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:57:01 -0800 (PST)
Date: Thu, 18 Dec 2025 09:56:55 +0100
From: Marco Elver <elver@google.com>
To: yuan linyu <yuanlinyu@honor.com>
Cc: Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] kfence: allow change number of object by early
 parameter
Message-ID: <aUPB18Xeh1BhF9GS@elver.google.com>
References: <20251218063916.1433615-1-yuanlinyu@honor.com>
 <20251218063916.1433615-3-yuanlinyu@honor.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218063916.1433615-3-yuanlinyu@honor.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Thu, Dec 18, 2025 at 02:39PM +0800, yuan linyu wrote:
> when want to change the kfence pool size, currently it is not easy and
> need to compile kernel.
> 
> Add an early boot parameter kfence.num_objects to allow change kfence
> objects number and allow increate total pool to provide high failure
> rate.
> 
> Signed-off-by: yuan linyu <yuanlinyu@honor.com>
> ---
>  include/linux/kfence.h  |   5 +-
>  mm/kfence/core.c        | 122 +++++++++++++++++++++++++++++-----------
>  mm/kfence/kfence.h      |   4 +-
>  mm/kfence/kfence_test.c |   2 +-
>  4 files changed, 96 insertions(+), 37 deletions(-)
> 
> diff --git a/include/linux/kfence.h b/include/linux/kfence.h
> index 0ad1ddbb8b99..920bcd5649fa 100644
> --- a/include/linux/kfence.h
> +++ b/include/linux/kfence.h
> @@ -24,7 +24,10 @@ extern unsigned long kfence_sample_interval;
>   * address to metadata indices; effectively, the very first page serves as an
>   * extended guard page, but otherwise has no special purpose.
>   */
> -#define KFENCE_POOL_SIZE ((CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 * PAGE_SIZE)
> +extern unsigned int __kfence_pool_size;
> +#define KFENCE_POOL_SIZE (__kfence_pool_size)
> +extern unsigned int __kfence_num_objects;
> +#define KFENCE_NUM_OBJECTS (__kfence_num_objects)
>  extern char *__kfence_pool;
>  

You have ignored the comment below in this file:

	/**
	 * is_kfence_address() - check if an address belongs to KFENCE pool
	 * @addr: address to check
	 *
	[...]
	 * Note: This function may be used in fast-paths, and is performance critical.
	 * Future changes should take this into account; for instance, we want to avoid
   >>	 * introducing another load and therefore need to keep KFENCE_POOL_SIZE a
   >>	 * constant (until immediate patching support is added to the kernel).
	 */
	static __always_inline bool is_kfence_address(const void *addr)
	{
		/*
		 * The __kfence_pool != NULL check is required to deal with the case
		 * where __kfence_pool == NULL && addr < KFENCE_POOL_SIZE. Keep it in
		 * the slow-path after the range-check!
		 */
		return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
	}

While I think the change itself would be useful to have eventually, a
better design might be needed. It's unclear to me what the perf impact
is these days (a lot has changed since that comment was written). Could
you run some benchmarks to analyze if the fast path is affected by the
additional load (please do this for whichever arch you care about, but
also arm64 and x86)?

If performance is affected, all this could be guarded behind another
Kconfig option, but it's not great either.

>  DECLARE_STATIC_KEY_FALSE(kfence_allocation_key);
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 577a1699c553..5d5cea59c7b6 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -132,6 +132,31 @@ struct kfence_metadata *kfence_metadata __read_mostly;
>   */
>  static struct kfence_metadata *kfence_metadata_init __read_mostly;
>  
> +/* allow change number of objects from cmdline */
> +#define KFENCE_MIN_NUM_OBJECTS 1
> +#define KFENCE_MAX_NUM_OBJECTS 65535
> +unsigned int __kfence_num_objects __read_mostly = CONFIG_KFENCE_NUM_OBJECTS;
> +EXPORT_SYMBOL(__kfence_num_objects); /* Export for test modules. */
> +static unsigned int __kfence_pool_pages __read_mostly = (CONFIG_KFENCE_NUM_OBJECTS + 1) * 2;
> +unsigned int __kfence_pool_size __read_mostly = (CONFIG_KFENCE_NUM_OBJECTS + 1) * 2 * PAGE_SIZE;
> +EXPORT_SYMBOL(__kfence_pool_size); /* Export for lkdtm module. */
> +
> +static int __init early_parse_kfence_num_objects(char *buf)
> +{
> +	unsigned int num;
> +	int ret = kstrtouint(buf, 10, &num);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	__kfence_num_objects = clamp(num, KFENCE_MIN_NUM_OBJECTS, KFENCE_MAX_NUM_OBJECTS);
> +	__kfence_pool_pages = (__kfence_num_objects + 1) * 2;
> +	__kfence_pool_size = __kfence_pool_pages * PAGE_SIZE;
> +
> +	return 0;
> +}
> +early_param("kfence.num_objects", early_parse_kfence_num_objects);
> +
>  /* Freelist with available objects. */
>  static struct list_head kfence_freelist = LIST_HEAD_INIT(kfence_freelist);
>  static DEFINE_RAW_SPINLOCK(kfence_freelist_lock); /* Lock protecting freelist. */
> @@ -155,12 +180,13 @@ atomic_t kfence_allocation_gate = ATOMIC_INIT(1);
>   *
>   *	P(alloc_traces) = (1 - e^(-HNUM * (alloc_traces / SIZE)) ^ HNUM
>   */
> +static unsigned int kfence_alloc_covered_order __read_mostly;
> +static unsigned int kfence_alloc_covered_mask __read_mostly;
> +static atomic_t *alloc_covered __read_mostly;
>  #define ALLOC_COVERED_HNUM	2
> -#define ALLOC_COVERED_ORDER	(const_ilog2(CONFIG_KFENCE_NUM_OBJECTS) + 2)
> -#define ALLOC_COVERED_SIZE	(1 << ALLOC_COVERED_ORDER)
> -#define ALLOC_COVERED_HNEXT(h)	hash_32(h, ALLOC_COVERED_ORDER)
> -#define ALLOC_COVERED_MASK	(ALLOC_COVERED_SIZE - 1)
> -static atomic_t alloc_covered[ALLOC_COVERED_SIZE];
> +#define ALLOC_COVERED_HNEXT(h)	hash_32(h, kfence_alloc_covered_order)
> +#define ALLOC_COVERED_MASK		(kfence_alloc_covered_mask)
> +#define KFENCE_COVERED_SIZE		(sizeof(atomic_t) * (1 << kfence_alloc_covered_order))
>  
>  /* Stack depth used to determine uniqueness of an allocation. */
>  #define UNIQUE_ALLOC_STACK_DEPTH ((size_t)8)
> @@ -200,7 +226,7 @@ static_assert(ARRAY_SIZE(counter_names) == KFENCE_COUNTER_COUNT);
>  
>  static inline bool should_skip_covered(void)
>  {
> -	unsigned long thresh = (CONFIG_KFENCE_NUM_OBJECTS * kfence_skip_covered_thresh) / 100;
> +	unsigned long thresh = (__kfence_num_objects * kfence_skip_covered_thresh) / 100;
>  
>  	return atomic_long_read(&counters[KFENCE_COUNTER_ALLOCATED]) > thresh;
>  }
> @@ -262,7 +288,7 @@ static inline unsigned long metadata_to_pageaddr(const struct kfence_metadata *m
>  
>  	/* Only call with a pointer into kfence_metadata. */
>  	if (KFENCE_WARN_ON(meta < kfence_metadata ||
> -			   meta >= kfence_metadata + CONFIG_KFENCE_NUM_OBJECTS))
> +			   meta >= kfence_metadata + __kfence_num_objects))
>  		return 0;
>  
>  	/*
> @@ -612,7 +638,7 @@ static unsigned long kfence_init_pool(void)
>  	 * fast-path in SLUB, and therefore need to ensure kfree() correctly
>  	 * enters __slab_free() slow-path.
>  	 */
> -	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
> +	for (i = 0; i < __kfence_pool_pages; i++) {
>  		struct page *page;
>  
>  		if (!i || (i % 2))
> @@ -640,7 +666,7 @@ static unsigned long kfence_init_pool(void)
>  		addr += PAGE_SIZE;
>  	}
>  
> -	for (i = 0; i < CONFIG_KFENCE_NUM_OBJECTS; i++) {
> +	for (i = 0; i < __kfence_num_objects; i++) {
>  		struct kfence_metadata *meta = &kfence_metadata_init[i];
>  
>  		/* Initialize metadata. */
> @@ -666,7 +692,7 @@ static unsigned long kfence_init_pool(void)
>  	return 0;
>  
>  reset_slab:
> -	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
> +	for (i = 0; i < __kfence_pool_pages; i++) {
>  		struct page *page;
>  
>  		if (!i || (i % 2))
> @@ -710,7 +736,7 @@ static bool __init kfence_init_pool_early(void)
>  	 * fails for the first page, and therefore expect addr==__kfence_pool in
>  	 * most failure cases.
>  	 */
> -	memblock_free_late(__pa(addr), KFENCE_POOL_SIZE - (addr - (unsigned long)__kfence_pool));
> +	memblock_free_late(__pa(addr), __kfence_pool_size - (addr - (unsigned long)__kfence_pool));
>  	__kfence_pool = NULL;
>  
>  	memblock_free_late(__pa(kfence_metadata_init), KFENCE_METADATA_SIZE);
> @@ -740,7 +766,7 @@ DEFINE_SHOW_ATTRIBUTE(stats);
>   */
>  static void *start_object(struct seq_file *seq, loff_t *pos)
>  {
> -	if (*pos < CONFIG_KFENCE_NUM_OBJECTS)
> +	if (*pos < __kfence_num_objects)
>  		return (void *)((long)*pos + 1);
>  	return NULL;
>  }
> @@ -752,7 +778,7 @@ static void stop_object(struct seq_file *seq, void *v)
>  static void *next_object(struct seq_file *seq, void *v, loff_t *pos)
>  {
>  	++*pos;
> -	if (*pos < CONFIG_KFENCE_NUM_OBJECTS)
> +	if (*pos < __kfence_num_objects)
>  		return (void *)((long)*pos + 1);
>  	return NULL;
>  }
> @@ -799,7 +825,7 @@ static void kfence_check_all_canary(void)
>  {
>  	int i;
>  
> -	for (i = 0; i < CONFIG_KFENCE_NUM_OBJECTS; i++) {
> +	for (i = 0; i < __kfence_num_objects; i++) {
>  		struct kfence_metadata *meta = &kfence_metadata[i];
>  
>  		if (kfence_obj_allocated(meta))
> @@ -894,7 +920,7 @@ void __init kfence_alloc_pool_and_metadata(void)
>  	 * re-allocate the memory pool.
>  	 */
>  	if (!__kfence_pool)
> -		__kfence_pool = memblock_alloc(KFENCE_POOL_SIZE, PAGE_SIZE);
> +		__kfence_pool = memblock_alloc(__kfence_pool_size, PAGE_SIZE);
>  
>  	if (!__kfence_pool) {
>  		pr_err("failed to allocate pool\n");
> @@ -903,11 +929,23 @@ void __init kfence_alloc_pool_and_metadata(void)
>  
>  	/* The memory allocated by memblock has been zeroed out. */
>  	kfence_metadata_init = memblock_alloc(KFENCE_METADATA_SIZE, PAGE_SIZE);
> -	if (!kfence_metadata_init) {
> -		pr_err("failed to allocate metadata\n");
> -		memblock_free(__kfence_pool, KFENCE_POOL_SIZE);
> -		__kfence_pool = NULL;
> -	}
> +	if (!kfence_metadata_init)
> +		goto fail_pool;
> +
> +	kfence_alloc_covered_order = ilog2(__kfence_num_objects) + 2;
> +	kfence_alloc_covered_mask = (1 << kfence_alloc_covered_order) - 1;
> +	alloc_covered = memblock_alloc(KFENCE_COVERED_SIZE, PAGE_SIZE);
> +	if (alloc_covered)
> +		return;
> +
> +	pr_err("failed to allocate covered\n");
> +	memblock_free(kfence_metadata_init, KFENCE_METADATA_SIZE);
> +	kfence_metadata_init = NULL;
> +
> +fail_pool:
> +	pr_err("failed to allocate metadata\n");
> +	memblock_free(__kfence_pool, __kfence_pool_size);
> +	__kfence_pool = NULL;
>  }
>  
>  static void kfence_init_enable(void)
> @@ -930,9 +968,9 @@ static void kfence_init_enable(void)
>  	WRITE_ONCE(kfence_enabled, true);
>  	queue_delayed_work(system_unbound_wq, &kfence_timer, 0);
>  
> -	pr_info("initialized - using %lu bytes for %d objects at 0x%p-0x%p\n", KFENCE_POOL_SIZE,
> -		CONFIG_KFENCE_NUM_OBJECTS, (void *)__kfence_pool,
> -		(void *)(__kfence_pool + KFENCE_POOL_SIZE));
> +	pr_info("initialized - using %u bytes for %d objects at 0x%p-0x%p\n", __kfence_pool_size,
> +		__kfence_num_objects, (void *)__kfence_pool,
> +		(void *)(__kfence_pool + __kfence_pool_size));
>  }
>  
>  void __init kfence_init(void)
> @@ -953,41 +991,53 @@ void __init kfence_init(void)
>  
>  static int kfence_init_late(void)
>  {
> -	const unsigned long nr_pages_pool = KFENCE_POOL_SIZE / PAGE_SIZE;
> -	const unsigned long nr_pages_meta = KFENCE_METADATA_SIZE / PAGE_SIZE;
> +	unsigned long nr_pages_meta = KFENCE_METADATA_SIZE / PAGE_SIZE;
>  	unsigned long addr = (unsigned long)__kfence_pool;
> -	unsigned long free_size = KFENCE_POOL_SIZE;
> +	unsigned long free_size = __kfence_pool_size;
> +	unsigned long nr_pages_covered, covered_size;
>  	int err = -ENOMEM;
>  
> +	kfence_alloc_covered_order = ilog2(__kfence_num_objects) + 2;
> +	kfence_alloc_covered_mask = (1 << kfence_alloc_covered_order) - 1;
> +	covered_size =  PAGE_ALIGN(KFENCE_COVERED_SIZE);
> +	nr_pages_covered = (covered_size / PAGE_SIZE);
>  #ifdef CONFIG_CONTIG_ALLOC
>  	struct page *pages;
>  
> -	pages = alloc_contig_pages(nr_pages_pool, GFP_KERNEL, first_online_node,
> +	pages = alloc_contig_pages(__kfence_pool_pages, GFP_KERNEL, first_online_node,
>  				   NULL);
>  	if (!pages)
>  		return -ENOMEM;
>  
>  	__kfence_pool = page_to_virt(pages);
> +	pages = alloc_contig_pages(nr_pages_covered, GFP_KERNEL, first_online_node,
> +				   NULL);
> +	if (!pages)
> +		goto free_pool;
> +	alloc_covered = page_to_virt(pages);
>  	pages = alloc_contig_pages(nr_pages_meta, GFP_KERNEL, first_online_node,
>  				   NULL);
>  	if (pages)
>  		kfence_metadata_init = page_to_virt(pages);
>  #else
> -	if (nr_pages_pool > MAX_ORDER_NR_PAGES ||
> +	if (__kfence_pool_pages > MAX_ORDER_NR_PAGES ||
>  	    nr_pages_meta > MAX_ORDER_NR_PAGES) {
>  		pr_warn("KFENCE_NUM_OBJECTS too large for buddy allocator\n");
>  		return -EINVAL;
>  	}
>  
> -	__kfence_pool = alloc_pages_exact(KFENCE_POOL_SIZE, GFP_KERNEL);
> +	__kfence_pool = alloc_pages_exact(__kfence_pool_size, GFP_KERNEL);
>  	if (!__kfence_pool)
>  		return -ENOMEM;
>  
> +	alloc_covered = alloc_pages_exact(covered_size, GFP_KERNEL);
> +	if (!alloc_covered)
> +		goto free_pool;
>  	kfence_metadata_init = alloc_pages_exact(KFENCE_METADATA_SIZE, GFP_KERNEL);
>  #endif
>  
>  	if (!kfence_metadata_init)
> -		goto free_pool;
> +		goto free_cover;
>  
>  	memzero_explicit(kfence_metadata_init, KFENCE_METADATA_SIZE);
>  	addr = kfence_init_pool();
> @@ -998,22 +1048,28 @@ static int kfence_init_late(void)
>  	}
>  
>  	pr_err("%s failed\n", __func__);
> -	free_size = KFENCE_POOL_SIZE - (addr - (unsigned long)__kfence_pool);
> +	free_size = __kfence_pool_size - (addr - (unsigned long)__kfence_pool);
>  	err = -EBUSY;
>  
>  #ifdef CONFIG_CONTIG_ALLOC
>  	free_contig_range(page_to_pfn(virt_to_page((void *)kfence_metadata_init)),
>  			  nr_pages_meta);
> +free_cover:
> +	free_contig_range(page_to_pfn(virt_to_page((void *)alloc_covered)),
> +			  nr_pages_covered);
>  free_pool:
>  	free_contig_range(page_to_pfn(virt_to_page((void *)addr)),
>  			  free_size / PAGE_SIZE);
>  #else
>  	free_pages_exact((void *)kfence_metadata_init, KFENCE_METADATA_SIZE);
> +free_cover:
> +	free_pages_exact((void *)alloc_covered, covered_size);
>  free_pool:
>  	free_pages_exact((void *)addr, free_size);
>  #endif
>  
>  	kfence_metadata_init = NULL;
> +	alloc_covered = NULL;
>  	__kfence_pool = NULL;
>  	return err;
>  }
> @@ -1039,7 +1095,7 @@ void kfence_shutdown_cache(struct kmem_cache *s)
>  	if (!smp_load_acquire(&kfence_metadata))
>  		return;
>  
> -	for (i = 0; i < CONFIG_KFENCE_NUM_OBJECTS; i++) {
> +	for (i = 0; i < __kfence_num_objects; i++) {
>  		bool in_use;
>  
>  		meta = &kfence_metadata[i];
> @@ -1077,7 +1133,7 @@ void kfence_shutdown_cache(struct kmem_cache *s)
>  		}
>  	}
>  
> -	for (i = 0; i < CONFIG_KFENCE_NUM_OBJECTS; i++) {
> +	for (i = 0; i < __kfence_num_objects; i++) {
>  		meta = &kfence_metadata[i];
>  
>  		/* See above. */
> diff --git a/mm/kfence/kfence.h b/mm/kfence/kfence.h
> index dfba5ea06b01..dc3abb27c632 100644
> --- a/mm/kfence/kfence.h
> +++ b/mm/kfence/kfence.h
> @@ -104,7 +104,7 @@ struct kfence_metadata {
>  };
>  
>  #define KFENCE_METADATA_SIZE PAGE_ALIGN(sizeof(struct kfence_metadata) * \
> -					CONFIG_KFENCE_NUM_OBJECTS)
> +					__kfence_num_objects)
>  
>  extern struct kfence_metadata *kfence_metadata;
>  
> @@ -123,7 +123,7 @@ static inline struct kfence_metadata *addr_to_metadata(unsigned long addr)
>  	 * error.
>  	 */
>  	index = (addr - (unsigned long)__kfence_pool) / (PAGE_SIZE * 2) - 1;
> -	if (index < 0 || index >= CONFIG_KFENCE_NUM_OBJECTS)
> +	if (index < 0 || index >= __kfence_num_objects)
>  		return NULL;
>  
>  	return &kfence_metadata[index];
> diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
> index 00034e37bc9f..00a51aa4bad9 100644
> --- a/mm/kfence/kfence_test.c
> +++ b/mm/kfence/kfence_test.c
> @@ -641,7 +641,7 @@ static void test_gfpzero(struct kunit *test)
>  			break;
>  		test_free(buf2);
>  
> -		if (kthread_should_stop() || (i == CONFIG_KFENCE_NUM_OBJECTS)) {
> +		if (kthread_should_stop() || (i == __kfence_num_objects)) {
>  			kunit_warn(test, "giving up ... cannot get same object back\n");
>  			return;
>  		}
> -- 
> 2.25.1
