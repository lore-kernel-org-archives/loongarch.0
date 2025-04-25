Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56C25DCF3
	for <loongarch@lists.linux.dev>; Fri, 25 Apr 2025 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594923; cv=none; b=oX5o4aQMpKK7A+jLe2jtzqTx0u/RkFEUFdit0EIL+lI3AF9+DipoDY5K2um8bxeNTuomKJegoELxtDiNyD3oep2G/Y+xc0H0J/lDt1uHCh83xuoVS/7u6a6aXZtInrQsmU5Fc2vuyRUjdoEiyUkLDEgqLsGFGQPsgidG6caQuaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594923; c=relaxed/simple;
	bh=VaWxyn0ToHxWG3NlCJF/PoTlUbQR8YEADm27r7EkWMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=sKfdMN7tz6FG04+rfDLao5fvKgndWgiO8tDsqc9XwI46o+Io1QCvowfJ3tS3CfzDZfAXDlE+qd3BgMxLIkmMT+hFJc4S7RPEcE/tPRQvaWh/QDzS4+E1RWwuV6AyadcVpLhGFTCuRcEMCLRtSVsU92tbuIyvk1w74fkVV3XYcO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MqcXzFWP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MqcXzFWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745594920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYreMA6jskYRTiTo4bjU+q/aoyL3CpRyN924JbDi7iw=;
	b=MqcXzFWPQ0z778dV77eoZhKu6P77959vtlHjBoUhGpazxDaZC38k7JWQcIghIWDGkt241p
	DIER+C1T9ZhgymO1441ozKDcxFhe3GStrAlHiWBCqXRlYMi5tLBhXRXvb3ppprf8yYoXdn
	RnvB+qARiizGSlEsCC5yEQ8mnndIpfg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-Yvwm8ZnKMi-htxQQVNTyQg-1; Fri, 25 Apr 2025 11:28:38 -0400
X-MC-Unique: Yvwm8ZnKMi-htxQQVNTyQg-1
X-Mimecast-MFC-AGG-ID: Yvwm8ZnKMi-htxQQVNTyQg_1745594918
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso389891785a.2
        for <loongarch@lists.linux.dev>; Fri, 25 Apr 2025 08:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594918; x=1746199718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYreMA6jskYRTiTo4bjU+q/aoyL3CpRyN924JbDi7iw=;
        b=mFHQIbDJnESxwhpLeezl22LC41Ixtskyp9y0qdN+6sI5/cJTiZ2XiLvmoICtXxeJ+P
         m5zxyrM6xHN+Yz/mzIeeGnl7uIMgCUSM9dT6Pw7FI5kwYKjtGoeP/5aAMALGNP1dV2en
         CwVBiIkOAxDhx8hVTh3EXZJhQK3r1EoSBGfbbKorwPCujsbT46d2r3iuyqUOPGdd7F+Y
         2CxdHJUjs6jZAmXaQ2r5lZl/ItMhoNkM8YAINZCuIxBsC35tycRgObjXf6PSrLgb6c5G
         gyFFLrlAB0p1P5iTGj4KzEXBpy1WcbMCwVtxi5QYGlssSGoClzkbMr4njL0ScokDKeai
         43/g==
X-Forwarded-Encrypted: i=1; AJvYcCUyYltaX6snXRUAYfZ04xY3VIkIvHQkLXEjH63g4C8BpDZKow5gnrVkcWszRHC/nkQBtN8epF/cDWs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy81yEPa2+g4jpOpBp3Qgwxtl4ZkllowNTNPO38loSxrtO79+45
	JjiLlsUlCCLuoxY9w08x5DYa6Ktj5H9iFnHEjxC1Vx1gkroD7E5WdcFLrvLYKGn/Ok0wtfohxFL
	8CsSsZPpTqQu7Q4nVqNgzBGlPQl3nDepWz/gIZgDdQrbUbllJnTkt0OYGb/b2py4rMg==
X-Gm-Gg: ASbGncs53PJatizmZ9D1/f8EHliVNVmI1RNmj6PlUBNkYLilxnt0nmkQX1uj649pUXn
	BigNwh2N8OwYddLju7IyYYHg47Kxt2IEGT622CkLPbAH4StxZBFj8/oeQ+hWoXtZvOW41zweD2d
	hgAi2HahSIOB9AH4h/fDPhhuBAKn1nT39+t0AEm0UEm4+uoDlUX1Aa0E5L73jiQlZ4sD1k19MqT
	2uC7eQ6Xl2Q8oCjGRlgqe6a+iGwEPTWe6gmJPPsAepfjd3TqtW2P+EbKeIF5/B9q5fSeSzpKkbS
	8Gs=
