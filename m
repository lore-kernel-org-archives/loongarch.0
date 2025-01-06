Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6244E1DD87D
	for <loongarch@lists.linux.dev>; Mon,  6 Jan 2025 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170511; cv=none; b=lpjRgo0DZwEVK03SzQql6dAzXeDIKaCreS5p8HoHrNYt6K88+cGPO21+m6hWgDZdwETrmuF/NvppVAEJkFF+NJvtTBFdmPoAt82ctlv5w/IrwblXfu1ZhpBhVxzY05MFGzWOgh9sL8hZWEN+aDq+XGbh5JcdqNeCZ4jqHd44XTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170511; c=relaxed/simple;
	bh=rzubnT0gas16PzeOBWAv24OQZ7te5xw5qxzCAysoAMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5RLhwXLQhrZ/fM/EpZpZU8D4zBC5pAxh+CLwmiZ+7wGFZ51fsXseJHCx3pUvsblHEO7neFge3KtQIzxvscZtVia/eNlOruz6nPS8WoLubXZTJ3QwIWdZm2T5bu+Kdi4G867o0QNKBRl5/VTq3QqcLQLkgc/kC76fu7qj9oVKOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QfddceeP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QfddceeP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21670dce0a7so23051435ad.1
        for <loongarch@lists.linux.dev>; Mon, 06 Jan 2025 05:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736170508; x=1736775308; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSl9CiTNSQwE0RKlCdBtogvBaV/TE9/iFGVUzDM7I3Y=;
        b=QfddceePFNResDn94FaetbaXHixp74qrXitE0DU6G4jpd9rFe2Otgmqyzm97uo5CGZ
         O4Jz3JEK/S069CPshS296uFZPs+E7IClGOwncSgY6/nIqVY4KKktOOml5mbt0+7BpzfE
         1HEv+CDSxK4v9tBaJUajClmhguLMph7Y3sS6TnybgNe3y+yuCayKZT1PlnYDe38Gyp6R
         MlZbTJQlbizuNcu9vj7U8VqqF1754D+g1gPRvqGMA4CZWtl+dHzo7b3EMfFQOjRxvUp8
         4MBaa8v5iSczsBZMm5x2kig6yF36Ndhb8eohRbXQ3LD2FD9Kc2mXkUs6bt1F8diNFN4k
         h1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170508; x=1736775308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSl9CiTNSQwE0RKlCdBtogvBaV/TE9/iFGVUzDM7I3Y=;
        b=M8FmUM00YOG5tOUYTvjHJf7nt47DFCYk8SoX9PpCReX6h1FKXO5CX7XLj0OprYTo0p
         QzVNBOA6XbELHr6tQmzPIl2ZmYhySih+Vf+h9rREnEV2XVIaj4YZIO4HSrvUtlSxiEOp
         FeVBq5WDAY/OkgfhKY0M3qnOUqG5QRPIqjnk3CE86KGxYUBghoVNE0lxmV/oclAhWxpj
         ta9ZMQBi1i9SsrRNOyAoCe4l0vWDH8E5/H2zN+7QUDhAwjQDl2f8rIS6SsqHJVs3+oIu
         4tAc56tSJ+yXvylQGpxmXUxKT8QLOMqK9XJbkUJd5BN4mxySD+lRdWPJRwD1nVqc8Sgo
         u1rA==
X-Forwarded-Encrypted: i=1; AJvYcCVhy0v8SgE7EYxkfVOb5qeU28Evn0AjvjwRljbaA7EGFq/KvILpyKSWRPsx8aGGQ2TcNjfupEY8az4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzGRgew7+ePdUbP0a76ML3U5i6zH3k71j3VLq0AywAXGhSO6Zv
	9uoCIZqCs1wHSroZyJRU4UHl55MrM6sx5hbutI4eUssOejgPVgWFU5QEYfNzchc=
X-Gm-Gg: ASbGncvogwLYfhsD6CF+ujEMrR8YXmL8XaJiWkoiuPY8ljUSidr06iwGgA1ebO0c1eA
	FrUBBW90gPKyUdHVwEEaWIcWXJe3h8E7PuQzu3kOqcWhgcmLpTYfDPurA8eu4sQo7scIOnigdo+
	ZvtToUc1qcewNo5TEmnqwG42HpRQDgA1H3G3YV6Gvffa1uMQ3aZ7Zn2ljkMqFFfAJXzSjBXUMr0
	NCNVDCGidwpBg5NKWGXnqH2eWvDqUIu/oMs68u+dXyyBowjXuDAc0/zyNF2RnJ72NmIeTb5hNT0
	tUWDo1lU1+j97uuAjhaHYZkOksCFL1v5wRnJmTP3HPK9oaftPKjV
X-Google-Smtp-Source: AGHT+IFuxfmftFbdw6fO4bIMnZYJ/q+si7Sq93AxF4PGQarIeYtLJTB7gRBGy3tWc8bUzZwj1LueBQ==
X-Received: by 2002:a17:902:e844:b0:216:3083:d03d with SMTP id d9443c01a7336-219e6f13c50mr852868805ad.44.1736170508636;
        Mon, 06 Jan 2025 05:35:08 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdf02sm292469725ad.151.2025.01.06.05.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:35:08 -0800 (PST)
Message-ID: <57ea8193-2fd9-41a9-85b4-7af924f900f4@bytedance.com>
Date: Mon, 6 Jan 2025 21:34:55 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of PxD
 to __tlb_remove_table()
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
 <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/6 20:44, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 07:02:17PM +0800, Qi Zheng wrote:
>>> On Mon, Dec 30, 2024 at 05:07:47PM +0800, Qi Zheng wrote:
>>>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>>>> PMD|PUD|P4D to __tlb_remove_table().
>>>
>>> The above and Subject are still incorrect: pagetable_dtor() is
>>> called from pagetable_dtor_free(), not from __tlb_remove_table().
>>
>> Hmm, __tlb_remove_table() calls pagetable_dtor_free(), so moving to
>> pagetable_dtor_free() means moving to __tlb_remove_table(). Right?
> 
> Right. But you Subject and description claim "... also move the
> pagetable_dtor()" not to pagetable_dtor_free() - which is another
> function.

OK, will change the subject and description to:

s390: pgtable: also move pagetable_dtor() of PxD to pagetable_dtor_free()

To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
PMD|PUD|P4D to pagetable_dtor_free().

But pagetable_dtor_free() is newly introduced in this patch, should it
be changed to 'move ... to pagetable_pte_dtor_free()'? But this seems
strange. :(

> 
>> And the main purpose of this patch is also to move pagetable_dtor()
>> to __tlb_remove_table(). So I think this description makes sense?
> 
> The patch makes sense, but the description it is incorrect ;)
> 
> Thanks!

Thanks!
