Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F8107B7
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=feq3IC/5/KiRJvfHlVv2CcC6RUdK5q3PrTHL48yu34g=; b=IY8/3BJNJqlfYIiiRrZQQvZRUI
	zXN8H4czV7EjZe5bPaMktsEvmq8U8pjvTYyya4cup7cL54SMKx0ge7QbY/CCsvf5wXCv2iPz0GOx4
	E5tXkN8wXUf2WObc0lbe9bNZO8+jSngczSvjZgzbXVzX/MMqHq4sFtiuakUAYJPlM1M9zqdQJlIfr
	V07xAJElzJ+Whli8AotdwvSsa63tFe/X5tzZIWB6YKO486nz1mePmMAAZDniIvhIYll/bwnB7VTq7
	8wf/BdqedSuWIZnXNdaxjhsP+/0iN78krPZrjnhtZAPNPNRdu+yIjI4AmWeyCmWxNir6FF+aWsTDw
	k/OkNWFg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41016)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pRtHe-0005Jd-PH; Tue, 14 Feb 2023 11:15:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pRtHP-0003rk-Gx; Tue, 14 Feb 2023 11:15:23 +0000
Date: Tue, 14 Feb 2023 11:15:23 +0000
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
Message-ID: <Y+ttS0japRCzHoFM@shell.armlinux.org.uk>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <ed361403b8ee965f758fe491c47336dddcfb8fd5.1676358308.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed361403b8ee965f758fe491c47336dddcfb8fd5.1676358308.git.jpoimboe@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Feb 13, 2023 at 11:05:37PM -0800, Josh Poimboeuf wrote:
> arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
> BUG().
> 
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.

This is silly. Just mark the function __noreturn and be done with it.
If the CPU ever executes code past the "b" instruction, it's already
really broken that the extra instructions that BUG() gives will be
meaningless.

This patch does nothing except add yet more bloat the kernel.

Sorry, but NAK.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
