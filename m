Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ED6200BC
	for <loongarch@lists.linux.dev>; Thu, 10 Aug 2023 15:21:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 0309F2B0006F;
	Thu, 10 Aug 2023 11:21:30 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 10 Aug 2023 11:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691680890; x=1691688090; bh=2Q9/wkZuAqGaPUlwVeMbpzA59zc+JfHIktY
	O4gpFXEA=; b=WaZbjPkbWQTw/Kf2GbxPG2OASHHeun5g4F7gn2VAEgpGvcX0iMu
	Yw0WcMwRh4u1WV4pBE6G9uTk6MBB1dHJPrup2veNETaNRO4oXcOwjESAxciFeXUF
	NauwO6Sukf1PFU6n0dXj9QwDqEjC3yTVa/w2d1Z+R/Lzx9G+jHPwmqmOALDamhoy
	LokVRo/3XJA/fz4elEi/N4oOHCD5jy/+LOLlrBT72HRzrUQMflIB9nCojHr3HV4V
	Bufj00VwtXfkV8gZUYB1yOODPXrQiq9tc3T6Krw40UUEVjEXLieszjT3Yd4H4cMT
	MrVsC0HBw1VVqSLHPxz8DspNnyagPvKPT+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1691680890; x=1691688090; bh=2Q9/wkZuAqGaPUlwVeMbpzA59zc+JfHIktY
	O4gpFXEA=; b=caURWnRu3gf0f21Yq3EgOaFoF+0+LEChkA/MJtT7YyI3LV5m714
	4AucINkfhCH/7l0itz81/PZRqQz7EAICfLWp1KH4uz3/nPIypmwec+6pl6I3Ll49
	OPYyMXA27Ii23LIoE2xFAFvebrEnkzvYkLxRMudMaTWmzMB5+4Cd86S8O3blz3yo
	+b1lCYhCQmweIMavk1YUR0R7t5SBxLH5dG8SARL+wYMvkb0grNmeqKPd2XWugH8X
	mJnjkDjSrWQbEKTaRwOxRyK2KArevNSNHEv6DnTdI3M9Iv/VoowyoU7rBt/lK3EY
	ZC4CmhZWc92gA0m7hdP28Pr3eJNx5IJRXlA==
X-ME-Sender: <xms:dgDVZOAmUZploME3CLq3HZRMQE4QF5V2nxBOwAhebfW0oyhrg9k5iw>
    <xme:dgDVZIjp8Pugzv1JIZus0_sAHJ1jDJTEp8r0b7zSeedRyu3Ev7fFT8v0-uwcR-QCc
    TbfuB2HS1B8qD32Kr0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:dgDVZBn3I-iMvlOntn7ATyfucXnmWrnWjaGUohfSfMDg9Qb0QW1mxA>
    <xmx:dgDVZMwXQOXhXLAW6qfOKa0qszZ5dfXqRjoeRDqjjkVhVGYsMbtMcQ>
    <xmx:dgDVZDQu_0VF8vXhFA1cC5gb_f5vhwP0-PjsxB5iBMF55DenRJYJTQ>
    <xmx:egDVZM4t-G0JekS6nLs-RFM29qi33z0HkDEZQ9gpEQ8eCfehGA1sWwPehLM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 47DE4B60089; Thu, 10 Aug 2023 11:21:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <a6222c7f-f903-4de5-821a-f90da8ad1dc9@app.fastmail.com>
In-Reply-To: <e0c2f7b1-b137-fbd3-aa28-808498eb8e3f@csgroup.eu>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-17-arnd@kernel.org>
 <e0c2f7b1-b137-fbd3-aa28-808498eb8e3f@csgroup.eu>
Date: Thu, 10 Aug 2023 17:21:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Jonas Bonn" <jonas@southpole.se>,
 "Stafford Horne" <shorne@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "x86@kernel.org" <x86@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>,
 linux-next <linux-next@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Chris Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Youling Tang" <tangyouling@loongson.cn>,
 "Tiezhu Yang" <yangtiezhu@loongson.cn>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>,
 "Zhen Lei" <thunder.leizhen@huawei.com>, "Xin Li" <xin3.li@intel.com>,
 "Nhat Pham" <nphamcs@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Marc_Aur=C3=A8le_La_France?= <tsi@tuyoix.net>,
 "Johannes Weiner" <hannes@cmpxchg.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 16/17] [RFC] arch: turn -Wmissing-prototypes off conditionally
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023, at 16:59, Christophe Leroy wrote:
> Le 10/08/2023 =C3=A0 16:19, Arnd Bergmann a =C3=A9crit=C2=A0:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> I have cleaned up the -Wmissing-prototypes warnings for most of the m=
ajor architectures
>> as well as all drivers that get enabled for CONFIG_COMPILE_TEST, so n=
ow these should be
>> close to fixed on x86, arm, arm64, powerpc, s390, and riscv.
>>=20
>> The other architectures tend to have a lot of these warning in archit=
ecture specific
>> code, primarily from functions that are only called from assembler co=
de and do
>> not otherwise need a declaration but still cause a warning without on=
e. Other cases
>> are simply functions that should just be static or are missing an #in=
clude statement.
>>=20
>> In order to be able to turn the warning on globally by default withou=
t breaking all
>> these architectures, add a list of exceptions for architecture direct=
ories that
>> can revert back to the old behavior of not warning based on a new
>> CONFIG_WNO_MISSING_PROTOTYPES option.
>
> Some architectures only have a few of those errors/warnings.
>
> For instance microblaze and parisc only have one each. Isn't it better=20
> to fix them rather then turn the errors off ?

The list was only the 'defconfig' warnings, there are a couple more
that I saw with 'allmodconfig', and I'm sure there are even more
when dealing with other random configurations.

I did send other fixes for microblaze and parisc specific drivers,
and I could also send patches for the two defconfig warnings if
the maintainers are happy with fixing those but leaving allmodconfig
to still warn, but I feel that it's easier for them to just
do the last fixes themselves and then remove my hack again.

I'll wait for Michal and Helge on these.

> Others like loongarch which is a recent actively maintained=20
> architecture, I'd expect the 30 errors to be easy to fix.

Agreed, they probably are.

> Many of the alpha ones seems to be brought by your commit e19d4ebc536d=20
> ("alpha: add full ioread64/iowrite64 implementation")

As far as I can see, those already existing before that patch, though
I did touch the same lines there.

In the end it's a matter of where to stop, as there are endless
configurations to test if I want to do a complete job. I drew the
line between powerpc (which I tried to fix) and mips (which I left
alone), mainly because the powerpc side was already exhausting
and mips has even more obscure configurations. The other ones on
the list are all less actively maintained than these two.

     Arnd
