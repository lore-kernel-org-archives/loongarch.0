Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E4341C31A
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997087; cv=none; b=lLCv+9Ej4M+cdNhQzl8SJ3nXrV+Nf2wVpO49jyQnZi4+kY0M90v/c6eC+CxeGNccyDGS2nDpGJb9V0puLur//hKR5ZTuNewCOKSaVutqUoaDYqG6YJW3IH0eFbSBbVSQIHbWuy175duunBf7Hf5bAjM1aOb9bBZZX2aWq+Hp3HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997087; c=relaxed/simple;
	bh=5BvH3tNtf3yGwclgsloqehSCFnzEUkv3zWGQ5+wTvn8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dZIt3wsATr4Wcl9vHQGHYdPstt0CtsdWkyuvFFbqGl8QTJjqDnupXMKv695XhHa1FSdcpoUDIurjrB8UNUaxVfHnfm6cGoSw1dOu3EjsCRsV3eXco5WIOKEt8IYNKpprNy9m0DTGuGxwnkBjhsMyeNODGY9kKJmq/jl6S4Izqlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFtwlKes; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFtwlKes"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-382fea4a160so62002391fa.2
        for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 04:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768997080; x=1769601880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=cFtwlKesidUkEPJRnze2PKQDVKqYkeV4a52OhiXhUwDAniy0AH9dLA8bRFQ8SHUgfG
         ab/TeGYLP4tI45UU5l6o+8se/bnhSG060wsZx72vcqpbXYvlQlnqmo6uJDdnMb2nIWzj
         dSiTh0sbuWGKzPBIpK+LY3cPU5UIO3sezeg4esunhiKWpmFe3J0LTRYOXoUG8QDjuVNd
         v6EB0w2W0dGrCe5obKIuS9DztbhVta1Ynq/k2PZyckOfact66JtUkuE4yFxHtocX+luv
         tlQvzCqYed0y7yPavGanboFkeykb9Co1peFDPQRgeXEsZUrhEELpS6Ry0hED8O0w+9Wu
         Ymvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768997080; x=1769601880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=ZSVPSvG4ZEuRblx0fdif5HQ8GKKlzrp16eqr40W7ysMAnYZvjxL0SZBa12MqvApZsC
         wgLGV1RPOKFBkSL/vnCEbd+CSzP4AaV7iJRPyij5Clq6QeCTZ0l1H9lMHW2Rj958o/Kb
         Z4ie5raStHC43OE9g35k1QyRmMzap1PitKyJ676Qdfl9OgWlgf9zObSZL+GxHSl4lYi+
         KG9ovJlSFScEHkv6ad4YPaLNPq+QLE59B4SbMKEoUMA87gEigkqybuvc7MNZHM9mgRuu
         9OLH+agG1TK59nL8Eg0B8W2g6cKq3lQyM/iB1KJMd2GFs7TaB88675oFJDSbjoIN1Tvl
         nGWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMd0oAv5GAT1NEY4mSjLnNsVTnWqeTgAG5QUFs6Y8/TfZiVRYQiFWXihufw+5K9WuGhhQqr1QYYyw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBULSaswQZPxMHXr5U4jboSLcXRy0hSs55Q9EePbhZO6JuECO9
	EeakQXvAeMrMGs6Qor2IWpr57Pp5CJ1C0seRp2Xm6EOxv9TVqzUB/2bAtMUkHg==
X-Gm-Gg: AZuq6aKu1fNR8n3Dl6VVrO1ToGgFlkYmZoYhxIJK31L0f5Lf5WkdA5jwloFG1DVH4NW
	t1ElvUXuftJKbojExIxByhcf9WT8Hz+fqymdH5jvu0xedcDUHZLQ3ccbEhZB8EVOhffYAzm6Yeb
	8Vbruvw47Rn2Q+y5wqEP1MW+FDij7kO5/TRXFr5wWu28KChFxBqZC5YwnAnOYM38sAp0cEux07K
	VOATyHMC9kO56LjCFOADUwDTfC/1VFNOjQ9Ur6Lr7JLoRaMLpcAENMwJpG/TsR6iIxOlqgzIeyL
	j/HQKVgHjc5FFg16mSnPUt8OFb+qGqaw4pm7qzLKsVDI41bbdeDPzb66J9Bf0TUkqcyW+kBysIn
	XhQeuqR6vpgvP+tYyNkEeoByBXSyFPmt3L71li2CfzFND3lihxcAPEgerLsJ2Xvc7mCvsOsB4cA
	JeMQ+nWY3FeVNHKDxRgaY1vgqHC6p988Fy6a03usOCT+v7F2PNU6pdBL4Oa/y9Pnk=
X-Received: by 2002:a05:600c:8b55:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-4801e2fbd61mr238692885e9.1.1768990819461;
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm306630785e9.14.2026.01.21.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Date: Wed, 21 Jan 2026 10:20:17 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260121102017.539b5531@pumpkin>
In-Reply-To: <202601210752.6Nsv9et9-lkp@intel.com>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2026 07:50:16 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Ryan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section  
> 

When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
become real functions.

Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

	David
