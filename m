Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6C4CB80
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 22:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZAoS9GAPCjvcD2e9rjRkdzaMQfoBwDvlSDrbpklXNtw=; b=gOWkVHN6VrFdTRZ3tkfzExyMX5
	iJG3T+SC9IXbxn90Fbaz8qafSZ2cSWCKJIfE8M6lrpaFk6i6pbMJcmCesDgK+0V1ZlSkpV3lpLQvt
	6t3as6FVzUgvCdry0d05aVbpoyawUPAWWKEqHsdUd51LfdMnUdvaseupK9S0TyD3aRX25kRmEaruc
	EDzNZOFM6e6s8/SHUq+zLrY0bXzYJpc9f4y5Cy3NTRq9ku5n9kEMzAqA4jLJe3H8GReXifQoT0YuX
	GYQEQY1P5tctvQOGyUvJ+7gLiMHs9z3IdsrOcbX7CJOmYcb6RVPKTGGR+IyKtzcy3IDf7PHmpL/Fz
	TKUvgqew==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59692)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pS3Ms-00064U-Fz; Tue, 14 Feb 2023 22:01:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pS3Mf-0004Fv-KA; Tue, 14 Feb 2023 22:01:29 +0000
Date: Tue, 14 Feb 2023 22:01:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, jgross@suse.com,
	richard.henderson@linaro.org, ink@jurassic.park.msu.ru,
	mattst88@gmail.com, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org,
	linux-ia64@vger.kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp,
	dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net,
	sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
	linux-xtensa@linux-xtensa.org, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	paulmck@kernel.org
Subject: Re: [PATCH v2 03/24] arm/cpu: Make sure arch_cpu_idle_dead() doesn't
 return
Message-ID: <Y+wEubLjgDQDIbSO@shell.armlinux.org.uk>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <ed361403b8ee965f758fe491c47336dddcfb8fd5.1676358308.git.jpoimboe@kernel.org>
 <Y+ttS0japRCzHoFM@shell.armlinux.org.uk>
 <20230214183926.46trlpdror3v5sk5@treble>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214183926.46trlpdror3v5sk5@treble>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Feb 14, 2023 at 10:39:26AM -0800, Josh Poimboeuf wrote:
> On Tue, Feb 14, 2023 at 11:15:23AM +0000, Russell King (Oracle) wrote:
> > On Mon, Feb 13, 2023 at 11:05:37PM -0800, Josh Poimboeuf wrote:
> > > arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
> > > BUG().
> > > 
> > > BUG() is preferable to unreachable() because BUG() is a more explicit
> > > failure mode and avoids undefined behavior like falling off the edge of
> > > the function into whatever code happens to be next.
> > 
> > This is silly. Just mark the function __noreturn and be done with it.
> > If the CPU ever executes code past the "b" instruction, it's already
> > really broken that the extra instructions that BUG() gives will be
> > meaningless.
> > 
> > This patch does nothing except add yet more bloat the kernel.
> > 
> > Sorry, but NAK.
> 
> Problem is, the compiler can't read inline asm.  So you'd get a 
> "'noreturn' function does return" warning.
> 
> We can do an unreachable() instead of a BUG() here if you prefer
> undefined behavior.

That's fine.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
