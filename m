Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E432624
	for <loongarch@lists.linux.dev>; Thu,  7 Jul 2022 11:38:10 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=33;SR=0;TI=SMTPD_---0VIdIQWG_1657193558;
Received: from 30.97.48.62(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VIdIQWG_1657193558)
          by smtp.aliyun-inc.com;
          Thu, 07 Jul 2022 19:32:40 +0800
Message-ID: <ef376131-bf5f-7e5b-ea1b-1e8f64a6d060@linux.alibaba.com>
Date: Thu, 7 Jul 2022 19:32:44 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] Add PUD and kernel PTE level pagetable account
To: Dave Hansen <dave.hansen@intel.com>, akpm@linux-foundation.org
Cc: rppt@linux.ibm.com, willy@infradead.org, will@kernel.org,
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com, peterz@infradead.org,
 catalin.marinas@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
 tsbogend@alpha.franken.de, dave.hansen@linux.intel.com, luto@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 arnd@arndb.de, guoren@kernel.org, monstr@monstr.eu, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
 <d2d58cc2-7e6d-aa2d-3096-a500ce321494@intel.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <d2d58cc2-7e6d-aa2d-3096-a500ce321494@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/6/2022 11:48 PM, Dave Hansen wrote:
> On 7/6/22 01:59, Baolin Wang wrote:
>> Now we will miss to account the PUD level pagetable and kernel PTE level
>> pagetable, as well as missing to set the PG_table flags for these pagetable
>> pages, which will get an inaccurate pagetable accounting, and miss
>> PageTable() validation in some cases. So this patch set introduces new
>> helpers to help to account PUD and kernel PTE pagetable pages.
> 
> Could you explain the motivation for this series a bit more?  Is there a
> real-world problem that this fixes?

Not fix real problem. The motivation is that making the pagetable 
accounting more accurate, which helps us to analyse the consumption of 
the pagetable pages in some cases, and maybe help to do some empty 
pagetable reclaiming in future.
