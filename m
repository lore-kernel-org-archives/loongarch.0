Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C95319604
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013527; cv=none; b=suUOLZ4QUx8MKKDDkqwhq0jbYY52HmRuxPwwQRqqR+WrueUM67hMAhitrKEmKxY/RRLOLHtkBD5hlyvU3jJph5wqvG2/4Q1DEz2VGqe03+lOL4pJkU3ctssVsVa6Lg0F9jSibWGo4/lQ/Fh7kLP7pFZ82ZZ/a9H3KAeyT9QTgGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013527; c=relaxed/simple;
	bh=Jj/tYwdXEXUOg64lKr4IrDKHw613UPzJ/qBPeEVnSIo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y4lkDxQjROzZldVNEK+50HH1nfb11lSdgaPn7zsQSLOi161mdfXl9k4Kt8DUzB0HIiKJwvfcLCYqEbInX9mtSEdcomLOTLRgEfGbXekxJyYJfkyWDkLibyt5S3X7VDHbQQerJMvBIZECmDPsxx6klMfch8I98e3sHLtCa15AVoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvEFVhWB; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvEFVhWB"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b87677a8abeso1078543466b.1
        for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769013524; x=1769618324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=QvEFVhWB6hh3EKtM04hhqNp7CQPw0riWjZrbY25J9m1NIykX1BJm/o+ubyEluXCE95
         BsFigaD+Q6Fma3x74ZW4fHf7LJ50ALT6Pdc6U473Ha78j6g9VjSBR8IzQV8NIlKRugPH
         N6bThdnAHkOF1dHqOZY3IC0/lvafcwrP6GRVxSE5x03Txw97HH3Q0SCz3UD/RdqFsl7C
         ZRWaK3dRcsV7GWlfCJlg/Iy0gfvWhrcopERMrmZVi3PD1vu+C2rBXCok1/mrYm3tYyVk
         yqEr966dWFFhyOJ3eDhRxoYn6i+8YhOsR5r/u59F7KHRKKPGQudw2UwxT62qjTOlQHYE
         /JPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013524; x=1769618324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=msWn62QxEvFz9WRfXlI2sUYrfW2U+xKLhmMU83vw+Axh77+TSKBFcsYbX5reReNqXs
         vQsNgr1UO8GaKKvYT2YojH3GfGGU80Ain0D/TNFBQWJCfqV4Mpg4H8ge41YKUDrXfmRL
         HR/uAIO5hfX7C3Pzh+9y3h9BfCWvMrZx98aXniVmd2wwe29782D9HgHDvpoWb6C7GUPT
         j2zTMD2P5SBpFt8tpYO+3xNLLszvdMQm3jJKU2zVQON6ISPl+uuzid5YFxVmv1HB8YHg
         EEjsBkFUVkADeOnJZSojllx0e6IRfWwh8U+SNkB4+lUl9cwsSwv4MuHjHAlkc211ROpE
         J3+g==
X-Forwarded-Encrypted: i=1; AJvYcCVgRsleLLM2Hz1N524wfAPhWNxuW32FpCv3eJqn+fPExM4k93LyyjTL9QAXU3Az+aXx7MzxPQqrGRY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCwwQ+P8o2TBVhBe5YD6puWB2uiaHJUqdFkR0AUMVPXhkIvD0e
	Zw9pHo27tMgY3ljiXDGKPadU2j35xgwCjeYVqdiF6R1oeHr7d8z2VESjHzsV8A==
X-Gm-Gg: AZuq6aIQt6t1kWQNwXjGxl0OuDYOHDZtq7w/5c++0e+MDZ1WGXq4TxFPqlT4Yzg7CZB
	u5guK3a0jYOKXRRmrS8va4+ebTqQkirh+6QtSLv+vE3RPfYbnaUp4+SBMzF+Fk95S6FXFwdBK0H
	Ammioxh1ipZBrVisB9BTjc1/kmH6QMXYupkfH3aBbl4mzIUXO0CWYwe4OBn0tHyPAapQtXk6Gnp
	0HRNOkz8SFw24tB63pbazMt+acv7DonUyysD4tVazUqQBKrn32HCjXwdfFMvdRiXzLui7LfGtL7
	tfVDmK2y1hMNunuGnwk31yIpHKwMFkgzOEdp2n3lfSQsREIPrZP/Lo2T0h4FoUXxYT9+AWis6sw
	Dag22Ln+x4acLIdffTLF8gf9G0V2LF6uwXYcSnW2IaQ/HgX4gNuXgKd23hMjk5D/oVZAuDcDcSP
	9GHP7Sjnnq8Y/xlLBjFGIyxNxn6qAu1DzcO7j+dmszZ6rinMJ+oj7h
X-Received: by 2002:a05:600c:4fc7:b0:480:41f2:b212 with SMTP id 5b1f17b1804b1-48042f7e0e0mr38897745e9.25.1769006884109;
        Wed, 21 Jan 2026 06:48:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm274897235e9.7.2026.01.21.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:48:03 -0800 (PST)
Date: Wed, 21 Jan 2026 14:48:02 +0000
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
Message-ID: <20260121144802.1287ce3e@pumpkin>
In-Reply-To: <20260121102017.539b5531@pumpkin>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
	<20260121102017.539b5531@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2026 10:20:17 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Wed, 21 Jan 2026 07:50:16 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Ryan,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on akpm-mm/mm-everything]
> > [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> > [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> > patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> > config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> >   
> > >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> > >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section    
> >   
> 
> When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
> the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
> become real functions.
> 
> Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

Or the code could just use the per-cpu data without disabling preemption.
Usually that isn't a good idea at all, but it can't matter in this case.
Might give a noticeable performance gain, disabling preemption is
non-trivial and/or an atomic operation on some architectures.

If anyone is worried about preemption causing the output be repeated, that
would be (mostly) mitigated by checking that s[1234] haven't changed prior
to writing the new values.
I think a 'not locked at all' compare of two of the four values will
stop everything except two threads doing system calls at the same time
getting the same output from the prng.

The whole thing is very unlikely and there will be much easier ways
to break the prng.
Provided s[1234] are only written with valid values (ie ones which aren't
effectively zero) it will continue generating numbers.

	David


> 
> 	David
> 

