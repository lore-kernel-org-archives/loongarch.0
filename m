Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B870816
	for <loongarch@lists.linux.dev>; Mon,  6 Jan 2025 03:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736135632; cv=none; b=Z7R4mMJhxrWDwx4wrm3JOHFETKxR9m73BwvA5IHUl7YqfpBFiWJiav23N11DGEnSEy5uWoV/jmvwdbO4DPGVxYzNcVJbjiMOw6FCdM3FrR38EL87/ocLd8cRX1c0ABvVPj5O1K1OGlQSZuxQYmqGXKv5Z+2v8NQHCpHLxC/CiyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736135632; c=relaxed/simple;
	bh=W5R5SVhoruE2dQ0Ov21TCrDEEfRfDgUrkE/35gJj4fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvX82mu09iGR/ImOeHwMfvaeTjZacNODngDmEAgUNpkwT0hpsyfPu/5gAW22XtUrBQvrVI0EZw0hhU+DOdkEVWxROzmLD5CNoWKPlwPz5Q6OPvW1IgPHOSyb+R/y4pWgIFWJ5fD1T+WzuCR6NzW/KcVh7U8xcdmXfh7aa6fzbBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jqYgB0Z8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jqYgB0Z8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so20360656a91.2
        for <loongarch@lists.linux.dev>; Sun, 05 Jan 2025 19:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736135630; x=1736740430; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/q466ctbH84kLf48L1cXJtHFTRzDl7be/n0cI3LGmOM=;
        b=jqYgB0Z8gckRFV+Zhe2lXFiytW7prdqcISc5YnB4LGlyYk7b0P6eoH2WR7XunnhcGE
         02Oxl1NLX05HvGseCQXGQbIJIHGyuzkFvpn4nqOPf+QAPwIRAac6hHkd0QBYaVx6wAUM
         GFY+Rfp1lJ2Id76cKWXUxV2VakfR5J5hoQ4130NeY9bTVGJcD0EdV6rY3zdA0xKNbmsV
         C9tsyILxhNe1PATIb+gdDVKHvdtzdKn/7JgAjWAM32MkOg1YVc4XE+eZb8uCfeqXZ9EB
         fMg5tS/Ol3gKOzjf140fbPBgWu5XKXp4oYzZmddIQYbsC7orcmARd6VKbXlbwGtsZ35i
         GuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736135630; x=1736740430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/q466ctbH84kLf48L1cXJtHFTRzDl7be/n0cI3LGmOM=;
        b=TVb9ix9RjVK6W9ncRNrjQsGpiKA94L4KWlvE9bkGj7vwg/MNXdlFtwisOnoHf2/vde
         ye/TOM/fnrmDB2b2ONpxBzrxjwp7lVqlRRlGgJ4HrSckz1z+Bdv6LAdkipwwpe7BQLXC
         4gbOihnclCf2hUaBojUYdlmOXgZADK8h9GnDR9rbfAhKIIRSK4f6Zh5h+CEXBzYQjAOh
         9rG0suQX9PohbqllD13gA2/oBjlPCO8De1NRVR1SsnvKK3QNGV+kF5jFgfSrnJ78VLaq
         nk16Vmbf4ee2OyGfutN3ZD+N+NZizWHy7oJFroOGZ6Pj6EUQJSM0dS6EH5b9GGIipDuK
         I3gw==
X-Forwarded-Encrypted: i=1; AJvYcCVK3xFrfnbzQHm2sdYQVYqUVi0Ay1gSkl3cK3pr63WjNk/tmG/ftwLakOs4CSMOaB/biWm5/iMwLmg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9NTUfwJs98ARpUki9xuGsbaldw4RS5LSx2ShqbnZz06HTi6oj
	E7zyeX+Fi6CxYbJMm104Xxzc15QTkKIKU0fFXlgZEvoKQiojpmYsB7CmmSHaMj4=
X-Gm-Gg: ASbGncu3KvTsMHHFs2mKS/pcwbrEzwaV2EeancCIdQePlM81vePSGYCsgWDcE3jl4Xu
	lV7ovFqAV/NeqBYZsW5YbZ+37mrS8J1T4xdCfVX9F+Kqa7EsmAuKkCvxx+Fj1yOnsSRoTrk5ZC0
	fzGh6nTBao0nWnpP/RL3ZUsx9ponQPEfwdy0dBT0fFCIoO/vIiF5cMerzxqd/wQqntzwTyMiPX+
	VvHXn06kT1CzB26o8c1qEllos3z75EaBM6shDdR9TlTuy57OBKvK5DAE3xzeamkzTNXySSm+ZW1
	xZRIYw==
X-Google-Smtp-Source: AGHT+IE2eKUVGb+J7TSGZASTVnkByt6mt8YLIy++PUNY+VFfsnF7zlybMe8WL3Umwm8kwi4ry/BkkA==
X-Received: by 2002:a17:90b:54c3:b0:2ee:a127:ba8b with SMTP id 98e67ed59e1d1-2f452ee83d9mr71788615a91.36.1736135630440;
        Sun, 05 Jan 2025 19:53:50 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02f72sm283551435ad.249.2025.01.05.19.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 19:53:49 -0800 (PST)
Message-ID: <a84a7b0f-dad5-4100-9d0c-3b515e7fb71f@bytedance.com>
Date: Mon, 6 Jan 2025 11:53:36 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: agordeev@linux.ibm.com, kevin.brodsky@arm.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
 <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
 <Z2_EPmOTUHhcBegW@kernel.org>
 <20250103111457.GC22934@noisy.programming.kicks-ass.net>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250103111457.GC22934@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/3 19:14, Peter Zijlstra wrote:
> On Sat, Dec 28, 2024 at 11:26:22AM +0200, Mike Rapoport wrote:
>> On Mon, Dec 23, 2024 at 05:41:01PM +0800, Qi Zheng wrote:
>>> Here we are explicitly dealing with struct page, and the following logic
>>> semms strange:
>>>
>>> tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));
>>>
>>> tlb_remove_page_ptdesc
>>> --> tlb_remove_page(tlb, ptdesc_page(pt));
>>>
>>> So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
>>> directly.
>>
>> Please don't. The ptdesc wrappers are there as a part of reducing the size
>> of struct page project [1].
>>
>> For now struct ptdesc overlaps struct page, but the goal is to have them
>> separate and always operate on struct ptdesc when working with page tables.
> 
> I don't see how the current idiotic code helps with that at all.
> 
> Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
> there should not be a page-table anywhere near here *ever*.
> 
> Yes, some architectures use tlb_remove_page() for page-tables too, but
> that is more or less an implementation detail that can be fixed.
> 
> So no, please keep these patches and kill this utterly idiotic code.
> 
> The only thing that should eventually care about page-tables is
> tlb_remove_table(), and that takes a 'void *' and is expected to match
> whatever __tlb_remove_table() does.
> 
> Flipping those to pgdesc, once its actually a thing, should be fairly
> straight forward.

Well, since I've already sent v4, and that patch series is mainly for
bug fix, I'll send a separate patch series to do this.

Thanks!
