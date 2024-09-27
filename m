Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABFA176227;
	Fri, 27 Sep 2024 05:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727414959; cv=none; b=MqYALVWFnrV2OVoZUtE1o99k6zRF50bIkXiaYJmksb9OX3nNh64Wx30sgj7/DuqzyaYSD+SbwSCoui7erEULos9VisArzxFiv/ht38ArP3vBYUtqWxJmR6t6t61R2gYcyKYdP0gMJbjGdhSEK2gEPrUFvkByVyFQmgs5C19WPYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727414959; c=relaxed/simple;
	bh=Wqbkaxu4ahHCT2NoWIZPDTH+jt14urrW6piP69LpqCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caWQqzxaPFFDmESeyf3zKQ2ZUQ9OrdP3XlRRVMKyy0e8/mEEi/9qw68y+0MSeh6B6en7o2bTp9CeLMzEvqoomQAZzyp0Eo552qQaZnP4sW9YiKfgoEVph+vKlq0qPr8LQcjc4QS7vwLEgYAZ/pj1WRt2ieHzpShgECuhLN8Uv5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zm/CWhyY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zm/CWhyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727414958; x=1758950958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wqbkaxu4ahHCT2NoWIZPDTH+jt14urrW6piP69LpqCA=;
  b=Zm/CWhyYJP8t+2DBeIZ4Pq7tjNMSTkIAwtuRt46ghMOxeTf2clhvb2wC
   beheZu8CL8pRZj2E7QerVm8Vod6LLjtcIv2VabYRdDVvyXGJsMm3zXI+R
   K8xlf0R37Tm7LeH5Qe5kZ7yTjzO40PONkGh+YnbjQtc+qHXRhK4ouBVfz
   McoMQFgS2uMjMGJf7myyHoTKEX0rEgTiwvcJ98vmBrAz/FdHNK14d/Bpo
   0+rhZpsYO75hkmhbRuV+Pn/QwkQhLVU5yXlA0/bMlFJJAAKyTS45gKhvq
   JprSELDX1IPMJcmA5M1M771Zm0TXoG4s35UFHiom98iGwc/g3Pd+GYLKU
   g==;
X-CSE-ConnectionGUID: Hwl6jw9+T8CECxx7K3G2BQ==
X-CSE-MsgGUID: jcr5ymyySbyfOaE0bHtq/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37114304"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37114304"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 22:29:16 -0700
X-CSE-ConnectionGUID: eBVXhe6LQQ61Ba7iFL2w4Q==
X-CSE-MsgGUID: NMLEvAMQR5mdMfVNFAWlfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72714905"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Sep 2024 22:28:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su3XC-000LVx-2M;
	Fri, 27 Sep 2024 05:28:54 +0000
Date: Fri, 27 Sep 2024 13:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	Yann Sionneau <ysionneau@kalrayinc.com>,
	Julian Vetter <jvetter@kalrayinc.com>
Subject: Re: [PATCH v6 2/5] Replace generic memcpy and memset by IO memcpy
 functions
Message-ID: <202409271351.RPEyNO3U-lkp@intel.com>
References: <20240925132420.821473-3-jvetter@kalrayinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925132420.821473-3-jvetter@kalrayinc.com>

Hi Julian,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on soc/for-next linus/master v6.11 next-20240926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Vetter/Consolidate-__memcpy_-to-from-io-and-__memset_io-into-iomap_copy-c/20240925-225627
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240925132420.821473-3-jvetter%40kalrayinc.com
patch subject: [PATCH v6 2/5] Replace generic memcpy and memset by IO memcpy functions
config: um-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271351.RPEyNO3U-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271351.RPEyNO3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271351.RPEyNO3U-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/bus/mhi/ep/ring.o: in function `memcpy_toio':
>> include/asm-generic/io.h:1213: undefined reference to `__memcpy_toio'
   /usr/bin/ld: drivers/bus/mhi/ep/ring.o: in function `memcpy_fromio':
>> include/asm-generic/io.h:1196: undefined reference to `__memcpy_fromio'
>> /usr/bin/ld: include/asm-generic/io.h:1196: undefined reference to `__memcpy_fromio'
>> /usr/bin/ld: include/asm-generic/io.h:1196: undefined reference to `__memcpy_fromio'
>> /usr/bin/ld: include/asm-generic/io.h:1196: undefined reference to `__memcpy_fromio'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +1213 include/asm-generic/io.h

  1181	
  1182	#ifndef memcpy_fromio
  1183	#define memcpy_fromio memcpy_fromio
  1184	/**
  1185	 * memcpy_fromio	Copy a block of data from I/O memory
  1186	 * @dst:		The (RAM) destination for the copy
  1187	 * @src:		The (I/O memory) source for the data
  1188	 * @count:		The number of bytes to copy
  1189	 *
  1190	 * Copy a block of data from I/O memory.
  1191	 */
  1192	static inline void memcpy_fromio(void *buffer,
  1193					 const volatile void __iomem *addr,
  1194					 size_t size)
  1195	{
> 1196		__memcpy_fromio(buffer, __io_virt(addr), size);
  1197	}
  1198	#endif
  1199	
  1200	#ifndef memcpy_toio
  1201	#define memcpy_toio memcpy_toio
  1202	/**
  1203	 * memcpy_toio		Copy a block of data into I/O memory
  1204	 * @dst:		The (I/O memory) destination for the copy
  1205	 * @src:		The (RAM) source for the data
  1206	 * @count:		The number of bytes to copy
  1207	 *
  1208	 * Copy a block of data to I/O memory.
  1209	 */
  1210	static inline void memcpy_toio(volatile void __iomem *addr, const void *buffer,
  1211				       size_t size)
  1212	{
> 1213		__memcpy_toio(__io_virt(addr), buffer, size);
  1214	}
  1215	#endif
  1216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
