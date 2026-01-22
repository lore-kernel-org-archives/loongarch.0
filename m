Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B303816E2
	for <loongarch@lists.linux.dev>; Thu, 22 Jan 2026 18:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107080; cv=pass; b=DWB2FaiEUUjRDyFHVAW7TZqLi09PKkAUqN01o0NiQlgw/WExRbEiVZ1hjeu5+yNocZC+Znrh/b2cde9MHwHJEaRylS+omRO1r6SZhVefI/1KBd3/KCH5gNv8bGbN+w6BotFDj+yLQO/qkAZ5hj5gNrWazJK797Rkz13PmmQl65o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107080; c=relaxed/simple;
	bh=Rur9bSt0hgAR6phZOgAdh5Lfm4ayEbdbSjuSfNntYfo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iq6S6vQtS8aBT8orPTMZwwCVV1BGJ9G8cLLIMLgrjOprhoAhuNmCzN+bmCeTyHwZ3+OBh+cnnmtaaNYxKXYdEIw9xpTr20wUYUmtvnmE/YNtJNNuXNc1Or36eUH5kGM8obfQDbd5WiOxlDn02qTPGB694AQVxHhWNwxmMjWMp8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pYy8a6pu; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pYy8a6pu"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5634feea416so768567e0c.2
        for <loongarch@lists.linux.dev>; Thu, 22 Jan 2026 10:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769107060; cv=none;
        d=google.com; s=arc-20240605;
        b=JFU6nZyGAF8nMiBQxrx7XBTA2dqnjPudsyOkckZ07d/Hei+ke7qwv7jZWrhh5C6w0s
         v8roxrrerNRqH8JZQ3kdioQ2CCsCeIoJ80/9DjII6U3ixB3qW7pxiNU4jze44Q5aaNEA
         R2usSEWx2faNu3RhHJxqoqPfxpQTXHUad0SJzdGQO/XDD6pOZsGlNcrGYXfCmP18t1K/
         nGKzvD5lv2DLHRpuhR2rj2Oae1hf1o8LXqaixOiJMl+7REGF8esjV6uJH56m/iWPPGCo
         jMp1+r9NvsYIiJhq+3VGy9HErm9zq883eO33MlrF6wjKag8q3xG2mHpk7RPBlrw7w2Ei
         Nq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dm0SGSE+J6wsaq7NHikcDRa1xq67WXlvnQ6Xcq7PISg=;
        fh=qyiuvN1+fskw4TrzfmSOAKNvDwzaRUHtvpPHzeY3MZY=;
        b=cym2Qs4HENkKu4kxzRe7JtpqLt2vgiUPCfbyPoDAI/3Ce9hp1IpV+zm+Ak6TCbyBZS
         TcNIZ2yY+Kdbj158ATU/D2hscPDxAXgOByjM78imA1G1LsjJ160NERw/0SXc7ZGMG5xx
         xp5hsd29uC1i4AznUt/PPwlX3AYvMmtLkRI7Bm+eXCASL5uGliFIQ+edA2f4AktIOvfD
         oOoX3KoJs8I95/hSNRYgLJQPl0Sx3Btnl8pPUeSNx7WbuM+HLU+7Bo37M8u8s0YsCojU
         p1PeFhZnZWZZDOjM7DAa1ZqIRiGK47sfRpaxKZ+ebXTx2GeRqHLptv960JIZMYgZj+Y+
         ITkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769107060; x=1769711860; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dm0SGSE+J6wsaq7NHikcDRa1xq67WXlvnQ6Xcq7PISg=;
        b=pYy8a6puoQY6zkCCdWi7zMQrBHpfQLUznGh9QVMdw4X+h52lqDTwa2qBw+WhLzSKb4
         q3Dtf+iiGtBv/S3rLeXtFMZSXe3tWHUzV5ljy9UlkDKm6SfV36zjMdDhOI3P6uKMO7Vj
         iE+U8Q3OPU53XM8HlsENHP4Ysi6bM9Gh5OQxL4ZsDU135+bWmXXcqRKBvDseZxPrnx8M
         VkxhWR+NLm0nDVTk5ewbZy55BHni3x18/4pBAmIuTiSl9+T2kRiY/wcwm7Yyrhfvkwyo
         H5XIW1Ir1WyL5TnRfJG6efWL6/8QFlP68SBiZ+qlPmbC6anbMePz5pKRhD/cv5Y2ydHD
         qxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769107060; x=1769711860;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm0SGSE+J6wsaq7NHikcDRa1xq67WXlvnQ6Xcq7PISg=;
        b=gAdgB6Mx/UkEVd+m9tOWlvZM4AcAOltgfC2/Pi3+1vqomF91CQWOX+9RidSyLhZYWI
         JerLoVrfhLEzsRQpXKigxs7phDRDygvkYuCKB2/XjklgULp31qtoLe4Pq6sLVbwoCvQJ
         KFXMGpGGLmUfiDL/wvHinFZBDtq5TAYbs6gEfD3pSbI+agwozdLUR/rwX37T6RjeUNYp
         Fxx+fWOqZtbhPFrvnBJgPcAlZWQty6TtG8XrlMLQKgGjAqs1WmDDGZQzzL1LJzUsE3FH
         dGO1zfPkQ8z8pURONIYGRSCaO94jjBUYyxQkzypq/QFVVf5dWqA14GTChYwC4XaupziE
         5KMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr1TeVTx9vJitH4I5SYZTlZPfEeNYgwdsJC8CMVXJXojXGtZniTk4XT8uoyL8Kv1amyHICFU5Stpc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxF9VvE7Pf7HLRZKreBxzEFlfizh66gFofKihHnK+ORpKHz7a5c
	Wz4kdRaeHN/5JoC9ekxnOzhsL0bicbNknyyWNzjwwW7KSKnE1wNSKMmaT4chAe4gO9jQq1wgoTt
	e/nsR8ZOkIZW7UQb1Tnvdh4yUFcr30IOn5nxSDH41
