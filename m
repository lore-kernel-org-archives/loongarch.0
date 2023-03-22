Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FB823AD;
	Wed, 22 Mar 2023 10:01:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 7CE4F32000E5;
	Wed, 22 Mar 2023 06:01:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 22 Mar 2023 06:01:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1679479310; x=1679565710; bh=tksBhuI42p2luAwAEh3xskDZ4
	xXmt+ilm+hjIA+mRRE=; b=B9g58SpKhEACZLB9igUV4QmnS6KEFiF14eFpIQSW1
	4s+xaaXUX47Vwd+OyPSUgMkh9GGZ6GJVn1JJDxInlwqvoWqZx0VihQqxNYCbOpe8
	B5UsE9AjuMngOTvoGeBqsSg0IZFEixdkztDDj0O16CBYCpv10hTLRyRd095iK75g
	SRLfWWfAvPHSzkSJZSoFVFK/EjMjSzr772/tm8lVo3nSe2q8Xg0b7FEYMaHk/fHl
	GIYCRTcqi/+o/4D30pZMbr5Og1X1qCuLL9ZMWjdw4Lw0i5tWSOXHSnhHIsBolSIX
	wGzHWNGc3dfwlbUf/zJc9opmL0DJW8t9mcecfXE5OUf+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679479310; x=1679565710; bh=tksBhuI42p2luAwAEh3xskDZ4xXmt+ilm+h
	jIA+mRRE=; b=QSu6QhKAu2QHim0t9WSsa77m7oRiFkUPM2t/g1G9wWgGQGpOe/P
	YpBATEXSFRuKbji9GPBgae5lEutEf5JQ8t1m946MmR9KA8mAhpj6/yyNX7y2H/Zy
	LlMLCnfSzCrro8PA6UT9OE4FHk9p3Z8ejaBWwewkIL0XRR6L/Wrz/kRvY1QdLIMj
	hStvfj7f2wxkLtycg8MBCqwqXyF3B4xLY6whFdTufnSuF5Bd+IRUGEKKTiqZoMkV
	kjYyrl1LfRPBaRPOwSmcNDOzPToWznqQM2riK88Ox3t3pO/hrAGNM7ZyZcy32i5I
	+lLd8gE0lBjWse44npZrrqRBOUAbVN5agZQ==
X-ME-Sender: <xms:DdIaZIFmaQlRBW1DzyDkTgOZnEQ58wLUVzIHPjeRpBvGkS_SUfuI9Q>
    <xme:DdIaZBWn2limaKZ9bLSrtbjva0Gih_PKdaH1MztQY1TqHz-J4H0uD_-YBUkTCeLHs
    SOxkbpiupWEZth-4SU>
X-ME-Received: <xmr:DdIaZCJa8ntxkV8DuzDvBoOxQjFPWB2h2chG9rxIe3Dq3CjMnl3je9JiID0rfCvvr4-5pA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegvddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpedfmfhi
    rhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhesshhhuhhtvghmohhvrd
    hnrghmvgeqnecuggftrfgrthhtvghrnhepvdeuieelgeduteffiedvveejgffhteehfffh
    feetveekteevveetveethfeljeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptd
    durdhorhhgpdhgihhthhhusghushgvrhgtohhnthgvnhhtrdgtohhmnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuth
    gvmhhovhdrnhgrmhgv
X-ME-Proxy: <xmx:DdIaZKFYZltaV5i4DrEQbodniD9hXcOn7nbzwBhHlD4XtKe1pXheCA>
    <xmx:DdIaZOUm5GztP6H4RB9f9qhttO5wMBiKKZbDJZTemYReNYRNDvGAFA>
    <xmx:DdIaZNPpGEqrG6b4mRLYJYdS3kWNGQFk11MZqFZiFN46C60iHtnxuw>
    <xmx:DtIaZJEgwMyV2Xl-AzTUetenlzp0BS1hZPr89kGLua1crL6KYj1qMg>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Mar 2023 06:01:49 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 3141010A603; Wed, 22 Mar 2023 13:01:46 +0300 (+03)
Date: Wed, 22 Mar 2023 13:01:46 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>,
	kernel test robot <lkp@intel.com>, loongarch@lists.linux.dev,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 3778/4413] include/linux/mmzone.h:1749:2:
 error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <20230322100146.tamr3khnfza3eiwq@box>
