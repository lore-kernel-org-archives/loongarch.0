Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C050256F
	for <loongarch@lists.linux.dev>; Mon, 19 Sep 2022 10:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=QBURQn+mxYjA6ZNht+ExoGHyL1lX5y6iU6jaWv/bZEo=; b=eB9R5mWQ/WETD9Rv4elTwBcjuu
	3r70NEYVBnbUdskYPN4O7fQWjT5rx89Gozkd32cpNZ/DdpjkqOPcM2ZQMXDWVhHDcgNaBFI6Jwa5K
	jZlaLCyq8FzucFYNqVPdMhsS45njG1/lz41uhN1wd67+kWfBn+YPZCXx1mMIqejRnKQw+i57eO/l7
	ID7qXfyai+mZMUC4XVmyeqZlX16jg3lxRfae32iZHZIy8xa3fqW49G2roydHcf8lCPYqodsh5e1Zs
	gWuRPDkOYylki6VgB9yxMLQL/c8XExe1Qv4N0dIhFasMn3vBkSUDOfaq0Y0VATr4VkkUQXotE0SEb
	dazCrrUQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDq9-004bCR-PG; Mon, 19 Sep 2022 10:17:25 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 78240302F62;
	Mon, 19 Sep 2022 12:16:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 8C73F2BAC75BF; Mon, 19 Sep 2022 12:16:22 +0200 (CEST)
Message-ID: <20220919101522.842219871@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 19 Sep 2022 12:00:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Cc: richard.henderson@linaro.org,
 ink@jurassic.park.msu.ru,
 mattst88@gmail.com,
 vgupta@kernel.org,
 linux@armlinux.org.uk,
 ulli.kroll@googlemail.com,
 linus.walleij@linaro.org,
 shawnguo@kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de,
 festevam@gmail.com,
 linux-imx@nxp.com,
 tony@atomide.com,
 khilman@kernel.org,
 catalin.marinas@arm.com,
 will@kernel.org,
 guoren@kernel.org,
 bcain@quicinc.com,
 chenhuacai@kernel.org,
 kernel@xen0n.name,
 geert@linux-m68k.org,
 sammy@sammy.net,
 monstr@monstr.eu,
 tsbogend@alpha.franken.de,
 dinguyen@kernel.org,
 jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi,
 shorne@gmail.com,
 James.Bottomley@HansenPartnership.com,
 deller@gmx.de,
 mpe@ellerman.id.au,
 npiggin@gmail.com,
 christophe.leroy@csgroup.eu,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 hca@linux.ibm.com,
 gor@linux.ibm.com,
 agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com,
 svens@linux.ibm.com,
 ysato@users.sourceforge.jp,
 dalias@libc.org,
 davem@davemloft.net,
 richard@nod.at,
 anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net,
 tglx@linutronix.de,
 mingo@redhat.com,
 bp@alien8.de,
 dave.hansen@linux.intel.com,
 x86@kernel.org,
 hpa@zytor.com,
 acme@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 namhyung@kernel.org,
 jgross@suse.com,
 srivatsa@csail.mit.edu,
 amakhalov@vmware.com,
 pv-drivers@vmware.com,
 boris.ostrovsky@oracle.com,
 chris@zankel.net,
 jcmvbkbc@gmail.com,
 rafael@kernel.org,
 lenb@kernel.org,
 pavel@ucw.cz,
 gregkh@linuxfoundation.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 daniel.lezcano@linaro.org,
 lpieralisi@kernel.org,
 sudeep.holla@arm.com,
 agross@kernel.org,
 bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org,
 anup@brainfault.org,
 thierry.reding@gmail.com,
 jonathanh@nvidia.com,
 jacob.jun.pan@linux.intel.com,
 atishp@atishpatra.org,
 Arnd Bergmann <arnd@arndb.de>,
 yury.norov@gmail.com,
 andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk,
 dennis@kernel.org,
 tj@kernel.org,
 cl@linux.com,
 rostedt@goodmis.org,
 pmladek@suse.com,
 senozhatsky@chromium.org,
 john.ogness@linutronix.de,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 bsegall@google.com,
 mgorman@suse.de,
 bristot@redhat.com,
 vschneid@redhat.com,
 fweisbec@gmail.com,
 ryabinin.a.a@gmail.com,
 glider@google.com,
 andreyknvl@gmail.com,
 dvyukov@google.com,
 vincenzo.frascino@arm.com,
 Andrew Morton <akpm@linux-foundation.org>,
 jpoimboe@kernel.org,
 linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org,
 linux-perf-users@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-xtensa@linux-xtensa.org,
 linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org,
 linux-arch@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH v2 37/44] arm,omap2: Use WFI for omap2_pm_idle()
References: <20220919095939.761690562@infradead.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

arch_cpu_idle() is a very simple idle interface and exposes only a
single idle state and is expected to not require RCU and not do any
tracing/instrumentation.

As such, omap2_pm_idle() is not a valid implementation. Replace it
with a simple (shallow) omap2_do_wfi() call.

Omap2 doesn't have a cpuidle driver; but adding one would be the
recourse to (re)gain the other idle states.

Suggested-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm/mach-omap2/pm24xx.c |   51 +------------------------------------------
 1 file changed, 2 insertions(+), 49 deletions(-)

--- a/arch/arm/mach-omap2/pm24xx.c
+++ b/arch/arm/mach-omap2/pm24xx.c
@@ -116,50 +116,12 @@ static int omap2_enter_full_retention(vo
 
 static int sti_console_enabled;
 
-static int omap2_allow_mpu_retention(void)
-{
-	if (!omap2xxx_cm_mpu_retention_allowed())
-		return 0;
-	if (sti_console_enabled)
-		return 0;
-
-	return 1;
-}
-
-static void omap2_enter_mpu_retention(void)
+static void omap2_do_wfi(void)
 {
 	const int zero = 0;
 
-	/* The peripherals seem not to be able to wake up the MPU when
-	 * it is in retention mode. */
-	if (omap2_allow_mpu_retention()) {
-		/* REVISIT: These write to reserved bits? */
-		omap_prm_clear_mod_irqs(CORE_MOD, PM_WKST1, ~0);
-		omap_prm_clear_mod_irqs(CORE_MOD, OMAP24XX_PM_WKST2, ~0);
-		omap_prm_clear_mod_irqs(WKUP_MOD, PM_WKST, ~0);
-
-		/* Try to enter MPU retention */
-		pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_RET);
-
-	} else {
-		/* Block MPU retention */
-		pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_ON);
-	}
-
 	/* WFI */
 	asm("mcr p15, 0, %0, c7, c0, 4" : : "r" (zero) : "memory", "cc");
-
-	pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_ON);
-}
-
-static int omap2_can_sleep(void)
-{
-	if (omap2xxx_cm_fclks_active())
-		return 0;
-	if (__clk_is_enabled(osc_ck))
-		return 0;
-
-	return 1;
 }
 
 static void omap2_pm_idle(void)
@@ -169,16 +131,7 @@ static void omap2_pm_idle(void)
 	if (omap_irq_pending())
 		return;
 
-	error = cpu_cluster_pm_enter();
-	if (error || !omap2_can_sleep()) {
-		omap2_enter_mpu_retention();
-		goto out_cpu_cluster_pm;
-	}
-
-	omap2_enter_full_retention();
-
-out_cpu_cluster_pm:
-	cpu_cluster_pm_exit();
+	omap2_do_wfi();
 }
 
 static void __init prcm_setup_regs(void)