X-Gm-Gg: AZuq6aKzZbb559pY6g68cYMccWlcCZOBONgfapN/KjDnxYoPCdz/j0qzx4XxIYi0yKv
	XYcRzWq6lQYBCKqO3mHjiLuqv+0fkLrxWHXFvcGZL//rahjXB2o4wsry9deXOZBut9PdBYdfAJR
	OkuhOj4cBKxopq0uvxUnIHp+TO8jsP9DseeJerO3QuRy6nU1+8XdBbUfU69H3Eb7UhukR/8jqF7
	Ttmn8cU2CB4LHCU6HQipwlgyOL5f/rRU8mIj5XFvzMKKuiImg5dgA2B/0KXYqo93ChSGoKXEQ7Y
	AtRU/5QwH6Tn191sl4glHLbb
X-Received: by 2002:a05:6122:1799:b0:54a:992c:815e with SMTP id
 71dfb90a1353d-5663eaa47acmr191602e0c.8.1769107059228; Thu, 22 Jan 2026
 10:37:39 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 10:37:38 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 10:37:37 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <294bca75-2f3e-46db-bb24-7c471a779cc1@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <e619ded526a2f9a4cec4f74383cef31519624935.camel@intel.com> <294bca75-2f3e-46db-bb24-7c471a779cc1@amazon.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 10:37:37 -0800
X-Gm-Features: AZwV_QhFeXvGMv5345sr6hAOQL-xKTYrLyTeQaptQlhk8j2vfvA1j50rf6t-uyU
Message-ID: <CAEvNRgEvd9tSwrkaYrQyibO2DP99vgVj6_zr=jBH5+zMnJwYbA@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: kalyazin@amazon.com, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "david@kernel.org" <david@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"jgross@suse.com" <jgross@suse.com>, "surenb@google.com" <surenb@google.com>, 
	"riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"peterx@redhat.com" <peterx@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, 
	"thuth@redhat.com" <thuth@redhat.com>, "maz@kernel.org" <maz@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "ast@kernel.org" <ast@kernel.org>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "Annapurve, Vishal" <vannapurve@google.com>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, 
	"pjw@kernel.org" <pjw@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"willy@infradead.org" <willy@infradead.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"wyihan@google.com" <wyihan@google.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jmattson@google.com" <jmattson@google.com>, 
	"luto@kernel.org" <luto@kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, 
	"mhocko@suse.com" <mhocko@suse.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"hpa@zytor.com" <hpa@zytor.com>, "song@kernel.org" <song@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "jthoughton@google.com" <jthoughton@google.com>, 
	"martin.lau@linux.dev" <martin.lau@linux.dev>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "eddyz87@gmail.com" <eddyz87@gmail.com>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"shuah@kernel.org" <shuah@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, 
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, 
	"xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, 
	"corbet@lwn.net" <corbet@lwn.net>, "jannh@google.com" <jannh@google.com>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Nikita Kalyazin <kalyazin@amazon.com> writes:

> On 16/01/2026 00:00, Edgecombe, Rick P wrote:
>> On Wed, 2026-01-14 at 13:46 +0000, Kalyazin, Nikita wrote:
>>> +static void kvm_gmem_folio_restore_direct_map(struct folio *folio)
>>> +{
>>> +     /*
>>> +      * Direct map restoration cannot fail, as the only error condition
>>> +      * for direct map manipulation is failure to allocate page tables
>>> +      * when splitting huge pages, but this split would have already
>>> +      * happened in folio_zap_direct_map() in kvm_gmem_folio_zap_direct_map().

Do you know if folio_restore_direct_map() will also end up merging page
table entries to a higher level?

>>> +      * Thus folio_restore_direct_map() here only updates prot bits.
>>> +      */
>>> +     if (kvm_gmem_folio_no_direct_map(folio)) {
>>> +             WARN_ON_ONCE(folio_restore_direct_map(folio));
>>> +             folio->private = (void *)((u64)folio->private & ~KVM_GMEM_FOLIO_NO_DIRECT_MAP);
>>> +     }
>>> +}
>>> +
>>
>> Does this assume the folio would not have been split after it was zapped? As in,
>> if it was zapped at 2MB granularity (no 4KB direct map split required) but then
>> restored at 4KB (split required)? Or it gets merged somehow before this?

I agree with the rest of the discussion that this will probably land
before huge page support, so I will have to figure out the intersection
of the two later.

>
> AFAIK it can't be zapped at 2MB granularity as the zapping code will
> inevitably cause splitting because guest_memfd faults occur at the base
> page granularity as of now.

Here's what I'm thinking for now:

[HugeTLB, no conversions]
With initial HugeTLB support (no conversions), host userspace
guest_memfd faults will be:

+ For guest_memfd with PUD-sized pages
    + At PUD level or PTE level
+ For guest_memfd with PMD-sized pages
    + At PMD level or PTE level

Since this guest_memfd doesn't support conversions, the folio is never
split/merged, so the direct map is restored at whatever level it was
zapped. I think this works out well.

[HugeTLB + conversions]
For a guest_memfd with HugeTLB support and conversions, host userspace
guest_memfd faults will always be at PTE level, so the direct map will
be split and the faulted pages have the direct map zapped in 4K chunks
as they are faulted.

On conversion back to private, put those back into the direct map
(putting aside whether to merge the direct map PTEs for now).


Unfortunately there's no unmapping callback for guest_memfd to use, so
perhaps the principle should be to put the folios back into the direct
map ASAP - at unmapping if guest_memfd is doing the unmapping, otherwise
at freeing time?
