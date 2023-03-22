Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705EB1FB1;
	Wed, 22 Mar 2023 07:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98338C433D2;
	Wed, 22 Mar 2023 07:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679470940;
	bh=fI8I7kUW9jl8JDKoUwnDcZT5y9SyGOf9EGeftjRodGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uU2sJ3HuM4EZ/d8q4LldNgAathUVoQ2FnXXL9nWNAVQ30N+HhnFGHqHQUW9PbccAs
	 oJaz5Y1anXW59lKM0/AVzHD/twBCDS0zQgXiXdMjx7w5bRhGfklbSs1Zvwl2AHMdAp
	 PXL2GvMqKlfuDSCcfd9Mw4Had/XPV9MUGimXG07hHi0Ry55msuX61kYvBa2L9VDHUK
	 9p8tVnGhFPl26xELhc0InHOqRIPLC6SGkrZOHXzkMU2CguCr+HX/XclX9K64nZ6tk7
	 6r+BtMAG+vcoJabPrraUPT8QUtuiRy/Z+I5AGlNPSFsDs+49W16hfq9qU1allRdtPV
	 EG+YRQxwAfNzA==
Date: Wed, 22 Mar 2023 09:42:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	kernel test robot <lkp@intel.com>, WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 3778/4413] include/linux/mmzone.h:1749:2:
 error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <ZBqxTw5ooh7D80IT@kernel.org>
References: <202303201615.Qfu18nWV-lkp@intel.com>
 <20230320155626.hirui3frcaunnajj@box.shutemov.name>
 <CAAhV-H4P-HUBvd=UnZxEyrqNZeOCzHabYCBEF=C+vfW+oQvqCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4P-HUBvd=UnZxEyrqNZeOCzHabYCBEF=C+vfW+oQvqCA@mail.gmail.com>

On Tue, Mar 21, 2023 at 10:59:36AM +0800, Huacai Chen wrote:
> Hi, all,
> 
> On Mon, Mar 20, 2023 at 11:56 PM Kirill A. Shutemov
> <kirill@shutemov.name> wrote:
> >
> > On Mon, Mar 20, 2023 at 04:06:33PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a
> > > commit: af8daebdbc0833b8095767ccef7ddce55e9fdf32 [3778/4413] mm, treewide: redefine MAX_ORDER sanely
> > > config: loongarch-buildonly-randconfig-r003-20230320 (https://download.01.org/0day-ci/archive/20230320/202303201615.Qfu18nWV-lkp@intel.com/config)
> > > compiler: loongarch64-linux-gcc (GCC) 12.1.0
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af8daebdbc0833b8095767ccef7ddce55e9fdf32
> > >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > >         git fetch --no-tags linux-next master
> > >         git checkout af8daebdbc0833b8095767ccef7ddce55e9fdf32
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch prepare
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Link: https://lore.kernel.org/oe-kbuild-all/202303201615.Qfu18nWV-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    In file included from include/linux/gfp.h:7,
> > >                     from include/linux/mm.h:7,
> > >                     from arch/loongarch/kernel/asm-offsets.c:9:
> > > >> include/linux/mmzone.h:1749:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
> > >     1749 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
> > >          |  ^~~~~
> >
> > +Loongarch folks.
> LoongArch defines SECTION_SIZE_BITS as 29, so I think the upper limit
> of ARCH_FORCE_MAX_ORDER should not be 63, MIPS is similar.
 
The ranges MIPS add LoongArch define for ARCH_FORCE_MAX_ORDER are insane.
I'm going to drop them and leave ARCH_FORCE_MAX_ORDER an int with sane
defaults.

As for this splat, in the .config above ARCH_FORCE_MAX_ORDER=14 and
PAGE_SIZE=64k, so we end up with MAX_ORDER + PAGE_SHIFT being 30, that's
larger than SECTION_SIZE.

AFAIK randconfig does not randomize integers, so it's unclear to me how
ARCH_FORCE_MAX_ORDER got to 14.

> Huacai
> >
> > The same situation as with mips:
> >
> > https://lore.kernel.org/all/20230315152636.smn34f3c6a5jzpn3@box
> >
> > --
> >   Kiryl Shutsemau / Kirill A. Shutemov
> 

-- 
Sincerely yours,
Mike.
