Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC6377EAF
	for <loongarch@lists.linux.dev>; Thu,  7 May 2026 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143296; cv=none; b=YrBzWOQSJbz/dnja8WO/4RggLnb4ZsCqQDhXza0D8J+2tifvNIkjXE/U77JBzr5tJmGdRX4Ex/QaPyDEiOpmdu04aRpcOfpEI29Ot9h+rGAo9fHL90i+kH+HIFoG0+kkEuPNj4nJ8AaIkBcH9sVjsHazE+fYq91Gt3cBs0CdQJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143296; c=relaxed/simple;
	bh=pJgf/8K6i1UqZ4sD9tXxKWjDKHpurXxLzcy/xPBEzko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IH1bWENmbAMPmZ9w0+0wM/f4sUTkDOqcdmxwwyZmip6DkgCgi9lI1NgN5OgulMhRIvJGSEk2hBPJrACSuNgLU1F3sIWn8tqPhNw7rVWtnxjOoBwT5T+gi8Zh0LmRCru+g1xNLi4RMgFydmQfy+zUXSWfTv4Wb/kseiUkWo+6t58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NydWttOD; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NydWttOD"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c822652f82aso377266a12.3
        for <loongarch@lists.linux.dev>; Thu, 07 May 2026 01:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143288; x=1778748088; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=;
        b=NydWttODJYmESTOUmH0a7vvmsf7KVaOcwDnT7Yy8KGiN/oTMfnvqH7EklmoDrMEHKV
         mS2H7DqS2e9Jq+c8pDiDf51RFr13b+Lj2tJwzsa14OX7o9L77mAwt+YDCE5qW+hFEHIP
         gJxRzvdeBRVfbvY87aObYu3bmxQqR9QjxPmawTJMm7ttVNcGe8t0UEpkRDpe5+lIRpHB
         I3QOro6kUHUUHacdPAefYpbpTmIbGNsRUGwR5cS8s6isSdnB9RNMxSLqgNIfY0+yQK2r
         ZF7goUuSHrHUv1jC+WnAaZoojme8Ju309S/DtjVf7rJBhuTNMaYXsgT7ZMA+pO/Oo1Fj
         Jhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143288; x=1778748088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYLd8a4rOgJ0HgA5aFHjScXvqopFgzBf/Pbs3wYF8a8=;
        b=qXS9t6VjgFxxz98iJWkplMDIJAI2+DODdjcjBg2SJ1LgHqNwll/oxf2tMK7eUhe5I0
         FXjepo7bx486vtTW6OuUvOiHlvoXAfk2JDXIb1Fi/FZOkJ7Wka/eJ4q1ZmBiEoVVt4Qe
         CPMxRjWqPAfnplETCeDUt9pbigH9k0JHBKet91A1Kg+hCzpyHQEw1NRUmgUFn8ArEIFq
         QpNEJykDHfjSU9ZelqwJF16VpGZcGHETSRvkeZo85HYhux9R/4BAIcjB4pHQ8Psa5pkJ
         hCYrdxYXtJvbszKHcQo9O9UtwGO+VeAsQUmiTvMey4ortoyomm3cKbGUQkTodAclCygN
         jjTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oZGWxMF5l3dM1nGzfyOY1q1hjIRePgEMRrfoYlQFPU+/CKoi6po1lI58nKtwZWQRC1O6GDflI4kM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcQQsRa8jPelLJKFjXefAzCxRsL/7DuIPGOE4xydRAZXnvqWTj
	Ztl3hg68CuXEsn+Z64ktnW+0s/yYK4BzLQwqyes0i6OVNkI4cuYQz12c
