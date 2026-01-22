Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E83392C3D
	for <loongarch@lists.linux.dev>; Thu, 22 Jan 2026 20:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769113862; cv=pass; b=hYjK6OlTm697l7DEBCV170HK2W4qvDFonswzdW2s1narhnEdw9QOvh5ISyvo0gWOQOsI8lxOxRzhpCWYjEGqBVPKGGuW2itfa82G4iyzsB/CvGREH5umYvWj3lwaOJPVMdtxEKj8mPnt98ehheFAWvcmv/A3hKHj0Ee0/LS6Vqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769113862; c=relaxed/simple;
	bh=ASZplhRqMNnIuXI0Gmdw3pwrAxGsQ+x5dICWN1yZY84=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsdxosHwAnbiBKJifD0OsLm2O9CrQMFDja8VWXBXsEc5H719qzdSzLf9ASYG1MR36oxm1TmwWO3/cmIUaZ3W0Spilsc70elMYg1tNKs0+Qz6+4br2cxCaGfYOd1NKjNAtCMgKmwzFs1ZwxJDERyw8gKYi6iIgQGv6iPpZ7MSl7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wErIT7zi; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wErIT7zi"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-947fe9e92c3so952670241.2
        for <loongarch@lists.linux.dev>; Thu, 22 Jan 2026 12:30:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769113855; cv=none;
        d=google.com; s=arc-20240605;
        b=ezS9SE/ka0kVyzJvQD0tiOu8q+iivX4NoUh7KzrtPSadZ018nCQu37dSeRZkFne27t
         hmkzFanIFAuiHxdQDf6ufjHpuLwzBZRHE6c5dceb/2D0xwBCV9+x7DX0Tgjoqvf+wI+v
         +a/d/jzG7+0RvY6VkehyBOkzlXl6R3tYIGK0+7sIK43rfTY0VsfDSH2TX+iSFDan2iio
         yrAypSzgU9J75OqZyRfB9sCytcgKfauDRTka/vitvnbfMIG/THQmVRlnYdzQtoIwTxNJ
         AyIGQRLbtjzbb5Iv1Hjg3zD6ioXFfge2l+B9anVTatbYXlnuYo/qcPJqXDiNwH9aJMQk
         8M8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=BQj97zlME5zzETPT7vCk6obWp/pKKcD8Mr+mou6nGos=;
        fh=LdwhoNGnU0hZc+ertVBe1uymxxQ5uaGF6GLQteKFVX0=;
        b=AhBAkq4eKlbyVWkJhsMBCb31xVkKbSqQookIA/MVm/QYlJvkBvl1rAEX8hSm7qnftc
         m+WQoUM7udEwgjh3i7C/fTcWI6vKOqlULp673GI//zP3qzMVUkiJRrnnimddWDFxCHQr
         Aq72ABELzryTEIctCluNFAmatZ0tSWJxnfefI6+Mc2I9Ch9D3ZfWD/Ps2jscMnsvpBuG
         +DsuJfPmvg+rwR041pbmcYLDbanuYEnCrNqam0BdQhk7TMmv1BVjlT6ffwthHh90Ay7r
         ZjkEe9tNBKEI+cnNo8/CtEtvfeVumD7EirVWE6FX2nNJhgDnwcXPpuQ8qIPVcfwk3k5R
         6JDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769113855; x=1769718655; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQj97zlME5zzETPT7vCk6obWp/pKKcD8Mr+mou6nGos=;
        b=wErIT7ziMv2P4U5sBQCdqyYmclTmeSb7vHh1X56c3z2wB5TRd8DGauc4vC53jw82Ti
         Ib8jaLnPiomiMoiIcsw5VIyBIGd2L/AeuxHsxS90y3oonJ9FXSn+YjVfpb0BQQH7fwBV
         M6l43Qok9GwDZWSCbTdmpKLa18Chpgyp6YpWgLTbEIzFw0c2AcrNLcG24a1WeBdOBVow
         7xG+5NX/SzAV2i/YYij0o47y3TLbFUwYq7e38vYt48+tFzUODTEnJsSspxruPri3RTBu
         VHJvKDaxscJF+PLeOsX7cRMcrkRs+luLsSIxkfMATL9+qqbMKtY1WgSBEaxG0le0KcuC
         0jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769113855; x=1769718655;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQj97zlME5zzETPT7vCk6obWp/pKKcD8Mr+mou6nGos=;
        b=uGpj8pjS2kBoFuXE5e45QMRe5BuM16FPFbdU8zomZ3KBvByYX6Os9LtyPdYfxyPYuX
         lBTVndViw7cKaS8hMGgwnOFjn4LxFsWTLNaBDcSVombZMhLUd4XZ7ZcBIDgiSKkkIbyF
         4ehevNSkbX5glsU5WKMlk8IiSIxtiL+TU/l7Lm+pw84ak8Ah0K8eGq+nl0wcyLdpp7wo
         AUKv11bVTo8cdwDDhAcjfga6vghnN35J8euRvkwyUA5Tr9KS8W4CYSZDXoWUgN6DCsLA
         FQON2z84zcfpXqP+IAqyewEculxehQj3U6A15L8ofs+Ldv7sIdbaRD/P712mht7dqSNd
         nBJw==
