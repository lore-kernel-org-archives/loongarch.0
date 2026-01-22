Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E05A38F95A
	for <loongarch@lists.linux.dev>; Thu, 22 Jan 2026 22:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769122059; cv=pass; b=ZcBJtrSdByqixCAUHS2+RInvsEghgkzlwNGSY81mXqyOJlsgkZ3wR4rm8lpBEVxMEU18TX5HlcrbN/olUf5+TgN3kCZJU3AmzgtxkK6PSDW6w/bPbop82m3VckbVxOAfW/8lgUI0CEAX22SGKGZceoJrrf4eXzZAT6pQjn4+vMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769122059; c=relaxed/simple;
	bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+3S55TDMzNM5qa1IvXJUKcHBhq1nIQp3v4meUZAjIcv24s4gA8NHiwPwy99bvk8KJvZMPntlFn8ULBZO3MsQdmZD4wMCE7t0v8bdq7bhBUdjR+tBtKJ0a8xz9edGS2nw6Q6gZxfYEBfBmcOmSpDvmGGwU39vqDN8eeUdNrWHDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A0QUY7up; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A0QUY7up"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94124140e02so1206156241.1
        for <loongarch@lists.linux.dev>; Thu, 22 Jan 2026 14:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769122051; cv=none;
        d=google.com; s=arc-20240605;
        b=chWv8fvmFlcrOsS9yvMxMPDwww1D8XvHbu572jdqJAN60qdKPPr45rqsl+6wdSphOa
         xE/XJo5TU4rVX3DGOGHXZSaH//u5Zzcp7vlrZrteHMf+IITkaxqp5uWNNc+u2qLBciYx
         xykqAKWnD8paS19Sqn+Ian8mDrgEeXFu55Hc1Whptn44rKPzfvNIOQZkMpngQuSZgMoz
         P4lQsMWgoP9Uw3EWg8IPD/3Ru5zwJHpBFwSPhCPf9Arp86vnZBwOOEDTSre9BixmyGl7
         SA3h8UGLyItS2Lxg4RttEs2F4hY5EZsNrKCnpGjGjmpfryoakDGYSqu3QhNBs6t7k6Ha
         imvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
        fh=w86vum3qc58/jmP9mlqQnvbZ8c6PZ8+z4dEglt0C9mM=;
        b=S6nN6C3Au9EBuUVLafv4dkbLZCskeMiwxljrlywBLAU7ymHHIqvv/BFuDrmvCatELo
         QZ+oQrrD3c1YTVlWh3ib5ZYbFWS+fnK+hkmcA5xU1frYn0qzWf5dU9BAoxUWu6KMCF2h
         r9ySC+SzD7Qp3gmfh5J+4QXCkahYYDuD774IGq+CQe1m9w9EJmGUwTZy+bGWyjyiyPhL
         L0XMONOYxKAnKSc4iQIOfFcJZ/i1KhfPRSlUHoutI4fJfbeFUQxqCgOIgeBipaaJW0DF
         hQmcNlDAiKJqQVt3VgWAtYxB7PUKDPS/U/ft6JRPEMmuxlRg4sNb1fkzIR+I8eQZUlcx
         8mMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769122051; x=1769726851; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
        b=A0QUY7upWddX7M6YZCXzQzkYL9PkH+LjKp9XWRpCdrDz6I8kxijZ7e1uNWKaMdJSuD
         acVKSQBJIpTSC1v9cCKSH+vgJDO9ELefvS1NyE50onJM5zRWnVaSgvzLj2Vqn2c4POEZ
         ZfDC5/RBDhEL//pPK1djaZojmu/gVCrt98XALcNM3J6d15XEupOGSyQOSBQFy2H4SSrr
         zsjG0SWvTiSPSi8SSJfjX7oHIqOMH4d4QzCnNIBO3Vt/Whax4zCsdqZG0xP2G5VLhAVu
         2JKd+zoop0F/rB5i6bxQU8UnXqlmhWtFJvKzUYQkmqKlgeSSBHWj+SsQfAVhqML6muTq
         IHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769122051; x=1769726851;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
        b=VeR6olzFiIjtuUdkUn3YZnTgsE776IgvwrIWvtieZcQb3KCJ5rVDajhJj1+/uWT0/r
         lZwokUvuFXnPWueR+1T/fCAQKCZbJyQ7oJkNCInPnJ1Cr26huaWxVaO1C12P6sq3hs7i
         qmDt232bTehpuU8ix8DT9lAbpIa83rSPFNfhb5mRhx6dyBga9GGwfLqEEcjWdNDxYfz0
         1VmHUhM42Qf7yyXDbVIz6chg2GJaBW/zJ0Sua6vuOUD/7r081PtOEnvQHLbjzO3XlLYA
         USXjze/WynwLGuWKMOucm850uI4BSfuNnTatyuxvKhZIpKhg7kbpLIt7KpxiS3zAXnia
         o47A==
X-Forwarded-Encrypted: i=1; AJvYcCV4EM+wJo10PbNb+gjhioBJ5t213EClFYxVldrFV0Orzi3Y+OOfZekmQPkGceikQm4tQ2sowox3IG0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwugsvcSTUvVQAMPje5tMCaHtCH994DnCQz8YpZb1iHY6wIfOEI
	IKV80vF37U5iM9C7PI2FixDswhMFJ5eVJ5eRZlqJb+7HHVAuqKjew3pZtr8vqBTzX6NOAgJSpJD
	QKGb173iwN2qAKZ95V1yb4Tjcj9KkPYMSGmSqrMpG
