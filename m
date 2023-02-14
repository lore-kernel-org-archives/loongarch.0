Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FCC2CAB
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 07:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7744CC433AE;
	Tue, 14 Feb 2023 07:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676358412;
	bh=Ya58HiCcymNeXiDsDrSrB3MVa42ANSTnVDrYM/I8DGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o1g46MnmwcBx8T5+mpqxpWg9RNiPGwxWh7u50+UbvVV/HCNE/CzztVflEM53qxglv
	 YYK/YrY0Q9V6xIHds9bSBH9HN0lqUKa6Z1xe3cfCjxpSNsspagp2pNbL0WMNKEQ0Rx
	 pzr+HaAh9N3K2/cV0XtAVxzNNCB75oEBpHNITqIRR27J3mfkFgz/r562+bVXahSIST
	 IY0Pnmrhw/r9K8+6kstkVaj4pLQJnS5iSYM8p9up4WRV2EcZ3VkSKGVUgn+3GYoIew
	 SCyrNFtXGmtYxVMosYI0z60anWodjY2gKyCCb0H5AEcAnHnT5mlvQpZIVvTrKYjllD
	 UOkJrRuEY33Fg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com,
	richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	linux-csky@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	jiaxun.yang@flygoat.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	linux-sh@vger.kernel.org,
	davem@davemloft.net,
	sparclinux@vger.kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	linux-xtensa@linux-xtensa.org,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	paulmck@kernel.org
Subject: [PATCH v2 02/24] alpha/cpu: Make sure arch_cpu_idle_dead() doesn't return
Date: Mon, 13 Feb 2023 23:05:36 -0800
Message-Id: <19ffef09a175fecb783abcd44d6bcfeade2857eb.1676358308.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/alpha/kernel/process.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index d1f2e8b6b107..d0ff06eda8fa 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -63,6 +63,7 @@ void arch_cpu_idle(void)
 void arch_cpu_idle_dead(void)
 {
 	wtint(INT_MAX);
+	BUG();
 }
 #endif /* ALPHA_WTINT */
 
-- 
2.39.1

