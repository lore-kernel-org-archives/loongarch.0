Received: from a3.inai.de (a3.inai.de [88.198.85.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BCC1847
	for <loongarch@lists.linux.dev>; Wed, 28 Jun 2023 03:45:13 +0000 (UTC)
Received: by a3.inai.de (Postfix, from userid 25121)
	id 3EAFB5880BBDB; Wed, 28 Jun 2023 05:38:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id 3CBF860DE22B8;
	Wed, 28 Jun 2023 05:38:57 +0200 (CEST)
Date: Wed, 28 Jun 2023 05:38:57 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: Thomas Gleixner <tglx@linutronix.de>
cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Nikolay Borisov <nik.borisov@suse.com>, 
    "Ahmed S. Darwish" <darwi@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, 
    Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
    linux-ia64@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
    WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
    Rich Felker <dalias@libc.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
    sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
    Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
    Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org, 
    Richard Henderson <richard.henderson@linaro.org>, 
    "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Chris Zankel <chris@zankel.net>, 
    Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [patch 00/17] init, treewide, x86: Cleanup check_bugs() and
 start sanitizing the x86 boot process
In-Reply-To: <20230613223827.532680283@linutronix.de>
Message-ID: <8qpp1r32-pr73-8477-nso-327o845o1149@vanv.qr>
References: <20230613223827.532680283@linutronix.de>
User-Agent: Alpine 2.25 (LSU 592 2021-09-18)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wednesday 2023-06-14 01:39, Thomas Gleixner wrote:

>Hi!
>
>My team and myself are working on sanitizing the x86 boot process,
>especially the complete horror show of CPUID evaluation, which is
>constructed with hay-wire circuits, duct tape and superglue.

What's with Intel and its glue analogies? Not to mention it stuck very 
well, if I may say so myself (not to mention the glue in the co 
struction of the 12th Intel series).
