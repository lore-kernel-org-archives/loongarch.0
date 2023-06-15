Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC942E0D8
	for <loongarch@lists.linux.dev>; Thu, 15 Jun 2023 17:39:53 +0000 (UTC)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 35FGJsTl017085;
	Thu, 15 Jun 2023 11:19:54 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 35FGJqSI017082;
	Thu, 15 Jun 2023 11:19:52 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 15 Jun 2023 11:19:52 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Eric DeVolder <eric.devolder@oracle.com>, linux@armlinux.org.uk,
        catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
        geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.osdn.me, dalias@libc.org, glaubitz@physik.fu-berlin.de,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, peterz@infradead.org,
        linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com,
        kernel@xen0n.name, ardb@kernel.org, tsi@tuyoix.net,
        agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com,
        masahiroy@kernel.org, konrad.wilk@oracle.com,
        sebastian.reichel@collabora.com, samitolvanen@google.com,
        ojeda@kernel.org, juerg.haefliger@canonical.com,
        borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de,
        mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org,
        gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com,
        xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk,
        paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com,
        hbathini@linux.ibm.com, gregkh@linuxfoundation.org,
        kirill.shutemov@linux.intel.com, ndesaulniers@google.com,
        sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com,
        tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Subject: Re: [PATCH v1 10/21] powerpc/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <20230615161952.GD19790@gate.crashing.org>
References: <20230612172805.681179-1-eric.devolder@oracle.com> <20230612172805.681179-11-eric.devolder@oracle.com> <87fs6tflfi.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fs6tflfi.fsf@mail.lhotse>
User-Agent: Mutt/1.4.2.3i

On Thu, Jun 15, 2023 at 01:34:25PM +1000, Michael Ellerman wrote:
> Eric DeVolder <eric.devolder@oracle.com> writes:
> > -config KEXEC_FILE
> > -	bool "kexec file based system call"
> > -	select KEXEC_CORE
> > -	select HAVE_IMA_KEXEC if IMA
> > -	select KEXEC_ELF
> > -	depends on PPC64
> > -	depends on CRYPTO=y
> > -	depends on CRYPTO_SHA256=y
> ...
> > +
> > +config ARCH_HAS_KEXEC_FILE
> > +	def_bool PPC64 && CRYPTO && CRYPTO_SHA256
> 
> The =y's got lost here.
> 
> I think they were both meaningful, because both options are tristate. So
> this previously required them to be built-in (=y), whereas after your
> patch it will allow them to be modules.
> 
> I don't know for sure that those options need to be built-in, but that's
> what the code does now, so this patch shouldn't change it, at least
> without an explanation.

This patch shouldn't change it at all, period.  If you want to change it
(and that sounds like a good idea, if it is possible anyway), that
should be a separate patch.


Segher