References: <202303201615.Qfu18nWV-lkp@intel.com>
 <20230320155626.hirui3frcaunnajj@box.shutemov.name>
 <CAAhV-H4P-HUBvd=UnZxEyrqNZeOCzHabYCBEF=C+vfW+oQvqCA@mail.gmail.com>
 <ZBqxTw5ooh7D80IT@kernel.org>
 <723b2eb6-2f4c-8947-0041-a0ced7657885@xen0n.name>
 <ZBq4Q25tqTQQbj2h@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBq4Q25tqTQQbj2h@kernel.org>

On Wed, Mar 22, 2023 at 10:11:47AM +0200, Mike Rapoport wrote:
> On Wed, Mar 22, 2023 at 03:54:09PM +0800, WANG Xuerui wrote:
> > On 2023/3/22 15:42, Mike Rapoport wrote:
> > > On Tue, Mar 21, 2023 at 10:59:36AM +0800, Huacai Chen wrote:
> > > > Hi, all,
> > > > 
> > > > On Mon, Mar 20, 2023 at 11:56 PM Kirill A. Shutemov
> > > > <kirill@shutemov.name> wrote:
> > > > > 
> > > > > On Mon, Mar 20, 2023 at 04:06:33PM +0800, kernel test robot wrote:
> > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > > > head:   73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a
> > > > > > commit: af8daebdbc0833b8095767ccef7ddce55e9fdf32 [3778/4413] mm, treewide: redefine MAX_ORDER sanely
> > > > > > config: loongarch-buildonly-randconfig-r003-20230320 (https://download.01.org/0day-ci/archive/20230320/202303201615.Qfu18nWV-lkp@intel.com/config)
> > > > > > compiler: loongarch64-linux-gcc (GCC) 12.1.0
> > > > > > reproduce (this is a W=1 build):
> > > > > >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > > >          chmod +x ~/bin/make.cross
> > > > > >          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af8daebdbc0833b8095767ccef7ddce55e9fdf32
> > > > > >          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > > > >          git fetch --no-tags linux-next master
> > > > > >          git checkout af8daebdbc0833b8095767ccef7ddce55e9fdf32
> > > > > >          # save the config file
> > > > > >          mkdir build_dir && cp config build_dir/.config
> > > > > >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
> > > > > >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch prepare
> > > > > > 
> > > > > > If you fix the issue, kindly add following tag where applicable
> > > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > > | Link: https://lore.kernel.org/oe-kbuild-all/202303201615.Qfu18nWV-lkp@intel.com/
> > > > > > 
> > > > > > All errors (new ones prefixed by >>):
> > > > > > 
> > > > > >     In file included from include/linux/gfp.h:7,
> > > > > >                      from include/linux/mm.h:7,
> > > > > >                      from arch/loongarch/kernel/asm-offsets.c:9:
> > > > > > > > include/linux/mmzone.h:1749:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
> > > > > >      1749 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
> > > > > >           |  ^~~~~
> > > > > 
> > > > > +Loongarch folks.
> > > > LoongArch defines SECTION_SIZE_BITS as 29, so I think the upper limit
> > > > of ARCH_FORCE_MAX_ORDER should not be 63, MIPS is similar.
> > > The ranges MIPS add LoongArch define for ARCH_FORCE_MAX_ORDER are insane.
> > > I'm going to drop them and leave ARCH_FORCE_MAX_ORDER an int with sane
> > > defaults.
> > > 
> > > As for this splat, in the .config above ARCH_FORCE_MAX_ORDER=14 and
> > > PAGE_SIZE=64k, so we end up with MAX_ORDER + PAGE_SHIFT being 30, that's
> > > larger than SECTION_SIZE.
> > > 
> > > AFAIK randconfig does not randomize integers, so it's unclear to me how
> > > ARCH_FORCE_MAX_ORDER got to 14.
> > > 
> > 
> > As far as I can see, arch/loongarch/Kconfig has the following lines:
> > 
> > > config ARCH_FORCE_MAX_ORDER
> > >         int "Maximum zone order"
> > >         range 14 64 if PAGE_SIZE_64KB
> > >         default "14" if PAGE_SIZE_64KB
> > >         range 12 64 if PAGE_SIZE_16KB
> > >         default "12" if PAGE_SIZE_16KB
> > >         range 11 64
> > >         default "11"
> > 
> > So the value 14 is because PAGE_SIZE_64KB is being set, which I confirmed to
> > be the case with this particular run. And I believe the stanza is inherited
> > from arch/mips.
> 
> With Kirill's patch the range became '13 63', so I don't see why randconfig
> would set ARCH_FORCE_MAX_ORDER to 14.

I think the failure just due to 0day having old config it tries to re-use.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
