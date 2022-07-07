Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F39B7C
	for <loongarch@lists.linux.dev>; Thu,  7 Jul 2022 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657205212; x=1688741212;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KZoOhYr8rZQDf+CrGeMco6Jgl7zOhXbo9W38e2RlFZY=;
  b=Sm5sFDSZM5nYq7RAtgDTsMkCpjmHTTmIt8eYM/3WR65Zcxgc9vOgIS5E
   +wlFhhUdxZi64FFW2YcGGFZpOATxvXWMdJbxetKsHdLrdGrGWW+AewF5e
   XArPT9aVnYrgS7OBjWXA2HzYapH7311g1e1fH9GZ2LxpyqN4KKE7wO50f
   AiQqjv91RWl1EVV789+I8mwESUazX256dKbb1GY2HqJHqZb6JcEpBgSjp
   NW3v2GtByCVVRU7GsW1+h32wwtPjk0Md/hWQrThlYN5zQHUUtBsU7Um/I
   FQF4ZwzKZk+ukzKoqo4E7PmK46g+RzwbPMZYcgwnYgt+6QqgeLoFIReVh
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272835590"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="272835590"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 07:46:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="568544278"
Received: from nmajidi-mobl.amr.corp.intel.com (HELO [10.251.17.238]) ([10.251.17.238])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 07:46:51 -0700
Message-ID: <8821beda-4d60-4d01-b5c8-1629a19c7f0d@intel.com>
Date: Thu, 7 Jul 2022 07:44:39 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/3] Add PUD and kernel PTE level pagetable account
Content-Language: en-US
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
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
 <ef376131-bf5f-7e5b-ea1b-1e8f64a6d060@linux.alibaba.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <ef376131-bf5f-7e5b-ea1b-1e8f64a6d060@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/7/22 04:32, Baolin Wang wrote:
> On 7/6/2022 11:48 PM, Dave Hansen wrote:
>> On 7/6/22 01:59, Baolin Wang wrote:
>>> Now we will miss to account the PUD level pagetable and kernel PTE level
>>> pagetable, as well as missing to set the PG_table flags for these
>>> pagetable
>>> pages, which will get an inaccurate pagetable accounting, and miss
>>> PageTable() validation in some cases. So this patch set introduces new
>>> helpers to help to account PUD and kernel PTE pagetable pages.
>>
>> Could you explain the motivation for this series a bit more?  Is there a
>> real-world problem that this fixes?
> 
> Not fix real problem. The motivation is that making the pagetable
> accounting more accurate, which helps us to analyse the consumption of
> the pagetable pages in some cases, and maybe help to do some empty
> pagetable reclaiming in future.

This accounting isn't free.  It costs storage (and also parts of
cachelines) in each mm and CPU time to maintain it, plus maintainer
eyeballs to maintain.  PUD pages are also fundamentally (on x86 at
least) 0.0004% of the overhead of PTE and 0.2% of the overhead of PMD
pages unless someone is using gigantic hugetlbfs mappings.

Even with 1G gigantic pages, you would need a quarter of a million
(well, 262144 or 512*512) mappings of one 1G page to consume 1G of
memory on PUD pages.

That just doesn't seem like something anyone is likely to actually do in
practice.  That makes the benefits of the PUD portion of this series
rather unclear in the real world.

As for the kernel page tables, I'm not really aware of them causing any
problems.  We have a pretty good idea how much space they consume from
the DirectMap* entries in meminfo:

	DirectMap4k:     2262720 kB
	DirectMap2M:    40507392 kB
	DirectMap1G:    24117248 kB

as well as our page table debugging infrastructure.  I haven't found
myself dying for more specific info on them.

So, nothing in this series seems like a *BAD* idea, but I'm not sure in
the end it solves more problems than it creates.

