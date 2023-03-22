Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF39A1FB1;
	Wed, 22 Mar 2023 08:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875B9C433EF;
	Wed, 22 Mar 2023 08:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679472721;
	bh=okeZvv3D7XhTVm0LuvGt5O//tbGWRywQFIgBec991Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=naF45VCkHA8xy/3VLS2SLVNpm/ev7Orqzb07ReeGUhypl7zTu2Ds17gNbBw3DxE91
	 o0BJcYzy8CbXztB2fw/j6vvO+GjImciqXUa4wKmcQiYtRwPuloODSwDGafr4zvoxQk
	 2FljODbcWho05XlvQ/AewlDn1/v3TkKnLpPEXBtzqfLkWyVkdI+aWZgaHt7948BJlX
	 nlnuWnggVwJfjip/n/yMz7pOH4e9M9VPlWVNVAqzK2spvrQ6v8fKYo6/32jmXYP+gK
	 9rVfknSDoSfjM6h+a3OmLUBoSaVbdi+bhGdnfPMYB1H89cSEtBLvpuZzaj+CnQn12j
	 tX18lweqhFNsA==
Date: Wed, 22 Mar 2023 10:11:47 +0200
From: Mike Rapoport <rppt@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	kernel test robot <lkp@intel.com>, loongarch@lists.linux.dev,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 3778/4413] include/linux/mmzone.h:1749:2:
 error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <ZBq4Q25tqTQQbj2h@kernel.org>
References: <202303201615.Qfu18nWV-lkp@intel.com>
 <20230320155626.hirui3frcaunnajj@box.shutemov.name>
 <CAAhV-H4P-HUBvd=UnZxEyrqNZeOCzHabYCBEF=C+vfW+oQvqCA@mail.gmail.com>
 <ZBqxTw5ooh7D80IT@kernel.org>
 <723b2eb6-2f4c-8947-0041-a0ced7657885@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <723b2eb6-2f4c-8947-0041-a0ced7657885@xen0n.name>

On Wed, Mar 22, 2023 at 03:54:09PM +0800, WANG Xuerui wrote:
> On 2023/3/22 15:42, Mike Rapoport wrote:
> > On Tue, Mar 21, 2023 at 10:59:36AM +0800, Huacai Chen wrote:
> > > Hi, all,
> > > 
> > > On Mon, Mar 20, 2023 at 11:56 PM Kirill A. Shutemov
> > > <kirill@shutemov.name> wrote:
> > > > 
> > > > On Mon, Mar 20, 2023 at 04:06:33PM +0800, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > > head:   73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a
> > > > > commit: af8daebdbc0833b8095767ccef7ddce55e9fdf32 [3778/4413] mm, treewide: redefine MAX_ORDER sanely
> > > > > config: loongarch-buildonly-randconfig-r003-20230320 (https://download.01.org/0day-ci/archive/20230320/202303201615.Qfu18nWV-lkp@intel.com/config)
> > > > > compiler: loongarch64-linux-gcc (GCC) 12.1.0
> > > > > reproduce (this is a W=1 build):
> > > > >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > >          chmod +x ~/bin/make.cross
> > > > >          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af8daebdbc0833b8095767ccef7ddce55e9fdf32
> > > > >          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > > >          git fetch --no-tags linux-next master
> > > > >          git checkout af8daebdbc0833b8095767ccef7ddce55e9fdf32
> > > > >          # save the config file
> > > > >          mkdir build_dir && cp config build_dir/.config
> > > > >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
> > > > >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch prepare
> > > > > 
> > > > > If you fix the issue, kindly add following tag where applicable
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Link: https://lore.kernel.org/oe-kbuild-all/202303201615.Qfu18nWV-lkp@intel.com/
> > > > > 
> > > > > All errors (new ones prefixed by >>):
> > > > > 
> > > > >     In file included from include/linux/gfp.h:7,
> > > > >                      from include/linux/mm.h:7,
> > > > >                      from arch/loongarch/kernel/asm-offsets.c:9:
> > > > > > > include/linux/mmzone.h:1749:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
> > > > >      1749 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
> > > > >           |  ^~~~~
> > > > 
> > > > +Loongarch folks.
> > > LoongArch defines SECTION_SIZE_BITS as 29, so I think the upper limit
> > > of ARCH_FORCE_MAX_ORDER should not be 63, MIPS is similar.
> > The ranges MIPS add LoongArch define for ARCH_FORCE_MAX_ORDER are insane.
> > I'm going to drop them and leave ARCH_FORCE_MAX_ORDER an int with sane
> > defaults.
> > 
> > As for this splat, in the .config above ARCH_FORCE_MAX_ORDER=14 and
> > PAGE_SIZE=64k, so we end up with MAX_ORDER + PAGE_SHIFT being 30, that's
> > larger than SECTION_SIZE.
> > 
> > AFAIK randconfig does not randomize integers, so it's unclear to me how
> > ARCH_FORCE_MAX_ORDER got to 14.
> > 
> 
> As far as I can see, arch/loongarch/Kconfig has the following lines:
> 
> > config ARCH_FORCE_MAX_ORDER
> >         int "Maximum zone order"
> >         range 14 64 if PAGE_SIZE_64KB
> >         default "14" if PAGE_SIZE_64KB
> >         range 12 64 if PAGE_SIZE_16KB
> >         default "12" if PAGE_SIZE_16KB
> >         range 11 64
> >         default "11"
> 
> So the value 14 is because PAGE_SIZE_64KB is being set, which I confirmed to
> be the case with this particular run. And I believe the stanza is inherited
> from arch/mips.

With Kirill's patch the range became '13 63', so I don't see why randconfig
would set ARCH_FORCE_MAX_ORDER to 14.
 
> Looking at other arches it seems a much smaller upper limit would be
> desirable. Even the lower limit of 14 could be lowered, e.g. arch/powerpc
> has "range 8 9 if PPC64 && PPC_64K_PAGES". Is that okay?

I don't think architectures should mess with MAX_ORDER unless strictly
necessary. Having an integer config symbol with sensible defaults is enough
to ensure that MAX_ORDER can fit a PMD page.

I really doubt anyone should ever override that default in their kernel
builds.
 
> -- 
> WANG "xen0n" Xuerui
> 
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
> 

-- 
Sincerely yours,
Mike.
