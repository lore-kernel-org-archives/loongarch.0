Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA226AFB
	for <loongarch@lists.linux.dev>; Thu, 15 Aug 2024 06:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723702681; cv=none; b=M35ULiabYF//qkTiw1WNGwAMD42rlO4UXIwKNaYsNffy+6Z5ksRkCzXECxZybIjL/+yNmBpM0KRBEDo8CHpKsxsM9RuPpiW8TeoQvaYiJ/XapIBHZ3hQN1Kbwl7eXaKzuF91WPmw2lRZ+TwJcg+dR4PcbJIsWGsc90m2//JozrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723702681; c=relaxed/simple;
	bh=2ieEkSgkeeXHKQaOG4S/bYJ9as9XsQf3erKR7zsdkP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtWLA+p7c5CeSqh+MmmZOEhQdGoavuJzDfLBn3PBX3oYenCtNVFYkWDQYm+kQgYyF54GjSDeA0oAbJzW5TQKnr1i/hsuNduUwXcCDmpfmmtsvWgp6d9qQacHcY1JXC8Zk7u2AZBLNTIYojhNOjVjfOOGjCMJYxO9vTS4dpdi5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdnL/G9X; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdnL/G9X"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-27002047ee6so274033fac.3
        for <loongarch@lists.linux.dev>; Wed, 14 Aug 2024 23:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723702679; x=1724307479; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAHWmUt5jip0y+u22BsHFrHANReT/fLelSD2WuMjZ6U=;
        b=JdnL/G9XJfXEne8N/uv5oUrmlNYJAf5e2XkmHY2Ce/V32f5/3XU7ZTd4xQDufydctf
         cEibnvCsmDVGo8ZxqNzjT8p5nYPQoCq9Isq+TOEV8WomZYlex6z7SCgcaONNiocl4NUj
         mtJuHT8KGhnkrPMn8NuXsTdNqMn6oHknlQ65wH+l3SJWP4yxEy6RgfxqicUybDoU3htv
         wMXtwgmxo17IH0ZVR/+HmUXTvP1EDRItwZFcAngQt1Vs74G7hjwG50Lq/6BjjNj4lo/a
         FDCAxyW93flqO0Pkfwfy57D9HWR3UAi/BV0TvPYQ9NQ6t2DCWdXSuwKTbxFHv1g+8zPe
         Oy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723702679; x=1724307479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAHWmUt5jip0y+u22BsHFrHANReT/fLelSD2WuMjZ6U=;
        b=v0NcgSx59jg/+t5HX9aan9YJjFt8MCL/U5O3Kbxb83zSkCGQ68YERZFK9dHOILQTlt
         97fjApPGacHVyH9+tUjRiJ7squ/OK3yZpd+8bhgF4/LKnEMF4ccJEOio9xhau9/FBGrW
         MUuHsQZwaAV8Du2bdnmM/dwXNcU12tsiFF3I6Xb9SriauM3FFSSs0Z67c8tVsBS/Z7B4
         DwtImydYXi/+M30xqo4fwgu1ez0h4FJtxpZ6NFPnmvrTBw6CSZJ8iT2wx3JIr3K4njrz
         lVElp7lXgM+G8uKz3Q4ZqML6rCsAcK2iQHwI1t3+3CiferWt0mPs6OzmMnAHATTg9Nca
         r68A==
X-Forwarded-Encrypted: i=1; AJvYcCV4NOK+nf4RF15Pub4adI5YDrzcJYLIm5ZFIR84R3i/yVsnhXecvkPelo0y7reBSzYI6q3y4HLi3H6XYVAKcFKlj2AgXOtG+EW/
X-Gm-Message-State: AOJu0YwSUkza9Or1O9p6c0982PhtwA1mBzFYnusEFrnJuXuIPjJjbboe
	h+7ZEs1FY4EzQcAvyrdTU3GFVIDADpMj/vjHMhNWAwJGRGvyzjRM
X-Google-Smtp-Source: AGHT+IGJpazxnkj0vrfs0qcLRP6qpL8RKPrwMyfkdNMVp4bX1EZv/Ik/vGgVpgkEp8G6HmJcF19Ukw==
X-Received: by 2002:a05:6870:8a12:b0:258:3455:4b02 with SMTP id 586e51a60fabf-26fe5ca588amr5544755fac.51.1723702678720;
        Wed, 14 Aug 2024 23:17:58 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add6b3dsm479443b3a.8.2024.08.14.23.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 23:17:58 -0700 (PDT)
Message-ID: <02d7b8a2-b0d6-4713-b03e-5b22968387c3@gmail.com>
Date: Thu, 15 Aug 2024 14:17:45 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] use struct ptdesc to replace pgtable_t
To: Matthew Wilcox <willy@infradead.org>, alexs@kernel.org
Cc: Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Brian Cain <bcain@quicinc.com>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Vishal Moola <vishal.moola@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Lance Yang <ioworker0@gmail.com>,
 Peter Xu <peterx@redhat.com>, Barry Song <baohua@kernel.org>,
 linux-s390@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Breno Leitao <leitao@debian.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20240730064712.3714387-1-alexs@kernel.org>
 <ZrzlnIWrnaUx66rY@casper.infradead.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <ZrzlnIWrnaUx66rY@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/15/24 1:13 AM, Matthew Wilcox wrote:
> On Tue, Jul 30, 2024 at 02:46:54PM +0800, alexs@kernel.org wrote:
>> We have struct ptdesc for page table descriptor a year ago, but it
>> has no much usages in kernel, while pgtable_t is used widely.
> 
> Hum, I thought I responded to this to point out the problem, but
> I don't see the response anywhere, so I'll try again.
> 
>> The pgtable_t is typedefed as 'pte_t *' in sparc, s390, powerpc and m68k
>> except SUN3, others archs are all same as 'struct page *'.
> 
> And there's a very good reason for that.  On s390 and powerpc (I cannot
> speak to the sparc/m68k), each page table is (potentially) smaller
> than PAGE_SIZE.  So we cannot do what your patch purports to do, as
> we would not know whether we're referring to the first or subsequent
> page tables contained within a page.
>> Maybe at some point in the distant future we'll be able to allocate
> a ptdesc per page table instead of per page allocated for use by page
> tables.  But we cannot do that yet.


Got it. Thanks a lot for the info!
