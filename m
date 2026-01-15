Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4213C324707
	for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 21:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511230; cv=pass; b=UCWG1Y0ld71TKX4nLbEXWraDR6B1k1GPlHSz6hjXLZubv332ZlxJ3HslTEiRqfzEUZIT/bS7zIcclVEVGk2tatN4EPzDDhyK9/pbE/KEtSz+krPJ+Gv/z49umqEbY3SBRcd0c1BYUrUQsgXoyEM5WaEKip2k62tG4BAvrwxo6c0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511230; c=relaxed/simple;
	bh=Yj5Px6CBHG4dfhDnY0aiL+o/Xd3AGh3M1dNNpc7+Hj0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIcSzXahC9405z+EfPz+iuZNsR8TyXV+FLmNcjQry1pVppmelTiw1ScFmUolRFynLlX76wfxjElMlHJ+LhZAZAuzUKSCvDVEIXH3vphtH7zx4xnEKc0Q6j6kZVLmpuYgP5jiGdUrVAe0RmNNZxECjJ5z//VoJjRxfDQ4BtzyPqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jWAaMhmF; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jWAaMhmF"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5eea3fe88bdso488908137.3
        for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 13:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768511227; cv=none;
        d=google.com; s=arc-20240605;
        b=N/hOvm3OoSIChA183TDTT0OxUXjv6B+grMiLvswzzGQl03nrN27knQU469LESOCtH5
         EwFmuopMyISUnHba9QFS9i3HdPBNpKeHPe31IExx7Cj8yfzxwUETpidn1rHKivuZEF+E
         LMnxVBLWG3TbXwPVXLYzccjbZ3YL1nac7pNT6mmN4s3VCcv/WU2HJRvNGVACAykQMMRE
         GPxBaotSUvfyZH69uYULhAHw5ElDunkJAEhVricYqPUONPSPA1eO/iJzpar7XXN3Xffe
         wrNkkpyBUJ80ECd6+zMeJfeCwojmPhO5T/kB2YNbA7l+VKctJI4oEP4m/Q/9f3Dpqb3L
         j8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y4BwArZ5FLhyM5BEN34gjuDvwbvdpN2Nxoskvco/5nM=;
        fh=Tpz0XRSWFsbATmA33Z1qP5XLoZrvw+LMwwp5LbCSq8o=;
        b=NI7lWU/Mio3IBzCHFzDuq34uAdiTlo3B7JFgRuhGdtii6BbIZQF/35FoOMgDqhYy7o
         Bo+om1AXvbhwvKdWCiZ0xFNAIaVf3ti1myv9CnNm3HixIYoxPB3QDUF7jAXtv4p9lq9j
         ByrO+6DDN4WtqornRp/LS6Pe4L9fHSvi8Fh5aUmr7aPJe4igzMhWCwFuh81TVxsE+C2K
         cAHCWgEPkuJ/SERTex+zi3U9Dc0d5HGtZhuIVYHHcOwOROdO/vE4wUaxxU7iAu6T4Wkk
         NfzHS0pP5A0cdz1w9s2j5xSp8b3itprLwYj3bpUOC1doTFYeko+jRSeXCpAtrF4QmeWO
         xd1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768511227; x=1769116027; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4BwArZ5FLhyM5BEN34gjuDvwbvdpN2Nxoskvco/5nM=;
        b=jWAaMhmFJfRnahC361lyIAqQSJTBzrotBx9BuHyQnEyeHooBykvzIOhbNOIXjGkP4E
         HzL1rhvhjabYXulihG8TeDtD405Ca5DfrqtmpJW9tU0AP3enjrl0k6NxCM3WFOySZE5M
         keZ+RaQJsi/4RQ49540Qn/8QjeQM9QETg1Qd+AoWqzgxx2XzzX16dpkHYpvIdvYFiHpN
         ks9Okodae/2PQQm7pW7LL0LtWo88EqWG0+YbsXxPe5bAXEcbG5k3iXPlyydYJqN6Kbwy
         vi4PjQo5a3uGiz9jaZQYx0kbT3HVy0kjUf0AYhY7u+SRupXrcHzU6kES1E01ozQTcgMX
         vjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511227; x=1769116027;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4BwArZ5FLhyM5BEN34gjuDvwbvdpN2Nxoskvco/5nM=;
        b=gKi06hAuVs6wpEbwKJ2xjtWoERB8qyuj6nAR0LzCmhBl0VynAsxJvYH3EnQLUrhhn8
         YWZ51LT61gcZ79XsADDAHeUW+KBIPE4BC/C8B52XnX+ZnH5u4Q/yECiX/HPHgTkZ6zYo
         sdMs0JK95Y/BdxAEzIIkr3MNhfIxszF1a56HNC2bGdc9/oCzJP2v1xJtHCtwR8VPhkzl
         CXTRINdYob9Xfxzm5NNgTWHNaNxcvNF/jhFVGQShYtDyoQZ4EXtiBf2r5EtnKsBnv+OE
         HyiFg+vbGovkuCudR9WVqQV5Tm52gWiSkHJrcMPeHEhG4RB0hxSMwi8w71wLU/RKhq+Z
         x0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmb0OOAbFNY+WYhYqVvPqS+rZvUwPRV7ePOEn+3jNEP2+IiInxz2RFUZqUfEEu/ClP0DJGTO0aYNE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtkjkqRFVmdlBZTBdO6pGKNbzucHg56wAOFKqp8sF7ThRCxIcn
	K2BgaBD2+56O95a6/IRPde7dR+102AjCoxM/W4S7HPj18wT7vN7xiyeomg2I6JhLwCGSAQEoG2z
	PF90vJs/iAXuNmsBXNNhjKUJuiDgJL4hHoUrG1WXP
