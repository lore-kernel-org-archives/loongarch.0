Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022A54C81
	for <loongarch@lists.linux.dev>; Wed,  6 Jul 2022 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657122743; x=1688658743;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y3/9f4gAnKgtfKYM4zXe/3Q35Ma8+prwhvKdkpVJo64=;
  b=heBpr/RpNtaNMCzGmmXzkDuHNd0NioZRadknzjTZKCT9sZr1yYrKcFi5
   8CeQqdF948d1M2oJ5ccfY8ajO5J7zWqkRzdgtuux07Xw5TBKmJQafCdXw
   +mY6KUF2dsjLe8o6kbbkfNE94BNXmkCJAxx5b8HjMAg/YZxINlu5LHnXL
   s3EN/+UCF9BxvBfwByQUjr37YAasBYgICwDX6OGlfUO3E4ImUraxdYKSP
   1ddpxRvvqrYxfHg2MQBQn66T5s6TgwLhnoaZZgbwOPnjxgy4DiZ9kbrVt
   +eVGNgusfOZP5ijsUYWDKgZEwxL/R6m85qS85nRmU0VYaVHbfA/ZTjqag
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="370102745"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="370102745"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 08:50:13 -0700
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="620370161"
Received: from tjsteven-mobl3.amr.corp.intel.com (HELO [10.255.228.25]) ([10.255.228.25])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 08:50:12 -0700
Message-ID: <d2d58cc2-7e6d-aa2d-3096-a500ce321494@intel.com>
Date: Wed, 6 Jul 2022 08:48:07 -0700
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
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/6/22 01:59, Baolin Wang wrote:
> Now we will miss to account the PUD level pagetable and kernel PTE level
> pagetable, as well as missing to set the PG_table flags for these pagetable
> pages, which will get an inaccurate pagetable accounting, and miss
> PageTable() validation in some cases. So this patch set introduces new
> helpers to help to account PUD and kernel PTE pagetable pages.

Could you explain the motivation for this series a bit more?  Is there a
real-world problem that this fixes?
