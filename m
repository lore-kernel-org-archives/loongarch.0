Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC0C33E9
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 09:53:53 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686736431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gewkOqH+92uWmAuYgplX6+/Ly+2B4bJPgpiHXTVzXQk=;
	b=tqj22TzLcKVa7QGDJhQvthc22fxmYp1bEMbHU5gV5SM6PQpZp6kp0i2wnUwmLbjf0CLrap
	mSUv9QezTK0yVagOwlSWU4p3FaZCYsDoxKisAdNmcpgz5kGNAFT/V22PTBWuHAIYrPCxGG
	orFdcsPKRX6+ZaA+0FBbG0meTGRdNVh1nzgdwrrqYoSrf8Wi1fHshUpmA3DmqDUFuWjx1e
	KcPFi4QdkJW/dxXZ+C+hALAUKQRa4k0TioqiO2E+t6X5moXeY+B6J5VuJDjWDOYjdBCH/u
	rEWkI1MsWeRE9yznziTGCSaNXzfJWIzQy+DhqgcDCciYGItM8bNnTX/uUpCWjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686736431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gewkOqH+92uWmAuYgplX6+/Ly+2B4bJPgpiHXTVzXQk=;
	b=NSOtxM+isOfij0yNL7TltAj+Qj/tSD4ZYY6BTGce3d2MOdmAPjYcJs21kt6mU/o8eqtD8F
	i7U7+jZHzmEiIKAA==
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Nikolay
 Borisov <nik.borisov@suse.com>, "Ahmed S. Darwish" <darwi@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, linux-um@lists.infradead.org, Richard
 Henderson <richard.henderson@linaro.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Chris Zankel <chris@zankel.net>, Tom Lendacky
 <thomas.lendacky@amd.com>
Subject: Re: [patch 02/17] x86/cpu: Switch to arch_cpu_finalize_init()
In-Reply-To: <20230613224545.019583869@linutronix.de>
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.019583869@linutronix.de>
Date: Wed, 14 Jun 2023 11:53:50 +0200
Message-ID: <87legm8j4h.ffs@tglx>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 14 2023 at 01:39, Thomas Gleixner wrote:
> +	/*
> +	 * identify_boot_cpu() initialized SMT support information, let the
> +	 * core code know.
> +	 */
> +	cpu_smt_check_topology();
> +
> +	if (!IS_ENABLED(CONFIG_SMP)) {
> +		pr_info("CPU: ");
> +		print_cpu_info(&boot_cpu_data);
> +	}
> +
> +	arch_smt_update();
> +
> +	cpu_select_mitigations();

That's the wrong order. mitigations must come before the smt
update. Thanks to Boris for spotting it.

