Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3E77B
	for <loongarch@lists.linux.dev>; Thu, 16 Feb 2023 18:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CB1C433A1;
	Thu, 16 Feb 2023 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676572735;
	bh=hl1r8WrgBVR11XLM9TAiwDCXOTiVcQCDtFTYvOcE4vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzcnRjPVAqaK3xKlZe1yzpskS9/WG+OMTloaSFKzBMCxOCkoRpNuoRNYa/3zPKJnz
	 6X0jJD8EJrjs7EW5Q3nhsFDWki1qsGGw5El1PvFSJCXlOCmUN+Sd3mN6zTUEUZzc4/
	 mNsCR3739yEFXFsyMHHJMQQvHiwVXyBZTBiMAN1UkqOhmnVWUd9WCzEFvocuiDiV1c
	 Eo7Y6nPnKYPTibCQ+j4JWOC/6OWWtqMh3gcXtNFiAG9L8vY3DcfS2b9I9DQMeEJSOl
	 hm19TO6FpEAODpm1nGfmYEAKY8rl2vEswAXObCCmDbCHiycLI4GP13uQYuypXaWSs7
	 6xGJABLDdsOig==
Date: Thu, 16 Feb 2023 10:38:51 -0800
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
Subject: [PATCH v2.1 03/24] arm/cpu: Add unreachable() to arch_cpu_idle_dead()
Message-ID: <20230216183851.s5bnvniomq44rytu@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <ed361403b8ee965f758fe491c47336dddcfb8fd5.1676358308.git.jpoimboe@kernel.org>
 <Y+ttS0japRCzHoFM@shell.armlinux.org.uk>
 <20230214183926.46trlpdror3v5sk5@treble>
 <Y+wEubLjgDQDIbSO@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+wEubLjgDQDIbSO@shell.armlinux.org.uk>

arch_cpu_idle_dead() doesn't return.  Make that visible to the compiler
with an unreachable() code annotation.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 0b8c25763adc..441ea5cff390 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -382,6 +382,8 @@ void arch_cpu_idle_dead(void)
 		: "r" (task_stack_page(current) + THREAD_SIZE - 8),
 		  "r" (current)
 		: "r0");
+
+	unreachable();
 }
 #endif /* CONFIG_HOTPLUG_CPU */
 
-- 
2.39.1