X-Received: by 2002:a05:620a:1787:b0:7c5:5909:18f3 with SMTP id af79cd13be357-7c9619e843fmr426981985a.37.1745594918124;
        Fri, 25 Apr 2025 08:28:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv0+kA83s0dAM+lG7r8Afii/3p0skSZ5IKJzraHNvyfeodOjIegRxzU7hQoPcGyjWdGlk9Xw==
X-Received: by 2002:a05:620a:1787:b0:7c5:5909:18f3 with SMTP id af79cd13be357-7c9619e843fmr426979385a.37.1745594917809;
        Fri, 25 Apr 2025 08:28:37 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cdc4cesm230823485a.53.2025.04.25.08.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:28:37 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:28:34 -0400
From: Peter Xu <peterx@redhat.com>
To: Ming Wang <wangming01@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	lixuefeng@loongson.cn, gaojuxin@loongson.cn, chenhuacai@loongson.cn
Subject: Re: [PATCH] mm/hugetlb: LoongArch: Return NULL from
 huge_pte_offset() for none PMD
Message-ID: <aAuqIsKEjcVUU7jn@x1.local>
References: <20250424083037.2226732-1-wangming01@loongson.cn>
 <aAqHkdXt50van31B@x1.local>
 <b8fe05f1-23c2-423f-88cc-310996c6aad5@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b8fe05f1-23c2-423f-88cc-310996c6aad5@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DclJpGsu3mWoQ2IltDHY6i0brf0wJvvvCg4QaUgduDw_1745594918
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Apr 25, 2025 at 10:47:24AM +0800, Ming Wang wrote:
> Hi Peter Xu,

Hi, Ming,

[...]

> You asked why the check involves pte_none() rather than huge_pte_none(), given that LoongArch
> provides the latter which correctly identifies the invalid_pte_table address.
> 
> That's a great question, and the crux seems to be in how the generic code path works. The crash
> originates within smaps_hugetlb_range() after the generic `is_swap_pte(ptent)` macro returns true.
> Looking at the definition of `is_swap_pte()` (in include/linux/mm.h or similar), it typically
> expands to `!pte_present(pte) && !pte_none(pte)`.
> 
> Critically, even though `smaps_hugetlb_range()` deals with HugeTLB entries (often PMDs cast to pte_t),
> the generic `is_swap_pte()` macro itself, when expanded, calls the **generic `pte_none()` macro**, not
> the specialized `huge_pte_none()`.
> 
> LoongArch's generic `pte_none()` macro is defined as:
> `#define pte_none(pte) (!(pte_val(pte) & ~_PAGE_GLOBAL))`
> This definition does *not* check for the `invalid_pte_table` address and thus returns false for it, 
> leading to `is_swap_pte()` incorrectly returning true.
> 
> So, while LoongArch does provide `huge_pte_none()` which *could* correctly identify the state, it's not
> actually invoked in the code path triggered by `is_swap_pte()` within `smaps_hugetlb_range()`.
> 
> This is why modifying `huge_pte_offset()` seems necessary and appropriate at the architecture level.
> By returning NULL when the underlying PMD entry is none (checked using the correct `pmd_none()`, which *does*
> check for invalid_pte_table on LoongArch), we prevent the invalid pointer and its problematic value from reaching
> `smaps_hugetlb_range()` and subsequently fooling the generic `is_swap_pte()` check that uses the generic `pte_none()`.
> 
> Regarding your point about generic page table walkers possibly needing `pte_none()` itself to handle `invalid_pte_table`
> in the future – I understand the concern. That might indeed be a separate, future enhancement needed for LoongArch's
> generic page table support. However, the current patch addresses the immediate crash within the existing hugetlb-specific
> walker (`smaps_hugetlb_range`) by stopping the problematic value at the source (`huge_pte_offset`), which seems like a
> necessary and correct fix for the present issue.
> 
> Does this explanation clarify the interaction between the generic macros and the arch-specific helpers in this context?

I see what's off here - I'm looking at Andrew's latest mm-unstable, which
contains your other fix already:

commit 2f46598ca15065ff7efac3dba466899608bfc659
Author: Ming Wang <wangming01@loongson.cn>
Date:   Wed Apr 23 09:03:59 2025 +0800

    smaps: fix crash in smaps_hugetlb_range for non-present hugetlb entries

So we're reading different code base..

Looks like the generic mm code used is_swap_pte() in multiple occurances on
hugetlb ptes already. Besides smap code you mentioned, I at least also see
page_vma_mapped_walk -> check_pte also does it.

I'm not sure what's the best to fix this, and if it means is_swap_pte()
should work on hugetlb pte_t's for all archs.  However you're right if
that's the case your current patch can fix all of them by fixing
huge_pte_offset() in loongarch's impl.  So it looks like at least the
simplest.

Acked-by: Peter Xu <peterx@redhat.com>

Maybe you want to ping the other patch to drop that in mm-unstable too, if
that's not your intention to merge.

Thanks,

-- 
Peter Xu

