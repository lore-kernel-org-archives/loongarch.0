Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D82906
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 18:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A56C433EF;
	Tue, 14 Feb 2023 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676399969;
	bh=VUyVoBOPBRmm9kWmhRlnQ1dgekqLXP/lAdmRs2vUMTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpZhSArqYygzNfbZKNGcjvcTwNhca/C7bB1TE9FeTvJzAGZ57uFNUzzPGzNzsq1aM
	 4IwTbCrGHlO+gqUw6Cp2q/T2qzl7oKte7MwDQz3JJi48nhvnLQCL1v829eNQdq9Aor
	 LJVTO1gCw8Wqh+EF1lyZn0MKGT3Ec/hk02S8MnRgX0DmrxuAmOlKntBx/Pr6tIPS3P
	 UaoMve8gjEVjIQnN7Xv3/b6rQXg6ophd0y2EU0ZaIVvjRNs9aPXNsY3eMvCBJTI6nZ
	 dK8MWYE95qwTxoUjEPw8XF0TFH3j6Cs9OS5l4B44f43ifxIJVskUOqIj8+/+LqMtdo
	 WhjmwIG948hmQ==
Date: Tue, 14 Feb 2023 10:39:26 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <20230214183926.46trlpdror3v5sk5@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <ed361403b8ee965f758fe491c47336dddcfb8fd5.1676358308.git.jpoimboe@kernel.org>
 <Y+ttS0japRCzHoFM@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+ttS0japRCzHoFM@shell.armlinux.org.uk>

On Tue, Feb 14, 2023 at 11:15:23AM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 13, 2023 at 11:05:37PM -0800, Josh Poimboeuf wrote:
> > arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
> > BUG().
> > 
> > BUG() is preferable to unreachable() because BUG() is a more explicit
> > failure mode and avoids undefined behavior like falling off the edge of
> > the function into whatever code happens to be next.
> 
> This is silly. Just mark the function __noreturn and be done with it.
> If the CPU ever executes code past the "b" instruction, it's already
> really broken that the extra instructions that BUG() gives will be
> meaningless.
> 
> This patch does nothing except add yet more bloat the kernel.
> 
> Sorry, but NAK.

Problem is, the compiler can't read inline asm.  So you'd get a 
"'noreturn' function does return" warning.

We can do an unreachable() instead of a BUG() here if you prefer
undefined behavior.

-- 
Josh
