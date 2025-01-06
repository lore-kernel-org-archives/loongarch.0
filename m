Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA72E1DED51
	for <loongarch@lists.linux.dev>; Mon,  6 Jan 2025 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736174677; cv=none; b=qzYlYcs7rWcoXZLNzBnS3FQzy4ioXu/fE3X97k3Oc4GP2Y51GLXLOwjgzhf9hL+DD94i97H0zbbKdc1YbWoQZN4sHuMlMVCAeK4QYizrZ5TSCbnbM5oKDvuXI5LMzbki+FXGl75gctFCgJwHnc5kYbp3VnYE/EUuJ0rPdx8IvMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736174677; c=relaxed/simple;
	bh=FT+GsbrHFNytgmVw9pS4MWUyG9GELMc2aWIALV4R5HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVXUXSLT44ffKVDNr3iIfc5EHWytLRBybuAXgaMMXefGNniuBeECSKIUTS+EIwhcVvXpQ7wKGPF87AND4ZbuB5pXLwhoOX6GgHhKiElbqyJqUj/OFyXPdkm+eAVVuLZ1/D59rfpfzfCttxglFEN8ToPHSPE7fauTeEV9HaSsxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=A/NF6Xie; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="A/NF6Xie"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2161eb95317so214336675ad.1
        for <loongarch@lists.linux.dev>; Mon, 06 Jan 2025 06:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736174674; x=1736779474; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NViglkR77PlL2AqsFJ9M2rA8vsy0VBtzEibmSHACi+I=;
        b=A/NF6Xiebt8tnLdJI6MwGwZcUdupaki2NGhT+79WShlsJo+bF2Bv3DSY2hg20I2TsI
         FzYjiZ88mP8KG8Mm4qsmcoEeIz38GbXJ63c1UaXAbUVeGVq2B7mG8h9YacdXgEKNxOKQ
         FGh50vZfuEyXTP30dWu1Q/9zHysM6msNpyC0nU3ifMNhM1f9LnNfJUY++/I4LE73d4VJ
         NoeFivDSxQJSwI+kfPaYPS37W68yODTCvYmU4K8fmJgGwO1XdSxDi/uoMTgeXBiTOVdV
         TXxFbDHCef7FGqeDDCAVguWI7TablMf4RWU2qPkUD+LryXm73JmJ4xbLBKQrRcO3E9P1
         lDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174674; x=1736779474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NViglkR77PlL2AqsFJ9M2rA8vsy0VBtzEibmSHACi+I=;
        b=I+1ZohRX4IVVzwiC0IydeVCZxDbdjGGHENS187xLb0g9nMaigcL6tYwX/2q5Gx1FSA
         4nsIqM4hsS4dzkYaHIjXinH+cM8LrQs0HwAmxXi181ZyEmKyiTRN8cFbUQuriAB9+7kY
         jQbtuai6pLb40Lf9Ndmcc5uoZWtzEM0SBmdcKEdfYvwlF0bJpkIAWs8qyCsZvS43loe/
         +B/e7EosB5H2zE4zdqWfUkzxpJs0k0Aws+UA4ggexI3hrPC0LoxS/R6XL5Z6HHgq8VYa
         Hfp2arT6Ik/Bxyjah/lJxLwj4VBjMflhzPyOOe8q3XqqGrGuKWWPmgExQLj0a7WnrqL3
         TKVg==
X-Forwarded-Encrypted: i=1; AJvYcCXldiHERhAlIadYz77BEX9jVICl9nrsZQk8rRCZZffSZJbo9PHf/SJ7MGLton9EiD2P+TzyfHq67R4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcUQ45QtQChmjnrINlwZNMiKSW7LX5m0eDmwX0eTTm8X7H2CEd
	9OVXFGic3oZ+XFHkiBYICGF8Vm2usXA5Xxsva9aNKiSqvrXwPpsoFueIm1JgKSY=
X-Gm-Gg: ASbGncu2l1diN3iybVhf+Or3n1b5zvepJyMC6xkqtOFL0I0dwXp3QmLkkQwHcG0WeMb
	53rEoRktmDG3RG9Bjg1whlKk7xrs0lGd2Jbpic8mYNYZsMvB0cjEmI8TeKttcxvN65Xr4ROIGC6
	jl1cZNkyKRTmWmVQ3YSX0TSQCdHCJxWxX2mYBwzGKiJ6uHL6roHW7J8DWGQs0J4sU3eiRvHe4Os
	5HYb2D/ZZ2P/27iciRpYv/qWYS70eIf75QqDZ7Y2sJmbGHqtkoKlhVIUR0nbg5B7GWFJopBRyES
	0NYuxUJMAjK+2r+ljB4CmtWIfuemkGIy2BS+NOFPcn7Ulvc6mPMd
X-Google-Smtp-Source: AGHT+IHfRKlSBRBXUw7mHIW0SQFNESOEWbBrtQcBXd7/ffhetsdlBCZHRjeTrMJdIBfoDiMG7l+wRg==
X-Received: by 2002:a05:6a00:ac3:b0:726:f7c9:7b1e with SMTP id d2e1a72fcca58-72abddcadd6mr82367083b3a.13.1736174674262;
        Mon, 06 Jan 2025 06:44:34 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad815804sm31532588b3a.32.2025.01.06.06.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:44:33 -0800 (PST)
Message-ID: <dbcbf4c3-f86a-4414-be52-8ac02dae5b6b@bytedance.com>
Date: Mon, 6 Jan 2025 22:44:21 +0800
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
 <57ea8193-2fd9-41a9-85b4-7af924f900f4@bytedance.com>
 <Z3vqHXdwIMBVQ2GT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vqHXdwIMBVQ2GT@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/1/6 22:35, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 09:34:55PM +0800, Qi Zheng wrote:
>> OK, will change the subject and description to:
>>
>> s390: pgtable: also move pagetable_dtor() of PxD to pagetable_dtor_free()
>>
>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>> PMD|PUD|P4D to pagetable_dtor_free().
>>
>> But pagetable_dtor_free() is newly introduced in this patch, should it
>> be changed to 'move ... to pagetable_pte_dtor_free()'? But this seems
>> strange. :(
> 
> s390: pgtable: consolidate PxD and PTE TLB free paths
> 
> Call pagetable_dtor() for PMD|PUD|P4D tables just before ptdesc is
> freed - same as it is done for PTE tables. That allows consolidating
> TLB free paths for all table types.
> 
> Makes sense?

Ah, make sense. Many thanks to you!

Will do it in v5.

> 
>> Thanks!
> 
> Thank you!
