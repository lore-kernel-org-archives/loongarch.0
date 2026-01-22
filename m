Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95110286D7D
	for <loongarch@lists.linux.dev>; Thu, 22 Jan 2026 00:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769041226; cv=pass; b=ZzISnjcTU7fIrc3TnlGhUemItfoNKLNJWf3o7roSTYIs74HnWlUPvUrhhlrQlZ9PtoVPTAIT2rdtCJs8ma9K2wi5RunzYRX60h3aXR9VS516nMZUQYosZk7ZcaB3JhveWg56peqmyQspqruU44p/tgQCpGD6mzxuRHMQex1JiqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769041226; c=relaxed/simple;
	bh=uDet0qkeSRR1s3nfeSTE4gpghrVQ6C4op726XCOFlug=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Slwt6W/80ZqwFrwA0nAu34oQtZGl6sHB1YumLgPuPsJeKbW4+ffRxRRJEzv+FAQ4jY7Oyy8VzoS3hCQ2W0WOshuUtWYE7BneiIYIHdL0t7Bu4IjwA8rvvDWog0SYHWeNGEoHa9ttitWvoH7xpvKvN4V8tCLJqDVS6pKLQXCwxzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jklawfyC; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jklawfyC"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso231560241.0
        for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 16:20:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769041222; cv=none;
        d=google.com; s=arc-20240605;
        b=bEhTBXXyWW8NVOtFJ+iU8jOKaTF+0brx73uysDmCzrVO5zD7ZNSeiNz9TkL2S3NdPY
         2myqXnfYDThqHHfVg39c8EAWwHQ6PM1zanf+VRhdf60UxiXR+5qVxOF5R7zRuz9OkC96
         piBnR/UIVTSNJ7jL3HIHskdKXd3v/2Y+FFMvRSkq4lX4WznjBWg1L3aaRaAKJk6JLWzc
         Q7IINSfy5nWVo9lzJ/qXfmGjrZ0ORQB2Rsq2HZk2iW4pitrGUz9eQhnsJvBy93jVj46/
         oZr7BWf3ddPgC/h9JJkSnhyzNWnybjTyy7uLFEak++1otWxWDHTeDxDiSUz3VVjCLnIQ
         cdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=NgWkbldIsVdXmF1uopkpscBQ8hvxBRp9zzbekpxQ/oc=;
        fh=haDAYZxPwtexVyiro5EUGEeSux+ZqrBindm/22UQPWI=;
        b=PTJepvn6AVjIVePdruFsedMfL3ocOJEmzfOVSUxazeK/qmg8rKU6956MUl5AEuLf82
         4C6rrmB70RVLokJwXKeDKW60l+5yV8xyvpWomRHRJpEXMk9mHhhv8Z5iId6S3UdJ/3Zq
         0b15wR8J+cd8kZh1PDG1IR25iapM/UQDl5bqNh6W0nENwcXv3k36oEMTnusBu9ATFHjR
         2elWZ5yctwG+dKXxU636hJWFARDKMbQ8MlHBHkkH3pQVynwOv1NE8gO/0NEmDFkhDoUB
         ve0CGeky42D+TIYleRlLUd+r4sC+t5AATq1FC+N36X9OiyBQFFofvBWB875rfWHpwHmP
         fKKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769041222; x=1769646022; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgWkbldIsVdXmF1uopkpscBQ8hvxBRp9zzbekpxQ/oc=;
        b=jklawfyCmFd1/dYeJHdsRlefhqyaeauT5bIcHVjHGOJwTnNvf+HwrsQPmVJ/7DwDh2
         N4sEQwAA12JNuCGUpXLiuW0rsqbLZfAymWvLFx7ZbgDi/Zj6hmntjBpjmgKiDAqgAGna
         wYwo9IW4h5J7LC/W2LatTj3pIFeIRcNmTenQ3dxpyZ9N2rxFNG50EfUezSvLR7Ihu0oz
         fqr0ag0gS1YuCgr6s1o3FWN9T35XWR/mD13nP6bdHBhIWpxrytit89LfQbA2X72O2tvO
         l3+OxkNAwiRY4aYFZbYfiubjw1wGO1KRMFrt0X3T47we/wN+88ByC4eqUY2/y35XnbdN
         kziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769041222; x=1769646022;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgWkbldIsVdXmF1uopkpscBQ8hvxBRp9zzbekpxQ/oc=;
        b=T7zyaULqu2iup6CFxLL65bwCRetdFSlgbXQ7HQQJYXy8Xu3igWbhDZSlpSIqYtg8jB
         ohYuDXqDfuu4rIACo/KSq/szFFGlyyT6bPrIpDnboyo2/1PujZTqJpEq474vHsORtXY1
         RQcVATqCtvLJrLKPkBOnEIf1g6x5LV87jatZxC/UpRGKb6Ud3jMmu9zrrvUky2tRe9kL
         zqVm+LK9AQlmRE2RP2KXo8YcSeU79HNNZXy3hHGRN9skrcwe8B2liFiPkfJn2cCYlSrj
         AEL2rp77dorRZ7qKW7WoAJ3oWAczZ/mEMT+yyCmqNkMWQm30Y5EmlgIv4eTN43ucj4KG
         Wp8w==
X-Forwarded-Encrypted: i=1; AJvYcCVZSA2CszhcqYl24bD2ATm2REkCGg9CQLeyc1kX/CZ8sEK/qS/NvIge9PZaoIk3PRKbVYNhIpjU0Ds=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyol8wsroY6uuMv6aDLkWqNX3l6FQLj2Ki/bCnfBL8Qo1dQxUpx
	SKmJ2zA6MlJkElsX35gXY2anFw9OlXLpeOwpbHeROBEmrlQGjNzutZE4Bdhq6RsruauFhITPYKt
	Sqtx9xDvIQhHFmBtTRxglvPPEIRSbS9W02W4dVA4Z
