Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AE514883C;
	Thu, 23 Jan 2025 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737653693; cv=none; b=oinIBy9ZAEMearJnUkePQOmwI+YE2cpufrtDyPLBgzV3FYQbo/Nrt7cos2vJWSqbLp5hxOxFdlSUgorIDbVljKdTfrCAg7B0PCMvaEQNuaSIeC7O37wbxc1RebgJkS0Iaw4QSUtivPZJ47zFo5sDhSKUR1i00dPQzpsM60qLQxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737653693; c=relaxed/simple;
	bh=Vi0yvCwo30fwVsqjLO0cONScA/8TLk0SHxBzQlbNSOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvmCg4MIKwOCMTEpIDA9Cyo/KJCzCo9YYsm+Wgdy5JcUvchlDjtPLB0PZUTEdxKbJ8jBwgqmZn+jibftYEwXRIfK1Qr0FP19scB0dBn9uXYdoPsG4K6xaeURntXhkuQjQ1YwkgaFcraeQUMp0oserP9BEfK0ampByL3DHMoKIjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIVTlryw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIVTlryw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737653692; x=1769189692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vi0yvCwo30fwVsqjLO0cONScA/8TLk0SHxBzQlbNSOA=;
  b=NIVTlryw+8tzOvlKaGlPelDh6OlMObfPFCjzbkS917BeGkV5Z05Uj275
   wvme1THRLKZpojfrPdQlqsPVY25Ll+ZGGUWz1HqlvBXYbDBvtLq+7zQOm
   LIr9EE9gRODqg8cRXKl5c/MhK2a9XG9r4cvylAE95FWaGhWpj7TtF5ZlT
   a8tZuiVawlhMrUz/RjnZkL6toIkGE3ahWQJrdoHDgXL40Uq5wgGaqwIZn
   U+ymY36zqSBrcL1+f5kFt9drK41QIOzH0ldfPN4rBkO39CmE3GVpi8Xl3
   Z9by0bk4kNyj2JCtEAENkuzVmnQWDUOIF1BeSa4VUWbZ4IAQTWbkPic4s
   w==;
X-CSE-ConnectionGUID: wC6uVFZ+QyicsvmJ1kBI5w==
X-CSE-MsgGUID: ftFyYc4uR6C47+3RcIxnxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55715297"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="55715297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 09:34:51 -0800
X-CSE-ConnectionGUID: fCU09iDaQ72rUo9Zyl9MFA==
X-CSE-MsgGUID: t4CAraI5QsqUroLarf1qXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108403010"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jan 2025 09:34:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb16L-000bRf-1R;
	Thu, 23 Jan 2025 17:34:45 +0000
Date: Fri, 24 Jan 2025 01:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 4/4] entry: Inline syscall_exit_to_user_mode()
Message-ID: <202501240101.mSdGpEoH-lkp@intel.com>
References: <20250122-riscv_optimize_entry-v1-4-4ee95559cfd0@rivosinc.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-riscv_optimize_entry-v1-4-4ee95559cfd0@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-entry-Convert-ret_from_fork-to-C/20250123-065957
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250122-riscv_optimize_entry-v1-4-4ee95559cfd0%40rivosinc.com
patch subject: [PATCH 4/4] entry: Inline syscall_exit_to_user_mode()
config: x86_64-randconfig-072-20250123 (https://download.01.org/0day-ci/archive/20250124/202501240101.mSdGpEoH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240101.mSdGpEoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240101.mSdGpEoH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from arch/x86/mm/fault.c:7:
   include/linux/entry-common.h: In function 'syscall_exit_to_user_mode_work':
>> include/linux/entry-common.h:397:34: error: 'CONTEXT_KERNEL' undeclared (first use in this function); did you mean 'PERF_CONTEXT_KERNEL'?
     397 |         CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
         |                                  ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/entry-common.h:397:9: note: in expansion of macro 'CT_WARN_ON'
     397 |         CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
         |         ^~~~~~~~~~
   include/linux/entry-common.h:397:34: note: each undeclared identifier is reported only once for each function it appears in
     397 |         CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
         |                                  ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/entry-common.h:397:9: note: in expansion of macro 'CT_WARN_ON'
     397 |         CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
         |         ^~~~~~~~~~


vim +397 include/linux/entry-common.h

   378	
   379	/**
   380	 * syscall_exit_to_user_mode_work - Handle work before returning to user mode
   381	 * @regs:	Pointer to currents pt_regs
   382	 *
   383	 * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
   384	 * exit_to_user_mode() to perform the final transition to user mode.
   385	 *
   386	 * Calling convention is the same as for syscall_exit_to_user_mode() and it
   387	 * returns with all work handled and interrupts disabled. The caller must
   388	 * invoke exit_to_user_mode() before actually switching to user mode to
   389	 * make the final state transitions. Interrupts must stay disabled between
   390	 * return from this function and the invocation of exit_to_user_mode().
   391	 */
   392	static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
   393	{
   394		unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
   395		unsigned long nr = syscall_get_nr(current, regs);
   396	
 > 397		CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
   398	
   399		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
   400			if (WARN(irqs_disabled(), "syscall %lu left IRQs disabled", nr))
   401				local_irq_enable();
   402		}
   403	
   404		rseq_syscall(regs);
   405	
   406		/*
   407		 * Do one-time syscall specific work. If these work items are
   408		 * enabled, we want to run them exactly once per syscall exit with
   409		 * interrupts enabled.
   410		 */
   411		if (unlikely(work & SYSCALL_WORK_EXIT))
   412			syscall_exit_work(regs, work);
   413		local_irq_disable_exit_to_user();
   414		exit_to_user_mode_prepare(regs);
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
