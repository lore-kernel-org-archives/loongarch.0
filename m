Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F41A18B46F;
	Tue,  3 Sep 2024 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725389610; cv=none; b=q9mCO+pLqY/Iu2OI8tQn8XpSSrEaCxqVuor8JvkH1Hd7UC6Uu9x4TeuVuPnhjMZwjds0KCkeXYOW9EjqIoXsPiWJhuMrhECLMHD7WaqSq41zFQE/s+VTcJJBxqrFIrVI7jOGcf/LyirG7JIFXnpgdjxXXyWutP/zbCTO7ysHYto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725389610; c=relaxed/simple;
	bh=T5Gx8WkcVyvzG3zrLRh+K6K1sDWsiptEf/Lb25i3JO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f96g9vk4LUJmMZ47ObKVYBQXHgN+Yf/YuNDIIWcxvP07PF+DTUepEDBVwXOCJMjmeKJglSVQ5yHp/Q+8LMYx4NfNH/lPAoFHXwwSB6gF4D2AzZv1l4yCzSXVSOyqZlXnjbPE1XKJMJcSl/1En3ubm/qYwj9vrhINYRLIrVw+Hug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGXKRyI8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGXKRyI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725389609; x=1756925609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T5Gx8WkcVyvzG3zrLRh+K6K1sDWsiptEf/Lb25i3JO0=;
  b=jGXKRyI8bKx+DE0guKEGXjwfBV6q0cf+ruec2RcnhnXbEFQrozEL4FWs
   sePQ2YkwD1A/hFMv9N9eY2a/vQG6AkN3v9LfF68FTRLxurywEnfGQ1Y1o
   KF28JBrMnjVuJU3hNa6C+XHYFwLFFIhlsRoDXewrGN35km0AX0jsFP/dt
   DB5oXj1eGOQ+gsyjh7Nr3j4fI4Y6QOiCkN0Tfv/eN3d/4X9qAP8k27uYm
   8q8pryJyDm2qMdJKlyUdU21Z/5WkGCaXjRa7FSjffffvo4wUk/cxCxubs
   sjZZj3GS1F8Ozh7xgthZFTTPTyjGQH50c1piC5PCmfMpbG6dNvqfXEkr1
   w==;
X-CSE-ConnectionGUID: m6MiLp4XTZGAoeOBoXgSuw==
X-CSE-MsgGUID: hehjfn4XTF6c2+yupL+47Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23969509"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23969509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 11:53:28 -0700
X-CSE-ConnectionGUID: WqmH/QnmTXyYHeVgKMkDtQ==
X-CSE-MsgGUID: qvGXtOOxT2imb2XTs+VgRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65070889"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2024 11:53:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slYea-00073Y-0d;
	Tue, 03 Sep 2024 18:53:24 +0000
Date: Wed, 4 Sep 2024 02:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Uros Bizjak <ubizjak@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] longsoon/percpu: Simplify _percpu_read() and
 _percpu_write()
Message-ID: <202409040211.HXF2MzXO-lkp@intel.com>
References: <20240903102342.36957-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903102342.36957-1-ubizjak@gmail.com>

Hi Uros,

kernel test robot noticed the following build errors:

[auto build test ERROR on dennis-percpu/for-next]
[also build test ERROR on linus/master v6.11-rc6 next-20240903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/longsoon-percpu-Simplify-_percpu_read-and-_percpu_write/20240903-182524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git for-next
patch link:    https://lore.kernel.org/r/20240903102342.36957-1-ubizjak%40gmail.com
patch subject: [PATCH] longsoon/percpu: Simplify _percpu_read() and _percpu_write()
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240904/202409040211.HXF2MzXO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040211.HXF2MzXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040211.HXF2MzXO-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:1503: Error: no match insn: stx.w	$r12 $r21,$r13
   {standard input}:1519: Error: no match insn: stx.w	$r12 $r21,$r13
   {standard input}:1548: Error: no match insn: stx.w	$r12 $r21,$r13
   {standard input}:1642: Error: no match insn: stx.w	$r12 $r21,$r13
   {standard input}:1658: Error: no match insn: stx.w	$r12 $r21,$r13
   {standard input}:1687: Error: no match insn: stx.w	$r12 $r21,$r13
   {standard input}:1889: Error: no match insn: stx.w	$r12 $r21,$r13
   {standard input}:1906: Error: no match insn: stx.w	$r12 $r21,$r13
   {standard input}:1920: Error: no match insn: stx.w	$r12 $r21,$r13
--
   {standard input}: Assembler messages:
   {standard input}:1178: Error: no match insn: stx.w	$r12 $r21,$r13
   {standard input}:1971: Error: no match insn: stx.w	$r12 $r21,$r13
>> {standard input}:8812: Error: no match insn: stx.w	$r13 $r21,$r12

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
