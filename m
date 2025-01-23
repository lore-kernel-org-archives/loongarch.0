Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A853211A24;
	Thu, 23 Jan 2025 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737652372; cv=none; b=eMvdE3bKR2EUn9z/+dMCVCN4KFtBxwyqyH0xd0y8Iuaq3aHvz1wOkL1mnZLUTygSxbsVE7nXeb67e3HK0DvLWuJ+s3EWhUIyBr6Uyert6ALjMQ73cFShGDkBw3WURIEDrsMha4X4ZZ0c4axz+er/lz+KFQ8A+elTooUYVsmTtls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737652372; c=relaxed/simple;
	bh=72EgORSnANnV38wbPsZBehRg9IUMQUAma7ZLXPqx6k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE+6jgD/cHlE0YHTNrJy6jhjPmikwPwF0YoxDr+xWt2OPwQbaNJDzgHCBNfWtWSrwg52I54xLCF4xUb0EJvCHR5DxIxwXcRYiBhDG4ygVx2CSbxYwa8y/5jrsbiBAmAmXxQNuGnl72/PpKlzYThgR1b7nLEBK7Sf4q6+uC2Y6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/8sLZOj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/8sLZOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737652371; x=1769188371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=72EgORSnANnV38wbPsZBehRg9IUMQUAma7ZLXPqx6k4=;
  b=W/8sLZOjV5e73/DutxxPXIkF0NKLeT3ZiGiuS2F35+IKLpkV7CdxyS7n
   Q2mniOXJyatf45r5b9EPCjOuGOrXnN78SEJ/tssp01caV/Dd6hoQZtEW8
   fZd9XbRfDcZW0XZjrnQYhK9s4fOGgoOZgcAwrF0t5OTFWwoCVOv8co0Gp
   bYS7yk0vBRZ/VjKFTpGuk6OlK2+e0Ra6dTnbUyQhaFT7sj8lv2VP+U6hr
   0QMSOr5raOrTdI7F2QiO8rsLEpXlCnnPGp26Sq0NqbXpegmzHkBcUlIrr
   g7tQvMhaOR/zlMEDR9azjjDJsi3JDPTQjlKxT932GnOrlaCMedEKB+O05
   A==;
X-CSE-ConnectionGUID: G8xvw/yNSYmNMrKyfNUj9A==
X-CSE-MsgGUID: i1ZXmVmbQxmad6Og8exi+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38053849"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="38053849"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 09:12:50 -0800
X-CSE-ConnectionGUID: 6vxV2VRDR8mPAsL5dwom+Q==
X-CSE-MsgGUID: tBoXpY+EQ2Kj/C0jM/xkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144764755"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2025 09:12:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb0l0-000bQs-1A;
	Thu, 23 Jan 2025 17:12:42 +0000
Date: Fri, 24 Jan 2025 01:12:23 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH 4/4] entry: Inline syscall_exit_to_user_mode()
Message-ID: <202501240036.hxoscXJM-lkp@intel.com>
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
config: x86_64-randconfig-071-20250123 (https://download.01.org/0day-ci/archive/20250124/202501240036.hxoscXJM-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240036.hxoscXJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240036.hxoscXJM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/ptrace.c:40:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
>> include/linux/entry-common.h:397:27: error: use of undeclared identifier 'CONTEXT_KERNEL'
     397 |         CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
         |                                  ^
   1 error generated.


vim +/CONTEXT_KERNEL +397 include/linux/entry-common.h

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
