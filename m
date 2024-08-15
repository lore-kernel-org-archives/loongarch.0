Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DCD16BE20
	for <loongarch@lists.linux.dev>; Thu, 15 Aug 2024 06:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723703538; cv=none; b=UNfRAamoqsGgDoId/22qgpJM9yIogOkvGeD64oLBwEYVyzDyIMS8H9dhXd5hG4AiYKS0NECNLWljHouwM7FHc2yxaT4qAtJPm8cthyUtLgBI2GCMlHnLcnO6o2xdLx3sps3gygAwiQHcdnPFPd5B+A8mMrSoDv+Q+gZ/OZxwNt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723703538; c=relaxed/simple;
	bh=HXuXwTles2EvknzMcg/wNQdnX/Z4GUExBFPaBatXWHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaLlrwgqTVCTKWWMwua1Mi38YOPQK9KuVTWV5pDdg4hzOS9Y/m6pY/fR2rn0t+xU2sMAKBAvVxbEi4Yg1GCVNBuTIvqyxYLhN0BJQfa7zEE45BQFQwK6fI162URnDEmwM9Fea5YQVsIdMNWnwxMkLiDJCzUh+y5S1LNtMKRRmwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9hjmclf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9hjmclf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fd9e70b592so6142815ad.3
        for <loongarch@lists.linux.dev>; Wed, 14 Aug 2024 23:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723703535; x=1724308335; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nt+p09uz8tAqwLeLii8cPw/zrSYX75ywbDJiGCl6kRA=;
        b=k9hjmclfmyQTZ38eJ3yEQJcV7+Be+2n5n+ybTAPdN7XKx3pCJoiuYN5wpYFayXsH2W
         rxEX4HZMBSQm736yej9dMcENFcmw5DF9PsqV7VqIrXf7tuK6dJRhepaNMTcttfab9rQF
         UDYY4QAZzcdC8xxQWPz3RpyldbmgmtJ8lOQkT4J3Ga6M48+HK/zSwfKmzp62UIWpLFxS
         ePDJv3nSjmnUMlzytT9KV1RZq2DutgRHV9V7ecLsOMMkPzB+jUkfyMEZk+5AB04lQhh6
         m4aI6ODB2EFfKRWybUXh5jll0i8SbIRAy3+Mp0NUWY0SUfRUn+NJYfEQ6FQzd7REHDX5
         yYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723703535; x=1724308335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt+p09uz8tAqwLeLii8cPw/zrSYX75ywbDJiGCl6kRA=;
        b=sRefM1QMaypG0udWDVu9+8HkLeU1OTmm9nxJQ0bPnPWlpz43LRr5e/Ya1gkntULGyC
         dwlAwJtFsY9cJEFbc3LDOfv5FTBlqoNMRl1LhAwY9Kcjj3+W4oHCNuov070uX175kqeM
         7B8hTjvl5reLjHVbt4pSw5z0tTNLUTnfZ+9g1gKz15xNoKUS+3XEZsE4HT40kv4RQiEx
         c2ID4HWMeL1rjnSat1QJi9P1D6h5w/qL81IDqAvZdQ6hdCwKgnKiYQCLY6Paakith5N0
         60mnDm7SJYO2rCUC6jnRKhp2gHjnjo3tbl2KPqRNg9XGDMYFfWSMQ3mDsnZ2RZtaEYQV
         2GCg==
X-Forwarded-Encrypted: i=1; AJvYcCXFPIx9zM1JPfgtufo56S/92BmEQ8x47UxgPpZCOTYV9M+MmGcq/Z3yQHaSx/xE4cDEUqKyrKXCeTvFwRGnHwMAsav3xTCdNLMy
X-Gm-Message-State: AOJu0YyCE0qFO/wyVyKH9lEOwkNaPRLvaBu2/YJ4JHqjGyyZ6saUX3Gv
	olwRdVWv66bCuD+t2bk58EWD/MVSJgYxq4XhhEtaRZhUmfEdsyjP
X-Google-Smtp-Source: AGHT+IGHQF6v1wj4OnSDtmW1i+o0W3hXKMZnU/CMxWJVexuFM/VLhfFkwN0de8G4/UHXSn+MbeyB0Q==
X-Received: by 2002:a17:903:11c4:b0:1fb:cf82:11b4 with SMTP id d9443c01a7336-201d63bc296mr66187655ad.6.1723703534763;
        Wed, 14 Aug 2024 23:32:14 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f039ef06sm5216095ad.249.2024.08.14.23.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 23:32:14 -0700 (PDT)
Message-ID: <3351b0db-4764-48a4-8bab-478ba7bfa4f4@gmail.com>
Date: Thu, 15 Aug 2024 14:32:01 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] use struct ptdesc to replace pgtable_t
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
 "alexs@kernel.org" <alexs@kernel.org>, Will Deacon <will@kernel.org>,
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
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Vishal Moola <vishal.moola@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Lance Yang <ioworker0@gmail.com>,
 Peter Xu <peterx@redhat.com>, Barry Song <baohua@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang
 <jszhang@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup@brainfault.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Breno Leitao <leitao@debian.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
 <392b267e-cf98-4aa0-bb6e-90f6861d097d@cs-soprasteria.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <392b267e-cf98-4aa0-bb6e-90f6861d097d@cs-soprasteria.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/15/24 12:50 AM, LEROY Christophe wrote:
> Hi,
> 
> Le 30/07/2024 à 08:46, alexs@kernel.org a écrit :
>> From: Alex Shi <alexs@kernel.org>
>>
>> We have struct ptdesc for page table descriptor a year ago, but it
>> has no much usages in kernel, while pgtable_t is used widely.
>>
>> The pgtable_t is typedefed as 'pte_t *' in sparc, s390, powerpc and m68k
>> except SUN3, others archs are all same as 'struct page *'.
>>
>> These blocks the conception and code update for page table descriptor to
>> struct ptdesc.
>>
>> So, the simple idea to push the ptdesc conception forward is to update
>> all pgtable_t by ptdesc or pte_t pointer. But this needs widely
>> knowledges for most all of different archs. Common code change is easy
>> for include/ and mm/ directory, but it's hard in all archs.
>>
>> Thanks for intel LKP framework, I fixed most all of build issues except
>> a bug on powerpc which reports a "struct ptdesc *" incompatible with
>> struct ptdesc *' pointer issue...
> 
> Can you tell more about that problem on powerpc ? Which defconfig for 
> instance ?
> 

Hi Leroy,

Thanks a lot for response. The detailed error and code tree is from LKP:

On 8/3/24 11:26 AM, kernel test robot wrote:
> tree:   https://github.com/alexshi/linux.git ptdesc
> head:   3735e634f8feb67c941d17222b53906ace2fd2b8
> commit: 8ac2ea5f299444d065b292043aed0a1e94996159 [14/17] mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
> config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/reproduce)

>    In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:
>>> arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]

>>
>> Another trouble is pmd_pgtable() conversion in the last patch.
>> Maybe some of arch need define theirself own pmd_ptdesc()?
>>
>> This patchset is immature, even except above 2 issues, I just tested
>> virutal machine booting and kselftest mm on x86 and arm64.
>>
>> Anyway any input are appreciated!
> 
> Can you tell on which tree you based this series ? Last patch doesn't 
> apply on 6.11-rc1:

The code based on akpm/mm-unstable tree, not upstream, you can check the code on:
https://github.com/alexshi/linux.git ptdesc

Thanks a lot!
Alex