X-Gm-Gg: AZuq6aI8bOAseQrHwUBz19ORSYzZ3vYzG58PoAUbUj6JHUOf6NXY7uyBPWIjtRKH+sR
	zqccf4GQkQX6DGyEAchMOTiEG4+S1/ZraPYCxYahjEvP5qw9OyrkrpZnyMidr0G5Q1+6PzGWW9d
	FnzliTSY+Rp3JZMMKUHEe7eNf+ka84kFi3NR+1UeIFhsaQp0haACLnNl1VuYTVxGVSGYrl3V9RZ
	Qi5tuCx/fDBkTpsbdI8+iQ50d3/HxSvSmmxPuf7smbg/0mw29zrx1WOYs1HrcOBTIz7ycytjtEs
	/woP2j+qiQ4qfxm4b4dTABZiJQ==
X-Received: by 2002:a05:6102:370f:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f532daa025mr403198137.5.1769041220288; Wed, 21 Jan 2026
 16:20:20 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jan 2026 16:20:19 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jan 2026 16:20:19 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <6b50a83e-acd7-4db3-ae9b-015ffad4f615@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-3-kalyazin@amazon.com>
 <CAEvNRgGrpv5h04s+btubhUFHo=d6mBFbr2BVrMt=bWuWOztdJQ@mail.gmail.com> <6b50a83e-acd7-4db3-ae9b-015ffad4f615@amazon.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 21 Jan 2026 16:20:19 -0800
X-Gm-Features: AZwV_Qi8Ad3srMrd8WYJ_YHR6Nmvzc-hfHPfYm40mDZ1I3o7aAQCl-nKoDyQfts
Message-ID: <CAEvNRgHMdnALNfT0SuEb-gqM1Aq1c6U_nRB2GzC0jYqrDRJTOw@mail.gmail.com>
Subject: Re: [PATCH v9 02/13] mm/gup: drop secretmem optimization from gup_fast_folio_allowed
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

> On 15/01/2026 21:40, Ackerley Tng wrote:
>> "Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:
>>
>>> From: Patrick Roy <patrick.roy@linux.dev>
>>>
>>> This drops an optimization in gup_fast_folio_allowed() where
>>> secretmem_mapping() was only called if CONFIG_SECRETMEM=y. secretmem is
>>> enabled by default since commit b758fe6df50d ("mm/secretmem: make it on
>>> by default"), so the secretmem check did not actually end up elided in
>>> most cases anymore anyway.
>>>
>>> This is in preparation of the generalization of handling mappings where
>>> direct map entries of folios are set to not present.  Currently,
>>> mappings that match this description are secretmem mappings
>>> (memfd_secret()).  Later, some guest_memfd configurations will also fall
>>> into this category.
>>>
>>> Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
>>> Acked-by: Vlastimil Babka <vbabka@suse.cz>
>>> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
>>> ---
>>>   mm/gup.c | 11 +----------
>>>   1 file changed, 1 insertion(+), 10 deletions(-)
>>>
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 95d948c8e86c..9cad53acbc99 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -2739,7 +2739,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>>>   {
>>>        bool reject_file_backed = false;
>>>        struct address_space *mapping;
>>> -     bool check_secretmem = false;
>>>        unsigned long mapping_flags;
>>>
>>>        /*
>>> @@ -2751,14 +2750,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>>
>> Copying some lines the diff didn't contain:
>>
>>          /*
>>           * If we aren't pinning then no problematic write can occur. A long term
>>           * pin is the most egregious case so this is the one we disallow.
>>           */
>>          if ((flags & (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE)) ==
>>              (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE))
>>
>> If we're pinning, can we already return true here? IIUC this function
>> is passed a folio that is file-backed, and the check if (!mapping) is
>> just there to catch the case where the mapping got truncated.
>
> I have to admit that I am not comfortable with removing this check,
> unless someone says it's certainly alright.
>

Perhaps David can help here, David last changed this in
f002882ca369aba3eece5006f3346ccf75ede7c5 (mm: merge folio_is_secretmem()
and folio_fast_pin_allowed() into gup_fast_folio_allowed()) from return
true to check_secretmem = true :)

>>
>> Or should we wait for the check where the mapping got truncated? If so,
>> then maybe we can move this "are we pinning" check to after this check
>> and remove the reject_file_backed variable?
>
> I can indeed move the pinning check to the end to remove the variable.
> I'd do it in a separate patch.
>
>>
>>          /*
>>           * The mapping may have been truncated, in any case we cannot determine
>>           * if this mapping is safe - fall back to slow path to determine how to
>>           * proceed.
>>           */
>>          if (!mapping)
>>                  return false;
>>
>>
>>>                reject_file_backed = true;
>>>
>>>        /* We hold a folio reference, so we can safely access folio fields. */
>>> -
>>> -     /* secretmem folios are always order-0 folios. */
>>> -     if (IS_ENABLED(CONFIG_SECRETMEM) && !folio_test_large(folio))
>>> -             check_secretmem = true;
>>> -
>>> -     if (!reject_file_backed && !check_secretmem)
>>> -             return true;
>>> -
>>>        if (WARN_ON_ONCE(folio_test_slab(folio)))
>>>                return false;
>>>
>>> @@ -2800,7 +2791,7 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>>>         * At this point, we know the mapping is non-null and points to an
>>>         * address_space object.
>>>         */
>>> -     if (check_secretmem && secretmem_mapping(mapping))
>>> +     if (secretmem_mapping(mapping))
>>>                return false;
>>>        /* The only remaining allowed file system is shmem. */
>>>        return !reject_file_backed || shmem_mapping(mapping);
>>> --
>>> 2.50.1
