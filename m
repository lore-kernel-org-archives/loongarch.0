Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4937C2CAB
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 07:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B3EC433AA;
	Tue, 14 Feb 2023 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676358440;
	bh=lVxYhY4OwwDPhm8BTwwcRy+JxjuJw8OgWEbHa0amaW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fcUSoKqULJqLPku9lRFSHdbPaNeODYe/R1sZzjrR3VRHqcq59Tm9wERqJ6PlHQrjn
	 5GeWqya8mNwLITuoLWSAvRpjgR3SdVziUkPO9YsYEIi1QSukk7EUS9aKdkfWfOxlAO
	 wYjLK997WLSPPi0UzLKNSA6lD26mGt+cEcDEsvqdQMTTD3geXcDD/U9CExxmKiegju
	 C8HPMNKcuZCM+retZCnUY1hx60pKE2mQSPyq6ne+xt6jgv18ltv46AT4IlPKwLgjF+
	 KccGkJXMroepuqfZj6Fbx4rYWNFKt9XuiLi9CgivFSVeZiuhzrxK+XEv+28NZ52XHL
	 ujubifvv+6/4A==
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
Subject: [PATCH v2 17/24] x86/cpu: Make sure play_dead() doesn't return
Date: Mon, 13 Feb 2023 23:05:51 -0800
Message-Id: <11e6ac1cf10f92967882926e3ac16287b50642f2.1676358308.git.jpoimboe@kernel.org>
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

After commit 076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead()
return"), play_dead() never returns.  Make that more explicit with a
BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/x86/include/asm/smp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index b4dbb20dab1a..8f628e08b25a 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -96,6 +96,7 @@ static inline void __cpu_die(unsigned int cpu)
 static inline void play_dead(void)
 {
 	smp_ops.play_dead();
+	BUG();
 }
 
 static inline void smp_send_reschedule(int cpu)
-- 
2.39.1