X-Gm-Gg: AZuq6aKhy/K8bD11fmg+dn9MN8ydY0B5OjZU0DaZxuy2UYW1Mryv8WkeEtiOg1N/Dz0
	h3gAryuemg5UY8zESEZu0L9wVCUjfdYB5Si8uWQpBMLnDl0It+2Nz8xVG8KTktvlFkH8UPeVOKe
	hU6PMcCAgYoAY5SNV1wndARMZoa8tiWot+sHzVVKfSyt5gC/XfylWirgIruq5ieQZHrPx6x5ye5
	yt9yT1/SAVEYv93iYxXhJhyzakkk0bnV3QQylWJMUoCunqrpXpcKsPMuaXnEF9CpfUbi+14i6Wp
	j7HxcIOZ+JuEfIxuEVYefEMb6tUnQcnRHTI=
X-Received: by 2002:a05:6102:3a12:b0:5ef:7220:bcb2 with SMTP id
 ada2fe7eead31-5f54bc8224dmr480092137.28.1769122050230; Thu, 22 Jan 2026
 14:47:30 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 14:47:29 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 14:47:28 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ee9c649eed3893d852c3d20fb96bdc4904b7c295.camel@intel.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
 <CAGtprH_qGGRvk3uT74-wWXDiQyY1N1ua+_P2i-0UMmGWovaZuw@mail.gmail.com>
 <8c1fb4092547e2453ddcdcfab97f06e273ad17d8.camel@intel.com>
 <CAEvNRgEbG-RhCTsX1D8a3MgEKN2dfMuKj0tY0MZZioEzjw=4Xw@mail.gmail.com> <ee9c649eed3893d852c3d20fb96bdc4904b7c295.camel@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 14:47:28 -0800
X-Gm-Features: AZwV_QhacTtf2zgQk3uMxNHfKwdT09Bqx79KDOGE5Z3VW9UujMTrgN_9VI-QiKU
Message-ID: <CAEvNRgEz0+ic9uvcsWYqWgR5EV=TfY0SAGC39zAL+n19SoBXmw@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Annapurve, Vishal" <vannapurve@google.com>
Cc: "david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"jgross@suse.com" <jgross@suse.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"surenb@google.com" <surenb@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "x86@kernel.org" <x86@kernel.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "ast@kernel.org" <ast@kernel.org>, "pjw@kernel.org" <pjw@kernel.org>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"willy@infradead.org" <willy@infradead.org>, "wyihan@google.com" <wyihan@google.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"jmattson@google.com" <jmattson@google.com>, "luto@kernel.org" <luto@kernel.org>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "haoluo@google.com" <haoluo@google.com>, 
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, "peterx@redhat.com" <peterx@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, 
	"mhocko@suse.com" <mhocko@suse.com>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "song@kernel.org" <song@kernel.org>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"kernel@xen0n.name" <kernel@xen0n.name>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"jthoughton@google.com" <jthoughton@google.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shuah@kernel.org" <shuah@kernel.org>, 
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, 
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"gor@linux.ibm.com" <gor@linux.ibm.com>, "dev.jain@arm.com" <dev.jain@arm.com>, 
	"daniel@iogearbox.net" <daniel@iogearbox.net>, "jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, 
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com" <joey.gouly@arm.com>, 
	"derekmn@amazon.com" <derekmn@amazon.com>, "xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, 
	"jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "jannh@google.com" <jannh@google.com>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "will@kernel.org" <will@kernel.org>, 
	"seanjc@google.com" <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Thu, 2026-01-22 at 08:44 -0800, Ackerley Tng wrote:
>>
>> Can we disable direct map removal for errata systems using TDX only,
>> instead of all TDX?
>>
>> If it's complicated to figure that out, we can disable direct map
>> removal for TDX for now and figure that out later.
>
> In theory, but it still would require changes to TDX code since it does
> the clflush unconditionally today. To know whether clflush is needed
> (it's a different thing to the errata), you need to check a TDX module
> flag. (CLFLUSH_BEFORE_ALLOC)
>
> Gosh, you know what, I should double check that we don't need the
> clflush from the vm shutdown optimization. It should be a different
> thing, but for we gave scrutiny to the whole Linux flow when we did
> that. So I'd have to double check nothing relied on it. We can follow
> up here.
>
>>
>> > Then there is the clfush. It is not actually required for the most
>> > part. There is a TDX flag to check to see if you need to do it, so
>> > we could probably remove the direct map accesses for some systems
>> > and avoid temporary mappings.
>> >
>> > So long term, I don't see a problem. For the old systems it would
>> > have extra cost of temporary mappings at shutdown, but I would have
>> > imagined direct map removal would have been costly too.
>>
>> Is there a way to check if the code is running on the errata system
>> and set up the temporary mappings only for those?
>
> The TDX code today doesn't do any remapping because the direct map is
> reliably present. There isn't a flag or anything to just do the
> remapping automatically. We would have to do some vmalloc mapping or
> temporary_mm or something.
>
> Can you explain what the use case is for unmapping encrypted TDX
> private memory from the host direct map?

There's no use case I can think of for unmapping TDX private memory from
the host direct map, but Sean's suggestion
https://lore.kernel.org/all/aWpcDrGVLrZOqdcg@google.com/ won't even let
shared guest_memfd memory be unmapped from the direct map for TDX VMs.

Actually, does TDX's clflush that assumes presence in the direct map
apply only for private pages, or all pages?

If TDX's clflush only happens for private pages, then we could restore
private pages to the direct map, and then we'd be safe even for TDX?