X-Gm-Gg: AeBDievpHbi+/l6mjWtdxB+izo02VJiF78iA76p/ielg2/BYimpDh217ejFMyn2T5dN
	DZNrHDiEeJkdUL13sIzCfEA6S0I1/t85/3IzqBpTKLsho6O91xUVT+oblr2i0aGPAYHKnqaVgdJ
	QzHOMKJlueCzsfGqjNDeuuX5d3N9cg808+Pcd45lc8x1wCs+ErHOangfW/xFrY1jtZu9JsWehdW
	miAFvIi9dlGhmUdqxUsVtc6MhpEWTzj299yoDt2G4GznJBurZD03+wxmckKFmh40wvhTnha2Bev
	NUENXgDliN/SqQbfUk2IPVp0Gl1U2T5W6HW8DyWJfntCRtOyBzCS/cWlXYfg94EQMGR894tfZD6
	zql9e8yku5OFY3oQrxCG7AcUCQBK/yeF94Cc9JPjmb4gnKj28dQOIQmabzZJUZhSrbuwsNDrukq
	mmh1mT/Mrv2qzAmZP1qdrgHRA3k/ZflrIpOVFutEhpHA==
X-Received: by 2002:a05:6a20:a106:b0:3a2:dc51:445 with SMTP id adf61e73a8af0-3aa5ab6853cmr7732684637.36.1778143287552;
        Thu, 07 May 2026 01:41:27 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253586c6asm1305583a12.4.2026.05.07.01.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:41:26 -0700 (PDT)
Message-ID: <126f4fd0-0a1c-41e0-8746-fa7ab85d6773@gmail.com>
Date: Thu, 7 May 2026 16:41:15 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] of: reserved_mem: fix region count for nodes with
 multiple reg entries
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-2-chenwandun@lixiang.com>
 <20260506014752.GA280279-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506014752.GA280279-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/5/6 09:47, Rob Herring 写道:
> On Wed, Apr 29, 2026 at 02:58:21PM +0800, Chen Wandun wrote:
>> When a reserved-memory node contains multiple reg entries (e.g.,
>> reg = <base1 size1>, <base2 size2>), the count used for
>> total_reserved_mem_cnt is wrong in two places:
>>
>> 1) __reserved_mem_reserve_reg() returns 0 on success regardless of how
>>     many regions it reserved in memblock. The caller in
>>     fdt_scan_reserved_mem() then increments count by just 1.
> Just to make sure, more than 1 worked before the referenced commits? It
> would be easier to just define we only expect/support 1 entry.
Looking at the pre-8a6e02d0c00e code, __reserved_mem_reserve_reg()
reserved memblock memory for all reg entries, but only called
fdt_reserved_mem_save_node() for the first one (guarded by an 'if 
(first)' flag).

So multiple reg entries were never fully supported: subsequent entries
got their memory reserved in memblock, but their metadata was lost
and driver-specific init callbacks were never invoked for them.

The referenced commits made this worse by also breaking the count
tracking, but the root limitation predates them.

I support documenting "only 1 entry supported" based on the
following reasons:

   - of_reserved_mem_lookup() does a name-based linear scan and returns
     the *first* matching entry. A node with N reg entries would create
     N entries with identical names; entries [1..N-1] are permanently
     unreachable via lookup.

   - Drivers like CMA and DMA coherent are designed to initialize a
     single contiguous pool per node_init call. Calling node_init
     multiple times with the same FDT node is not a supported usage.


>
>> 2) fdt_scan_reserved_mem_late() uses of_flat_dt_get_addr_size() which
>>     only reads the first reg entry. Subsequent entries are never
>>     initialized via fdt_init_reserved_mem_node(), so their metadata is
>>     lost.
>>
>> Fix both issues:
>>   - Make __reserved_mem_reserve_reg() return the actual number of
>>     regions successfully reserved. Update the caller to accumulate
>>     the returned count.
>>   - Rewrite fdt_scan_reserved_mem_late() to use
>>     of_flat_dt_get_addr_size_prop() and iterate all reg entries,
>>     initializing each one via fdt_init_reserved_mem_node().
>>
>> Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
>> Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
