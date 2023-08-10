Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55BD20CA8
	for <loongarch@lists.linux.dev>; Thu, 10 Aug 2023 19:15:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 932232B00042;
	Thu, 10 Aug 2023 15:15:28 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 10 Aug 2023 15:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1691694928; x=1691702128; bh=cD
	RJ70tlUw1f5vvydGZnly44JvjoIjvlKIEtTxRqzOA=; b=Fk2a3oKmRFUV8gAJci
	cBgTwdOAfOvfxBfK/kzCwlLqOBiyBQrsJn0dHNRXfNBXPuzXQ7ygeDO0/PUB8uvN
	AMP/JfIvRPikIajQnRrvSccd77nZcD/ungRbk94cFbYENcxAfkonC8FO7FHvhvLs
	CVaHz3PQ+AGsUd1qQ8l/U8lLilbV6rMW3uksC3GEnqaH3YNwh4oQ4W4u8l6/IlYL
	UObBFmgnimQLBwPvDCPtROdOvW+vu3xSOSdRpF1aRHAX5rG/65p8nWjGmn0SvmPu
	Xzxd4L1sEzwFGWTi9MDLJ9HfS+EpCa4GNl6rT5K2LIydS4d5PKdfTtPSUg/WZtC3
	5iuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691694928; x=1691702128; bh=cDRJ70tlUw1f5
	vvydGZnly44JvjoIjvlKIEtTxRqzOA=; b=gEReDA4xlb1+2btfZ8OIi/HObLPVP
	pZOOBBWbF5jXzlRKav71x1gVU/GKekOsisb/AQQyveBRByWFW4pdeu4w/2uAqkBW
	6qK0svrh25X5Vs9DWiTIO5LlPIQcPOH8Le5nzhvC+XZG+DgOOTehZoFN+mlvKOPM
	e7CEMye7Wmo8ceYe21znTs+hr5KsJw2AKkbV9UZKY36xbm50fUIw42D2ARfev76C
	gWJX+RmJI1dIAFytEVWdvSHPe/i5Kc59mQDxykfyIz2MslofjC5OQuVxi7gb69Wd
	/F+w3wFhaHQ2wZ8qMqpJmFDIYImz7QdKekUi0iUGXsLV3DaJAbxBYdPfQ==
X-ME-Sender: <xms:TDfVZM7n60562LbJiP0wru7s5qkFDSzOMTy0OZYfZlt5l3pODeRyMw>
    <xme:TDfVZN7ikipGbYQ7WNsY3DwWuoPZpsy-jPiX-_aKlEQfiRAL_N7NoaOBbZ9mRVnra
    Gf7eguGPLc3fjpq7hU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigddufeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:TDfVZLdkZrjk8s0kFOBwq_6OTgPN6nE9pPzhxq-Sv4Wd1TOEGcjOsQ>
    <xmx:TDfVZBK4rFFmyaOtbHwrGRuYpbcZqOSLn6By0rZ_xyhR1EfJQuTZhA>
    <xmx:TDfVZAJQxnxJC4wwijjIRxXRKOev0DfhX4pzMzcFKZ6vbZrXEXO5Tg>
    <xmx:UDfVZGTwkI5nbbKi5GcuEsPdLC-F1lfZ36tXwzgLvuGv4tvv61StptN8l70>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 99A05B60089; Thu, 10 Aug 2023 15:15:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <9f295a4d-5657-4e4d-8740-eb9a56cee97d@app.fastmail.com>
In-Reply-To: <5bc9d25c-d546-fe94-05cc-41bd5bbbaf67@gmx.de>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-17-arnd@kernel.org>
 <e0c2f7b1-b137-fbd3-aa28-808498eb8e3f@csgroup.eu>
 <a6222c7f-f903-4de5-821a-f90da8ad1dc9@app.fastmail.com>
 <5bc9d25c-d546-fe94-05cc-41bd5bbbaf67@gmx.de>
Date: Thu, 10 Aug 2023 21:15:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Helge Deller" <deller@gmx.de>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
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
 "Michael Ellerman" <mpe@ellerman.id.au>,
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
Content-Type: text/plain

On Thu, Aug 10, 2023, at 17:59, Helge Deller wrote:
> On 8/10/23 17:21, Arnd Bergmann wrote:
>> On Thu, Aug 10, 2023, at 16:59, Christophe Leroy wrote:
>>
>> I did send other fixes for microblaze and parisc specific drivers,
>> and I could also send patches for the two defconfig warnings if
>> the maintainers are happy with fixing those but leaving allmodconfig
>> to still warn, but I feel that it's easier for them to just
>> do the last fixes themselves and then remove my hack again.
>>
>> I'll wait for Michal and Helge on these.
>
> Arnd, I like your patch!
> For parisc I've done quite some work during the last few weeks to
> get such warnings sqeezed out, so please drop the hunk for parisc from
> your patch. My plan is to become warning-free before 6.5-final.
>
> This last one:
>      arch/parisc/lib/ucmpdi2.c:12:5: error: no previous prototype for 
> '__ucmpdi2' [-Werror=missing-prototypes]
> I'll take care in the parisc for-next tree.

Sounds good to me, thanks!

     Arnd