X-Gm-Gg: AY/fxX74U/vzhIesS37pDnrqczLxuRAWtvwskQS27lEiLOa7mboy4ghzYAg5R9HHigK
	v90/LYlvJEt1XjJLl/rlQNCMbYn9wf0RauZVho4m+3gvBDQxlRA/MoWYUB9yaffMSnBBYU0a6ZH
	gVQmbyHMoK8vejfGYzH5+y6fHmO6niW/lrvp0Z4+KfzGZ75PDdhBg3ieuW/QDImZJ9EoINpadPt
	M8kHSMiL2JQErn2J6PVtljL8Ci78vSLCVfx9skE62Cr3meckpcK+dC4n30Bu1wdhrOF+VU2EwO1
	mrTAVI5lrGeHn/BcsBG2IAGONg==
X-Received: by 2002:a05:6102:945:b0:5df:aff3:c41c with SMTP id
 ada2fe7eead31-5f1a719e362mr155618137.30.1768511226367; Thu, 15 Jan 2026
 13:07:06 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:07:05 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:07:05 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260114134510.1835-2-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-2-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 13:07:05 -0800
X-Gm-Features: AZwV_QitN6L4bb0XJb_ZZH7nFdRT7CH1pyddv4cbgutSArI7UeCs00Q7KzDEw7c
Message-ID: <CAEvNRgGXeow48BUJYyuAOUp8qK97v1LdF4KdTB=Nbk7pTs9tfw@mail.gmail.com>
Subject: Re: [PATCH v9 01/13] set_memory: add folio_{zap,restore}_direct_map helpers
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

"Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:

> From: Nikita Kalyazin <kalyazin@amazon.com>
>
> These allow guest_memfd to remove its memory from the direct map.
> Only implement them for architectures that have direct map.
> In folio_zap_direct_map(), flush TLB on architectures where
> set_direct_map_valid_noflush() does not flush it internally.
>
> The new helpers need to be accessible to KVM on architectures that
> support guest_memfd (x86 and arm64).  Since arm64 does not support
> building KVM as a module, only export them on x86.
>
> Direct map removal gives guest_memfd the same protection that
> memfd_secret does, such as hardening against Spectre-like attacks
> through in-kernel gadgets.
>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  arch/arm64/include/asm/set_memory.h     |  2 ++
>  arch/arm64/mm/pageattr.c                | 12 ++++++++++++
>  arch/loongarch/include/asm/set_memory.h |  2 ++
>  arch/loongarch/mm/pageattr.c            | 16 ++++++++++++++++
>  arch/riscv/include/asm/set_memory.h     |  2 ++
>  arch/riscv/mm/pageattr.c                | 16 ++++++++++++++++
>  arch/s390/include/asm/set_memory.h      |  2 ++
>  arch/s390/mm/pageattr.c                 | 18 ++++++++++++++++++
>  arch/x86/include/asm/set_memory.h       |  2 ++
>  arch/x86/mm/pat/set_memory.c            | 20 ++++++++++++++++++++
>  include/linux/set_memory.h              | 10 ++++++++++
>  11 files changed, 102 insertions(+)
>
> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
> index 90f61b17275e..d949f1deb701 100644
> --- a/arch/arm64/include/asm/set_memory.h
> +++ b/arch/arm64/include/asm/set_memory.h
> @@ -14,6 +14,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
>  int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
> +int folio_zap_direct_map(struct folio *folio);
> +int folio_restore_direct_map(struct folio *folio);
>  bool kernel_page_present(struct page *page);
>
>  int set_memory_encrypted(unsigned long addr, int numpages);
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index f0e784b963e6..a94eff324dda 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -357,6 +357,18 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>  	return set_memory_valid(addr, nr, valid);
>  }
>
> +int folio_zap_direct_map(struct folio *folio)
> +{
> +	return set_direct_map_valid_noflush(folio_page(folio, 0),
> +					    folio_nr_pages(folio), false);
> +}
> +
> +int folio_restore_direct_map(struct folio *folio)
> +{
> +	return set_direct_map_valid_noflush(folio_page(folio, 0),
> +					    folio_nr_pages(folio), true);
> +}
> +

Was going to suggest a _noflush suffix to these functions, but saw
Aneesh's comment that these functions actually do flush_tlb_kernel [1]

[1] https://lore.kernel.org/all/yq5ajz07czvz.fsf@kernel.org/

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  /*
>   * This is - apart from the return value - doing the same
>
> [...snip...]
>