X-Forwarded-Encrypted: i=1; AJvYcCUL8zg4ZQO1YAFi4Om1WJNgzvwNWNK9Qc26MM9LiZzbb33cDYZlhj2IAHm1wAKVX2BQ7LFeYcOKbaI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywye0C6h7M9G67j9zv17uqKVf1HNKjPOWcg9YI6Jt/OKtGo9eQ5
	DBCiZaY3XiHQ8T9vAK1YEgdQNW+qhMhKE2oBmX5bKhqNsZ2HFeXcXxAzzeqeqRerp6YThqMIC8P
	7DBVSAyEo0grmgLjCurot4bIGYe0q4/O+inh9kz9f
X-Gm-Gg: AZuq6aJfBu1IM02wwlEQr4wmB43nuVmFknT4TDXGMulvENu6NzMAHcO5dwfhlRR3nxG
	HxqJJ8J8YnhwBQwKx/BugV1QvI+O4x3mHtXfQipNA3mn/OU2qEPtyscPMMXQ1xm4qrSyegR2BQs
	9RER8pDDzTGqE1tuOVZgGOqmPu/FWyfTxC7x1iIeqGG3SoeSkCrI9oajlSfZ65hveycQfFWmYHF
	xds36ZcUE5/hR+MAcdooFw7CmK30MVvNXzn7qxWdUkwWz93K4r8D/iy1H5so/jurTcEUM4vzeqh
	f1pUJ7aQyQU4dOtpeozwAYWI
X-Received: by 2002:a05:6102:d89:b0:5ee:a8c4:18d4 with SMTP id
 ada2fe7eead31-5f54bd0c3f6mr359613137.35.1769113854610; Thu, 22 Jan 2026
 12:30:54 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 12:30:53 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 12:30:53 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <f2f2a6bd-5cb4-46c9-a0f8-3240670094b5@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <CAEvNRgEzVhEzr-3GWTsE7GSBsPdvVLq7WFEeLHzcmMe=R9S51w@mail.gmail.com>
 <a2b79af7-e5d1-4668-bff3-606f57d32dfc@amazon.com> <CAEvNRgF46M1jp0+eBu2wQMO7P1afyo00SOkENFwvB2KYX3dnFA@mail.gmail.com>
 <f2f2a6bd-5cb4-46c9-a0f8-3240670094b5@amazon.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 12:30:53 -0800
X-Gm-Features: AZwV_QhoTAbsDcZFNCQXVZ12J6m5MEBpBa-k8I2xwSPIY6AXvlNDgQnkgPrJ79I
Message-ID: <CAEvNRgEd=Uh09dU_P7_vvzRpOyMYd=OKazpkxzr=VLe5HcQhGw@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: kalyazin@amazon.com, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
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

Nikita Kalyazin <kalyazin@amazon.com> writes:

>
> [...snip...]
>
>>>>> @@ -533,6 +580,8 @@ static void kvm_gmem_free_folio(struct folio *folio)
>>>>>         kvm_pfn_t pfn = page_to_pfn(page);
>>>>>         int order = folio_order(folio);
>>>>>
>>>>> +     kvm_gmem_folio_restore_direct_map(folio);
>>>>> +
>>>>
>>>> I can't decide if the kvm_gmem_folio_no_direct_map(folio) should be in
>>>> the caller or within kvm_gmem_folio_restore_direct_map(), since this
>>>> time it's a folio-specific property being checked.
>>>
>>> I'm tempted to keep it similar to the kvm_gmem_folio_zap_direct_map()
>>> case.  How does the fact it's a folio-speicific property change your
>>> reasoning?
>>>
>>
>> This is good too:
>>
>>    if (kvm_gmem_folio_no_direct_map(folio))
>>            kvm_gmem_folio_restore_direct_map(folio)
>
> It turns out we can't do that because folio->mapping is gone by the time
> filemap_free_folio() is called so we can't inspect the flags.  Are you
> ok with only having this check when zapping (but not when restoring)?
> Do you think we should add a comment saying it's conditional here?
>

I thought kvm_gmem_folio_no_direct_map() only reads folio->private,
which I think should still be there at the point of
filemap_free_folio().

>>
>> [...snip...]
>>
